//
//  DataFetcher.m
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "DataFetcher.h"

@implementation DataFetcher


-(void)fetchResourceFromUrl:(NSString*)url withCompletionHandler:(void (^)(NSError *error, NSDictionary *data)) completionHandler{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            completionHandler(error,nil);
            return;
        }else{
           
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
            if (error){
                completionHandler(error,nil);
                return;
            }
            else{
                completionHandler(nil,json);
            }
            
        }
    }];
    
    [dataTask resume];
}

@end
