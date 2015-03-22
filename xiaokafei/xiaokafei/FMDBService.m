//
//  FMDBService.m
//  xiaokafei
//
//  Created by Xin Qin on 1/30/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "FMDBService.h"
#import "FMDB.h"


@interface FMDBService()

@end

@implementation FMDBService


#pragma mark - SQL Operations

- (void)createTable
{
    debugMethod();
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dbPath] == NO) {
        // create it
        FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
        if ([db open]) {
            NSString * sql = @"CREATE TABLE 'user' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'price' VARCHAR(30))";
            BOOL res = [db executeUpdate:sql];
            if (!res) {
                debugLog(@"error when creating db table");
            } else {
                debugLog(@"succ to creating db table");
            }
            [db close];
        } else {
            debugLog(@"error when open db");
        }
    }
    
}

- (void)insertData:(NSDictionary *)dic
{
    debugMethod();
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = @"insert into user (name, price) values(?, ?) ";
        NSString * name = [dic valueForKeyPath:@"name"];
        NSString * price = [dic valueForKeyPath:@"price"];
        BOOL res = [db executeUpdate:sql, name, price];
        if (!res) {
            debugLog(@"error to insert data");
        } else {
            debugLog(@"succ to insert data");
        }
        [db close];
    }
}

- (NSMutableArray *)queryData
{
    debugMethod();
    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:10];
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = @"select * from user";
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
//            int userId = [rs intForColumn:@"id"];
            NSString * name = [rs stringForColumn:@"name"];
            NSString * price = [rs stringForColumn:@"price"];
//            debugLog(@"user id = %d, name = %@, price = %@", userId, name, price);
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:name,@"name",price,@"price",nil];
            [array addObject:dic];
        }
        [db close];
    }
    
    return array;
}

- (void)deleteData:(NSString *)name
{
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    NSString *userStr;
    if ([db open]) {
        NSString * sql1 = @"select id from user where name = ?";
        FMResultSet * rs = [db executeQuery:sql1,name];
        while ([rs next]) {
            int userId = [rs intForColumn:@"id"];
            userStr = [NSString stringWithFormat:@"%d",userId];
        }
        
        NSString * sql2 = @"delete from user where id = ?";
        BOOL res = [db executeUpdate:sql2,userStr];
        if (!res) {
            debugLog(@"error to delete db data");
        } else {
            debugLog(@"succ to deleta db data");
        }
        [db close];
    }
}

- (void)clearAllData
{
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = @"delete from user";
        BOOL res = [db executeUpdate:sql];
        if (!res) {
            debugLog(@"error to delete db data");
        } else {
            debugLog(@"succ to deleta db data");
        }
        [db close];
    }
}

@end
