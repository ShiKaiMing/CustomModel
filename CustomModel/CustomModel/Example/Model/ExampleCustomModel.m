//
//  ExampleCustomModel.m
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/11.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "ExampleCustomModel.h"
@class ManModel;
@implementation ExampleCustomModel
+(void)requestDataWithType:(NSInteger)type sucessBlock:(SucessBlock)sucessBlock failureBlock:(FailureBlock)failureBlock
{
        __block ExampleCustomModel * exampleCustomModel = [[ExampleCustomModel alloc]init];
    if (type == 1) {
        NSDictionary *dic = [exampleCustomModel dictionaryForData];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        ManModel *model = [[ManModel alloc]init];
        NSMutableArray *dataArray = [DataModelManager dataDealWithResponseObject:jsonData dataType:SkyDataTypeDictionary modelName:NSStringFromClass([model class]) modelKey:@"ManList"];
        sucessBlock(dataArray);
    }
    if (type == 2) {
        NSArray *array = [exampleCustomModel arrayForData];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
        ManModel *model = [[ManModel alloc]init];
        NSMutableArray *dataArray = [DataModelManager dataDealWithResponseObject:jsonData dataType:SkyDataTypeArray modelName:NSStringFromClass([model class]) modelKey:@"ManList"];
        sucessBlock(dataArray);
    }
    if (type == 3) {
        
        NSString *string = [exampleCustomModel stringForData];
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        ManModel *model = [[ManModel alloc]init];
        NSMutableArray *dataArray = [DataModelManager dataDealWithResponseObject:data dataType:SkyDataTypeNone modelName:NSStringFromClass([model class]) modelKey:@""];
        sucessBlock(dataArray);
    }
}
- (NSDictionary *)dictionaryForData
{
    NSDictionary *dic = @{@"ManList":@[
                                  @{@"NAME":@"詹三",@"SEX":@"男",@"HOBBY":@"睡觉"},
                                  @{@"NAME":@"李四",@"SEX":@"男",@"HOBBY":@"看书"},
                                  @{@"NAME":@"王五",@"SEX":@"女",@"HOBBY":@"打架"},
                                  @{@"NAME":@"赵六",@"SEX":@"男",@"HOBBY":@"看人"},
                                  ]};
    return dic;
}
- (NSArray *)arrayForData
{
    NSArray *array = @[@{@"NAME":@"詹三",@"SEX":@"男",@"HOBBY":@"睡觉"},
                                  @{@"NAME":@"李四",@"SEX":@"男",@"HOBBY":@"看书"},
                                  @{@"NAME":@"王五",@"SEX":@"女",@"HOBBY":@"打架"},
                                  @{@"NAME":@"赵六",@"SEX":@"男",@"HOBBY":@"看人"},
                                  ];
    return array;
}
- (NSString *)stringForData
{
    NSString *string = @"大刀王五";
    return string;
}
@end

@implementation ManModel

@end
