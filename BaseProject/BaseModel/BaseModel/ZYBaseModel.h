//
//  ZYBaseModel.h
//  BaseProject
//
//  Created by L's on 2017/1/5.
//  Copyright © 2017年 L's. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYBaseModel : NSObject

@property (nonatomic, copy) NSString* name;

+(NSMutableArray<ZYBaseModel*>*)forgeBaseModel;

+(void)getModels;

@end
