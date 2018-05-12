//
//  KVCLayoutFacade.m
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/12/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "KVCLayoutFacade.h"
#import "KVCMapper.h"
#import "DataFetcher.h"


@interface KVCLayoutFacade()
@property (nonatomic,strong) KVCMapper *mapper;
@property (nonatomic,strong) DataFetcher *fetcher;
@property (nonatomic,strong) NSDictionary *dataDictionary;
@end

@implementation KVCLayoutFacade


-(id)init{
    self = [super init];
    if (self){
        self.mapper = [[KVCMapper alloc]init];
        self.fetcher = [[DataFetcher alloc]init];
    }
    return self;
}

-(void)fetchRequiredDataFromUrl:(NSString*)url WithCompletionHandler:(void (^)(void))completionHandler{
    [self.fetcher fetchResourceFromUrl:url withCompletionHandler:^(NSError *error, NSDictionary *data) {
        self.dataDictionary = data;
    }];
    
}
-(void)updateKVCDataOnObject:(NSObject*)object{
    if (_dataDictionary){
    [self.mapper updateKVCValueForObject:object usingDict:_dataDictionary];
    }
    
}

@end
