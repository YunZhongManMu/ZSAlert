//
//  ZSAlertTool.m
//  FeedbackDemo
//
//  Created by 周顺 on 16/4/15.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "ZSAlertTool.h"

#define my_block(block, ...) if (block) {block(##__VA_ARGS__);}

#define iOS8 [[[UIDevice currentDevice] systemVersion] intValue] >= 8.0

@interface ZSAlertTool ()<UIAlertViewDelegate,UIActionSheetDelegate>

@property (nonatomic, copy) ConfirmHandle confirmHandle;
@property (nonatomic, copy) CancleHandle cancleHandle;
@property (nonatomic, copy) OtherHandle otherHandle;

@property (nonatomic, assign) BOOL isOneButton;

@end

@implementation ZSAlertTool

+ (ZSAlertTool *)shareInstance {
    static ZSAlertTool *_alertTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _alertTool = [[ZSAlertTool alloc] init];
    });
    return _alertTool;
}

#pragma  mark ----------------------UIAlertView--------------------------

+ (void)alertViewShowWithController:(UIViewController *)controller message:(NSString *)message  {
    [self alertViewShowWithController:controller title:@"提示" message:message confirmTitle:@"确定" confirmHandle:nil];
}

+ (void)alertViewShowWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle {
    [self alertViewShowWithController:controller title:title message:message confirmTitle:confirmTitle confirmHandle:confirmHandle cancleTitle:nil cancleHandle:nil];
}

+ (void)alertViewShowWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle {
    
    ZSAlertTool *alertTool = [self shareInstance];
    
    if (iOS8) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if (cancleTitle) {
            [alertController addAction:[UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleDefault handler:cancleHandle]];
        }
        [alertController addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:confirmHandle]];
        
        [controller presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:alertTool cancelButtonTitle:cancleTitle otherButtonTitles:confirmTitle, nil];
        [alertView show];
        
        alertTool.confirmHandle = confirmHandle;
        
        if (cancleTitle) {
            alertTool.cancleHandle = cancleHandle;
            alertTool.isOneButton = NO;
        } else {
            alertTool.isOneButton = YES;
        }
        
    }
}

#pragma  mark ----------------------UIActionSheet--------------------------
+ (void)actionSheetShowWithController:(UIViewController *)controller confirmHandle:(ConfirmHandle)confirmHandle {
    [self actionsheetShowWithController:controller title:@"提示" confirmTitle:@"确定" confirmHandle:confirmHandle cancleTitle:@"取消" cancleHandle:nil];
}

+ (void)actionsheetShowWithController:(UIViewController *)controller title:(NSString *)title confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle {
    [self actionsheetShowWithController:controller title:title confirmTitle:confirmTitle confirmHandle:confirmHandle otherTitle:nil otherHandle:nil cancleTitle:@"取消" cancleHandle:cancleHandle];
}

+ (void)actionsheetShowWithController:(UIViewController *)controller title:(NSString *)title confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle   otherTitle:(NSString *)otherTitle otherHandle:(OtherHandle)otherHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle {
   
    ZSAlertTool *alertTool = [self shareInstance];
    if (iOS8) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alertController addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:confirmHandle]];
        if (otherTitle) {
            [alertController addAction:[UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:otherHandle]];
        }
            [alertController addAction:[UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:cancleHandle]];
            [controller presentViewController:alertController animated:YES completion:nil];
    } else {
        alertTool.cancleHandle = cancleHandle;
        alertTool.confirmHandle = confirmHandle;
        UIActionSheet *actionSheet ;
        if (otherTitle) {
            actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:alertTool cancelButtonTitle:cancleTitle destructiveButtonTitle:nil otherButtonTitles:confirmTitle, otherTitle, nil];
            alertTool.otherHandle = otherHandle;
            alertTool.isOneButton = NO;
        } else {
            actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:alertTool cancelButtonTitle:cancleTitle destructiveButtonTitle:nil otherButtonTitles:confirmTitle, nil];
            alertTool.isOneButton = YES;
        }
    }
}

#pragma mark - <UIAlertViewDelegate>
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            if (_isOneButton) {
                
                my_block(self.confirmHandle);
            } else {
                
                my_block(self.cancleHandle);
            }
        }
            break;
        case 1: {
            
            my_block(self.confirmHandle);
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - <UIActionSheetDelegate>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            
            my_block(self.confirmHandle);
        }
            break;
        case 1: {
            if (_isOneButton) {
                
                my_block(self.cancleHandle);
            } else {
                
                my_block(self.otherHandle);
            }
        }
            break;
        case 2: {
            if (!_isOneButton) {
                
                my_block(self.cancleHandle);
            }
        }
            break;
        default:
            break;
    }
}

@end
