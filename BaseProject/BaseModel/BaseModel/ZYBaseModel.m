//
//  ZYBaseModel.m
//  BaseProject
//
//  Created by L's on 2017/1/5.
//  Copyright © 2017年 L's. All rights reserved.
//

#import "ZYBaseModel.h"
#import <AFNetworking.h>

@implementation ZYBaseModel

+(NSMutableArray<ZYBaseModel *> *)forgeBaseModel{
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        ZYBaseModel* model = [[ZYBaseModel alloc] init];
        model.name = [NSString stringWithFormat:@"这不是蠢蠢么%d", i];
        [array addObject:model];
    }

    return array;
}

+(void)getModels{
    NSURLSessionConfiguration* configration = [[NSURLSessionConfiguration alloc] init];
    AFURLSessionManager* manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configration];
    
    NSURL* url = [NSURL URLWithString:@"www.baidu.com"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
}

@end
