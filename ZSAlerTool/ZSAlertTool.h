//
//  ZSAlertTool.h
//  FeedbackDemo
//
//  Created by 周顺 on 16/4/15.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**  确定回调  */
typedef void(^ConfirmHandle)();

/** 取消回调  */
typedef void(^CancleHandle)();

/** 其他回调 */
typedef void(^OtherHandle)();

/**
 *  封装提示框，为了便捷使用，包括UIAlertView和UIActionSheet
 *
 *  适配iOS8，内部自动选择使用UIAlertView或者UIAlertController
 */
@interface ZSAlertTool : NSObject

/**
 *  UIAlertView
 *
 *  默认为标题为 － 提示     确定按钮
 *
 *  @param controller       controller
 *  @param message       message
 */
+ (void)alertViewShowWithController:(UIViewController *)controller message:(NSString *)message ;

/**
 *  UIAlertView
 *
 *  @param controller              controller
 *  @param title                        title
 *  @param message              message
 *  @param confirmTitle          confirm按钮标题
 *  @param confirmHandle     confirm按钮回调
 */
+ (void)alertViewShowWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle;

/**
 *  UIAlertView
 *
 *  @param controller               controller
 *  @param title                         title
 *  @param message               message
 *  @param confirmTitle           confirm按钮标题
 *  @param confirmHandle      confirm按钮回调
 *  @param cancleTitle             取消按钮标题
 *  @param cancleHandle        取消按钮回调
 */
+ (void)alertViewShowWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle;


/**
 *  UIActionSheet
 *
 *  默认为标题为 － 提示             确定按钮和取消按钮
 *
 *  @param controller               controller
 *  @param confirmHandle      点击确定回调
 */
+ (void)actionSheetShowWithController:(UIViewController *)controller confirmHandle:(ConfirmHandle)confirmHandle;

/**
 *  UIActionSheet
 *
 *  @param controller               controller
 *  @param title                         title
 *  @param confirmTitle           confirm按钮标题
 *  @param confirmHandle      confirm按钮回调
 *  @param cancleTitle             取消按钮标题
 *  @param cancleHandle        取消按钮回调
 */
+ (void)actionsheetShowWithController:(UIViewController *)controller title:(NSString *)title confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle;

/**
 *  UIActionSheet
 *
 *  @param controller               controller
 *  @param title                         title
 *  @param confirmTitle           confirm按钮标题
 *  @param confirmHandle      confirm按钮回调
 *  @param otherTitle               other按钮标题
 *  @param otherHandle          other按钮回调
 *  @param cancleTitle             取消按钮标题
 *  @param cancleHandle        取消按钮回调
 */
+ (void)actionsheetShowWithController:(UIViewController *)controller title:(NSString *)title confirmTitle:(NSString *)confirmTitle confirmHandle:(ConfirmHandle)confirmHandle   otherTitle:(NSString *)otherTitle otherHandle:(OtherHandle)otherHandle cancleTitle:(NSString *)cancleTitle cancleHandle:(CancleHandle)cancleHandle;


@end
