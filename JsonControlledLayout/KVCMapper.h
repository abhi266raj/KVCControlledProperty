//
//  KVCMapper.h
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCMapper : NSObject

//EXpected dict or json
//NSDictionary *data = @{ @"frame":@{
//@"_button":@{
//@"x":@(0),
//@"y":@(1),
//@"w":@(100),
//@"h":@(100),
//}
//
//},
//@"color":@{
//
//},
//@"kvc":@{
//
//},
//};
-(void)updateKVCUsingSupportedTypeForObject:(NSObject*)object usingDict:(NSDictionary*)dict;
-(void)updateKVCValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict;
-(void)updateKVCColorValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict;
-(void)updateKVCRectValueForObject:(NSObject*)object usingDict:(NSDictionary*)dict;

@end
