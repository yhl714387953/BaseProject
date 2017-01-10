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
    
    NSURL *URL = [NSURL URLWithString:@"http://image90.360doc.com/DownloadImg/2015/10/2621/60720533_1.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"正在下载%f", downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@     ====%@   =====%@", response, error, filePath);
        NSLog(@"错误描述：%@", error.userInfo[@"NSLocalizedDescription"]);
    }];
    
    [downloadTask resume];
    
    
    NSLog(@"~~~~~~队列数%lu id:%ld   %@", (unsigned long)manager.downloadTasks.count, downloadTask.taskIdentifier, downloadTask.currentRequest.URL.scheme);
    
}

@end
