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

@property (nonatomic, retain) NSString *dbPath;

@end

@implementation FMDBService

#pragma mark - SQL Operations

- (void)createTable
{
    debugMethod();
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.dbPath] == NO) {
        // create it
        FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
        if ([db open]) {
            NSString * sql = @"CREATE TABLE 'User' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'password' VARCHAR(30))";
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

- (void)insertData
{
    
}

- (void)queryData
{
    
}

- (void)clearAll
{
    
}

@end
