//
//  ImageCached.m
//  xiaokafei
//
//  Created by Xin Qin on 7/31/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ImageCached.h"

NSMutableDictionary *_inflight;
NSCache *_imageCache;

@implementation ImageCached

- (NSMutableDictionary *)inflight
{
    if(!_inflight)
    {
        _inflight = [NSMutableDictionary dictionary];
    }
    return _inflight;
}

- (NSString *)str
{
    if (!_str) {
        _str = [[NSString alloc] init];
    }
    
    return _str;
}

- (NSCache *)imageCache
{
    if (!_imageCache) {
        _imageCache = [[NSCache alloc] init];
        _imageCache.countLimit = kIMAGE_REQUEST_CACHE_LIMIT;
    }
    
    return _imageCache;
}

- (YYImage *)cachedResult
{
    return [self.imageCache objectForKey:self.str];
}

- (void)startWithCompletion:(CompletionBlock)completion
{
    YYImage *image = [self cachedResult];
    if (image) {
        return completion(image,nil);
    }
    
    NSMutableArray *inflightCompletionBlocks = [self.inflight objectForKey:self.str];
    if (inflightCompletionBlocks) {
        [inflightCompletionBlocks addObject:completion];
    }else{
        if (self.str) {
            [self.inflight setObject:[NSMutableArray arrayWithObject:completion] forKey:self.str];
            YYImage *image = [YYImage imageNamed:self.str];
            [self.imageCache setObject:image forKey:self.str];
            
            id value = [self.inflight objectForKey:self.str];
            [self.inflight removeObjectForKey:self.str];
            
            for(CompletionBlock block in (NSMutableArray *)value) {
                block(image,nil);
            }
        }else{
            [self.inflight removeObjectForKey:self.str];
            completion(nil, nil);
        }
        
    }

}


@end
