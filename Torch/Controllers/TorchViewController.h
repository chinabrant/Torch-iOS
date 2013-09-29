//
//  TorchViewController.h
//  Torch
//
//  Created by wusj on 13-9-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TorchViewController : BaseViewController {
    AVCaptureDevice *device;
    BOOL isLightOn;
}

@property (nonatomic) BOOL isLightOn;

@end
