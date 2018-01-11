//
//  DataModelManager.h
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/10.
//  Copyright © 2018年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SkyDataType) {
    SkyDataTypeDictionary = 0,//最外层是字典
    SkyDataTypeArray, //最外层是数组
    SkyDataTypeNone //是字符串
};

@interface DataModelManager : NSObject

/**
 处理data数据
 @param responseObject 原始数据
 @param dataType 数据最外层类型
 @param modelName 模型名字
 @param modelKey 解析关键字
 @return 处理完的数据数组
 */
+(NSMutableArray *)dataDealWithResponseObject:(id)responseObject dataType:(SkyDataType)dataType modelName:(NSString *)modelName modelKey:(NSString *)modelKey;
@end
