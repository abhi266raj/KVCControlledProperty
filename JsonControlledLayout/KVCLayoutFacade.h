//
//  KVCLayoutFacade.h
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCLayoutFacade : NSObject


-(void)fetchRequiredDataFromUrl:(NSString*)url WithCompletionHandler:(void (^)(void))completionHandler;
-(void)updateKVCDataOnObject:(NSObject*)object;


@end
