//
//  KJTUrlSdk.h
//  KJTUrlSdk
//
//  Created by zxs on 2019/11/13.
//  Copyright © 2019 kjt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KJTUrlSdk : NSObject

/*
*  @brief 拉起支付宝
*  注意1:内部使用[[UIApplication sharedApplication] openURL:]支付宝，iOS10以上系统会反馈调用是否成功；iOS10以下系统没有反馈，默认为调用成功
*  注意2:本函数通过系统函数拉起支付宝，从支付宝到其他程序的二次跳转由支付宝APP完成
*  @param token 支付token
*  @param completionBlock 调用结果回调函数
*  @return 无。调用结果以异步形式由回调函数提供
*  @说明：iOS10以下系统没有调用成功与否的反馈，默认为成功
*/
+ (void)launchAliPayWithToken:(NSString *)token completion:(nullable void(^)(BOOL success, NSString *message))completionBlock;

/*
*  @brief 本framework的版本字符串
*  注意1:这里用的是Target->General下面的Build，而不是Version
*  @return 返回类似@"KJTUrlSdk-1.2.3.4"的版本字符串。
*/
+ (NSString *)versionString;

#pragma mark - 环境切换函数，测试的时候要用
/*
*  @brief 切换支付宝连接快捷通生产环境
*  注意1: 支付宝是正式版的，连接的是快捷通的生产环境
*  注意2: 默认的是生产环境
*  @return 无。
*/
+ (void)switchAliPayToProduct;

/*
*  @brief 切换支付宝连接快捷通准生产环境
*  注意1: 支付宝是正式版的，连接的是快捷通的准生产环境
*  注意2: 默认的是生产环境
*  @return 无。
*/
+ (void)switchAliPayToZhunProduct;

@end

NS_ASSUME_NONNULL_END


