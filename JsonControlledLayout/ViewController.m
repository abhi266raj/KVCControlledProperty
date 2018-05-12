//
//  ViewController.m
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/11/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "ViewController.h"
#import <KVCLayout/KVCLayoutFacade.h>


@interface ViewController ()
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) KVCLayoutFacade *layoutHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *data = @{ @"frame":@{
                                    @"_button":@{
                                            @"x":@(0),
                                            @"y":@(1),
                                            @"w":@(100),
                                            @"h":@(100),
                                            }
                                
                                },
                            @"color":@{
                                    
                                    },
                            @"kvc":@{
                                    
                                    },
                           };
    self.button = [UIButton new];
    self.button.backgroundColor = [UIColor valueForKeyPath:@"greenColor"];
   // self.button addTa
    [self.button addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    self.layoutHelper = [KVCLayoutFacade new];
    [self update];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)update{
    [self.layoutHelper fetchRequiredDataFromUrl:@"http://192.168.1.101/data.json" WithCompletionHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view setNeedsLayout];
            [self viewWillLayoutSubviews];
            [self setNeedsFocusUpdate];
        });
       
       
    }];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGRect frame = CGRectMake(100, 100, 100, 100);
    
   
    [self.layoutHelper updateKVCDataOnObject:self];
   // [self setValue:@(100) forKey:@"_button.frame.origin.x"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
