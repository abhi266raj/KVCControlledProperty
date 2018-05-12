//
//  DataFetcher.h
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFetcher : NSObject
-(void)fetchResourceFromUrl:(NSString*)url withCompletionHandler:(void (^)(NSError *error, NSDictionary *data)) completionHandler;

@end
