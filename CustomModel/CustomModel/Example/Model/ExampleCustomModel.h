//
//  ExampleCustomModel.h
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/11.
//  Copyright © 2018年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SucessBlock) (NSMutableArray *dataArray);
typedef void (^FailureBlock) (NSError *error);
@interface ExampleCustomModel : NSObject
//请求
@property (nonatomic,strong)SucessBlock sucessBlock;
@property (nonatomic,strong)FailureBlock failureBlock;

+(void)requestDataWithType:(NSInteger)type sucessBlock:(SucessBlock)sucessBlock failureBlock:(FailureBlock)failureBlock;
@end

@interface ManModel : NSObject
@property (nonatomic,strong)NSString *NAME;
@property (nonatomic,strong)NSString *SEX;
@property (nonatomic,strong)NSString *HOBBY;
@end
