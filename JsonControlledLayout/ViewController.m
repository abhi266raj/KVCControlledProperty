//
//  ViewController.m
//  JsonControlledLayout
//
//  Created by AbhirajKumar on 5/11/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *button;

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
    [self.view addSubview:self.button];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGRect frame = CGRectMake(100, 100, 100, 100);
    
    [self setValue: [NSValue valueWithCGRect:frame] forKeyPath:@"_button.frame"];
   // [self setValue:@(100) forKey:@"_button.frame.origin.x"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
