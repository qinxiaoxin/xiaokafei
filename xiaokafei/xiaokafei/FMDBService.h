//
//  FMDBService.h
//  xiaokafei
//
//  Created by Xin Qin on 1/30/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBService : NSObject

- (void)createTable;
- (void)insertData:(NSDictionary *)dic tableTag: (int)tag;
- (NSMutableArray *)queryData:(int)tag;
- (void)deleteData:(NSString *)name tableTag: (int)tag;
- (void)clearAllData:(int)tag;

@end
