//
//  ViewController.m
//  BaseProject
//
//  Created by L's on 16/8/18.
//  Copyright © 2016年 L's. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "JSTableViewController.h"
//#import "JSTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    NSURL *URL = [NSURL URLWithString:@"http://example.com/file.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* task = [session downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
     */
    
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
    
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jsTBVC:(UIButton *)sender {
    JSTableViewController* vc = [[JSTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end
