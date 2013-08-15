//
//  ViewController.h
//  ComprobarBateria
//
//  Created by LLBER on 14/08/13.
//  Copyright (c) 2013 Berganza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong)    UITextView * texto;

- (void)refrescar;

- (NSString*)estadoDeLaBateria:(UIDeviceBatteryState)telefono;

@end
