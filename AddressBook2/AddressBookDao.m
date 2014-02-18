#import "AddressBookDao.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "AddressBook.h"
#import "AddressBook.h"

#define DB_FILE_NAME @"addressBook2.db"

#define SQL_CREATE @"CREATE TABLE IF NOT EXISTS addressBooks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, tel TEXT, email TEXT);"
#define SQL_INSERT @"INSERT INTO addressBooks (name, tel, email) VALUES (?, ?, ?);"
#define SQL_EDIT   @"UPDATE addressBooks set name = ?, tel = ?, email = ? WHERE id = ?;"
#define SQL_UPDATE @"UPDATE addressBooks SET name = ?, tel = ?, email = ? WHERE id = ?;"
#define SQL_SELECT @"SELECT id, name, tel, email FROM addressBooks GROUP BY name, tel;"
#define SQL_DELETE @"DELETE FROM addressBooks WHERE id = ?;"

@interface AddressBookDao ()
@property(nonatomic, copy) NSString *dbPath;

- (FMDatabase *)getConnection;

+ (NSString *)getDbFilePath;
@end

@implementation AddressBookDao

#pragma mark - Lifecycle methods

/**
 * インスタンスを初期化します。
 *
 * @return 初期化後のインスタンス。
 */
- (id)init
{
    self = [super init];
    if (self) {
        FMDatabase *db = [self getConnection];
        [db open];
        [db executeUpdate:SQL_CREATE];
        [db close];
    }

    return self;
}

/**
 * メモリを解放します。
 */
- (void)dealloc
{
    self.dbPath = nil;
}

#pragma mark - Public methods

/**
 * 書籍を追加します。
 *
 * @param addressBook 書籍。
 *
 * @return 成功時は識別子を割り当てられた書籍。失敗時は nil。
 */
- (AddressBook *)add:(AddressBook *)addressBook
{
    FMDatabase *db = [self getConnection];
    [db open];

    [db setShouldCacheStatements:YES];
    if ([db executeUpdate:SQL_INSERT, addressBook.name, addressBook.tel, addressBook.email]) {
        addressBook.id = [db lastInsertRowId];
    }
    else {
        addressBook = nil;
    }

    [db close];

    return addressBook;
}

/**
 * 書籍コレクションを取得します。
 *
 * @return 書籍コレクション。
 */
- (NSArray *)addressBooks
{
    FMDatabase *db = [self getConnection];
    [db open];

    FMResultSet *results = [db executeQuery:SQL_SELECT];
    NSMutableArray *addressBooks = [[NSMutableArray alloc] initWithCapacity:0];

    while ([results next]) {
        AddressBook *addressBook = [[AddressBook alloc] init];
        addressBook.id = [results intForColumnIndex:0];
        addressBook.name = [results stringForColumnIndex:1];
        addressBook.tel = [results stringForColumnIndex:2];
        addressBook.email = [results stringForColumnIndex:3];

        [addressBooks addObject:addressBook];
    }

    [db close];

    return addressBooks;
}

/**
 * 書籍を削除します。
 *
 * @param addressBookId
 *
 * @return 成功時は YES。それ以外は NO。
 */
- (BOOL)remove:(NSInteger)addressBookId
{
    FMDatabase *db = [self getConnection];
    [db open];

    BOOL isSucceeded = [db executeUpdate:SQL_DELETE, [NSNumber numberWithInteger:addressBookId]];

    [db close];

    return isSucceeded;
}

/**
 * 書籍を更新します。
 */
- (BOOL)update:(AddressBook *)addressBook
{
    FMDatabase *db = [self getConnection];
    [db open];

    BOOL isSucceeded = [db executeUpdate:SQL_UPDATE, addressBook.name, addressBook.tel, addressBook.email, [NSNumber numberWithInteger:addressBook.id]];

    [db close];

    return isSucceeded;
}

#pragma mark - Private methods

/**
 * データベースを取得します。
 *
 * @return データベース。
 */
- (FMDatabase *)getConnection
{
    if (self.dbPath == nil ) {
        self.dbPath = [AddressBookDao getDbFilePath];
    }

    return [FMDatabase databaseWithPath:self.dbPath];
}

/**
 * データベース ファイルのパスを取得します。
 */
+ (NSString *)getDbFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];

    return [dir stringByAppendingPathComponent:DB_FILE_NAME];
}

@end
