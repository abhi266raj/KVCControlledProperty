//
//  KVCMapper.m
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "KVCMapper.h"
#import <UIKit/UIKit.h>


@implementation KVCMapper


-(void)updateKVCUsingSupportedTypeForObject:(NSObject*)object usingDict:(NSDictionary*)dict{
    NSDictionary * kvcDict = [dict objectForKey:@"kvc"];
    NSDictionary *frameDict = dict[@"frame"];
    NSDictionary *colorDict = dict[@"color"];
    if (kvcDict){
    [self updateKVCValueForObject:object usingDict:kvcDict];
    }
    if (colorDict){
    [self updateKVCColorValueForObject:object usingDict:colorDict];
    }
    if (frameDict){
    [self updateKVCRectValueForObject:object usingDict:frameDict];
    }
}



-(void)updateKVCValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict{
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try{
            [object setValue:obj forKeyPath:key];
        }@catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
    }];
    
}
-(void)updateKVCColorValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict{
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try{
            UIColor *color = [UIColor valueForKeyPath:obj];
            [object setValue:color forKeyPath:key];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
    }];
    
}
-(void)updateKVCRectValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict{
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSDictionary *frameDict = (NSDictionary*)obj;
        @try{
            CGFloat x,y,w,h;
            x = [frameDict[@"x"] floatValue];
            y = [frameDict[@"y"] floatValue];
            w = [frameDict[@"w"] floatValue];
            h = [frameDict[@"h"] floatValue];
            
            CGRect frame = CGRectMake(x, y, w, h);
            NSValue *value  = [NSValue valueWithCGRect:frame];
            [object setValue:value forKeyPath:key];
        }@catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
    }];
    
}

@end
