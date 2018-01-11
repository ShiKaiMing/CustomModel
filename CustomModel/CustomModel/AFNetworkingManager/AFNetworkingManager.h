//
//  AFNetworkingManager.h
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/10.
//  Copyright © 2018年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 请求类型的枚举 */
typedef NS_ENUM(NSUInteger, SkyHttpRequestType)
{
    /** get请求 */
    SkyHttpRequestTypeGet = 0,
    /** post请求 */
    SkyHttpRequestTypePost
};

/**
 http通讯成功的block

 @param responseObject 返回的数据
 */
typedef void (^SkyHTTPRequestSuccessBlock)(id responseObject);

/**
 http通讯失败后的block

 @param error 返回的错误信息
 */
typedef void (^SkyHTTPRequestFailedBlock)(NSError *error);


//超时时间
extern NSInteger const kAFNetworkingTimeoutInterval;


@interface AFNetworkingManager : NSObject

/**
 *  网络请求的实例方法
 *
 *  @param type         get / post (项目目前只支持这倆中)
 *  @param urlString    请求的地址
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+ (void)requestWithType:(SkyHttpRequestType)type
              urlString:(NSString *)urlString
             parameters:(NSDictionary *)parameters
           successBlock:(SkyHTTPRequestSuccessBlock)successBlock
           failureBlock:(SkyHTTPRequestFailedBlock)failureBlock;

/**
 取消队列
 */
+(void)cancelDataTask;
@end
