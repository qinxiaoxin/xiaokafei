//
//  ImageCached.h
//  xiaokafei
//
//  Created by Xin Qin on 7/31/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kIMAGE_REQUEST_CACHE_LIMIT          100
typedef void (^CompletionBlock) (UIImage *image, NSError *error);

@interface ImageCached : NSObject

@property(nonatomic, strong) NSString *str;

- (UIImage *)cachedResult;
- (void)startWithCompletion:(CompletionBlock)completion;

@end
