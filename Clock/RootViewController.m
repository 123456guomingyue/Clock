//
//  RootViewController.m
//  Clock
//
//  Created by 啊啊 on 14-2-12.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _datePick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 30, 320, 216)];
    [_datePick setBackgroundColor:[UIColor lightGrayColor]];
    [_datePick setDatePickerMode:UIDatePickerModeTime];
    [self.view addSubview:_datePick];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 270,100, 30)];
    [button setTitle:@"设定闹钟" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clock:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    NSDate *now = [NSDate date];
    [_datePick setDate:now animated:YES];
    
    
    
    [button release];
    [_datePick release];
}

-(void)clock:(id)sender{

    

    UILocalNotification * local = [[UILocalNotification alloc] init];
    
    
    local.fireDate = _datePick.date;
    local.alertBody = @"闹钟";
    local.soundName = UILocalNotificationDefaultSoundName;
    
    //添加到程序中（获得的指针）
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
    
    
    
    
    [local release];
//    [dateFormatter release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
