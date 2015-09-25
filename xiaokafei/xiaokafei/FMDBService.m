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
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dbPath] == NO) {
//        debugMethod();
        // create it
        FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
        if ([db open]) {
            //create table of 6
            for (int i = 0; i < 6; i++) {
                NSString * sql = [NSString stringWithFormat:@"CREATE TABLE 'table%d' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'price' VARCHAR(30))",i];
                BOOL res = [db executeUpdate:sql];
                if (!res) {
                    debugLog(@"error when creating db table%d",i);
                } else {
                    debugLog(@"succ to creating db table%d",i);
                }
            }
            
            [db close];
        } else {
            debugLog(@"error when open db");
        }
    }
    
}

- (void)insertData:(NSDictionary *)dic tableTag:(NSInteger)tag
{
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
//        debugMethod();
        NSString * sql = [NSString stringWithFormat:@"insert into table%ld (name, price) values(?, ?) ",(long)tag];
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

- (NSMutableArray *)queryData:(NSInteger)tag
{
    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:10];
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
//        debugMethod();
        NSString * sql = [NSString stringWithFormat:@"select * from table%ld",(long)tag];
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            NSString * name = [rs stringForColumn:@"name"];
            NSString * price = [rs stringForColumn:@"price"];
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:name,@"name",price,@"price",nil];
            [array addObject:dic];
        }
        [db close];
    }
    
    return array;
}

- (void)deleteData:(NSString *)name tableTag:(NSInteger)tag
{
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    NSString *userStr;
    if ([db open]) {
//        debugMethod();
        NSString * sql1 = [NSString stringWithFormat:@"select id from table%ld where name = ?",(long)tag];
        FMResultSet * rs = [db executeQuery:sql1,name];
        while ([rs next]) {
            int tableId = [rs intForColumn:@"id"];
            userStr = [NSString stringWithFormat:@"%d",tableId];
        }
        
        NSString * sql2 = [NSString stringWithFormat:@"delete from table%ld where id = ?",(long)tag];
        BOOL res = [db executeUpdate:sql2,userStr];
        if (!res) {
            debugLog(@"error to delete db data");
        } else {
            debugLog(@"succ to deleta db data");
        }
        [db close];
    }
}

- (void)clearAllData:(NSInteger)tag
{
    NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"user.sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
//        debugMethod();
        NSString * sql = [NSString stringWithFormat:@"delete from table%ld",(long)tag];
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
