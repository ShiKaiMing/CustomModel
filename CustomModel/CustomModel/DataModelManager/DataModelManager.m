//
//  DataModelManager.m
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/10.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "DataModelManager.h"
#import "MJExtension.h"

@interface DataModelManager()
+(instancetype)sharedAFManager;
@end
@implementation DataModelManager
static DataModelManager *aManager;
+ (DataModelManager *)sharedAFManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aManager =  [[[super class] alloc]init];
    });
    return aManager;
}
+(NSMutableArray *)dataDealWithResponseObject:(id)responseObject dataType:(SkyDataType)dataType modelName:(NSString *)modelName modelKey:(NSString *)modelKey
{
    //处理二进制数据
    NSString *biteObject = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
    //过滤无用字符
    biteObject = [[self sharedAFManager] filtrationString:biteObject deleteStringArray:@[@"\r\n",@"\n",@"\t"]];
    //整理
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (!skyStringIsEmpty(biteObject)) {
        
        if (dataType == SkyDataTypeNone) {
            //是字符串
           dic[modelName] = @[biteObject];
        }
        
        if (dataType == SkyDataTypeDictionary) {
            NSData *data = [biteObject dataUsingEncoding:NSUTF8StringEncoding];
            //最外层是字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [dic addEntriesFromDictionary:dict];
        }
        
        if (dataType == SkyDataTypeArray) {
            
            NSData *data = [biteObject dataUsingEncoding:NSUTF8StringEncoding];
            //最外层是数组
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            dic[modelName] = array;
        }
    }
    //解析
    NSMutableArray *modelArray = [NSMutableArray array];
    //是字符串
    if (dataType == SkyDataTypeNone) {
        [modelArray addObjectsFromArray:dic[modelName]];
    }
    //最外层是字典
    if (dataType == SkyDataTypeDictionary) {
        [modelArray addObjectsFromArray:[NSClassFromString(modelName) mj_objectArrayWithKeyValuesArray:dic[modelKey]]];
    }
    //最外层是数组
    if (dataType == SkyDataTypeArray) {
        [modelArray addObjectsFromArray:[NSClassFromString(modelName) mj_objectArrayWithKeyValuesArray:dic[modelName]]];
    }
    

    return modelArray;
}

#pragma mark --- 去除字符
-(NSString *)filtrationString:(NSString *)String deleteStringArray:(NSArray *)deleteStringArray
{
    if (String == NULL || [String isEqualToString:@""]) {
        return @"";
    }
    NSMutableString *str1 = [NSMutableString stringWithString:String];
    for (int i = 0; i<deleteStringArray.count; i++) {
        NSRange range = [str1 rangeOfString:deleteStringArray[i]];
        while (range.location != NSNotFound) {
            [str1 deleteCharactersInRange:range];
            range = [str1 rangeOfString:deleteStringArray[i]];
        }
    }
    return str1;
    
}
@end
