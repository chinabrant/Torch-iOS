//
//  TorchViewController.m
//  Torch
//
//  Created by wusj on 13-9-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "TorchViewController.h"

@interface TorchViewController ()

@end

@implementation TorchViewController

@synthesize isLightOn;

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
    self.view.backgroundColor = [UIColor colorWithRed:65.0f/255.0f green:177.0f/255.0f blue:102.0f/255.0f alpha:1];
    
    UIButton *lightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lightButton.frame = CGRectMake(0, 0, 120, 40);
    lightButton.center = CGPointMake(160, self.view.frame.size.height / 2);
    [lightButton setTitle:@"Open" forState:UIControlStateNormal];
    [lightButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [lightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [lightButton addTarget:self action:@selector(openOrClose:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lightButton];
    
    device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 判断是否存在闪光灯
    if (![device hasTorch]) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"" message:@"当前设备没有闪光灯" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alter show];
        
        [lightButton setEnabled:NO];
    }
    
    isLightOn = NO;
}

- (void)openOrClose:(UIButton *)button {
    if (isLightOn) {
        [self turnOnTorch:NO];
        isLightOn = NO;
        [button setSelected:NO];
    } else {
        [self turnOnTorch:YES];
        isLightOn = YES;
        [button setSelected:YES];
    }
}

// 是否打开手电筒
-(void) turnOnTorch:(bool)on
{
    [device lockForConfiguration:nil];
    if (on) {
        [device setTorchMode:AVCaptureTorchModeOn];
    } else {
        [device setTorchMode: AVCaptureTorchModeOff];
    }
    
    [device unlockForConfiguration];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
