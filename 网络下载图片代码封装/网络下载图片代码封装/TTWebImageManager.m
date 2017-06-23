//
//  TTWebImageManager.m
//  网络下载图片代码封装
//
//  Created by 吴天益 on 2017/6/23.
//  Copyright © 2017年 ttt. All rights reserved.
//

#import "TTWebImageManager.h"
#import "TTCostomOperation.h"
#import "TTModel.h"

@interface TTWebImageManager ()

@property(nonatomic,strong)NSOperationQueue *queue;


@end

@implementation TTWebImageManager

//单例
+(instancetype)sharedManager{
    
    static id intance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //实例化管理者
        intance=[self new];
    });
    
    return intance;
}

-(instancetype)init{
    if(self=[super init]){
       
        //实例化队列
        _queue=[[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark
#pragma mark - 使用url字符串加载网络图片
-(void)loadImageWithUrlString:(NSString *)urlString completionBlock:(void (^)(UIImage *))completionBlock{
    

    //把从外界获取的字符串和block传递给自定义的operation
   TTCostomOperation *operation=[TTCostomOperation loadImageWithUrlString:urlString useImageBlock:^(UIImage *image) {
        
        //把从operation传递过来加载好的图片传递出去
        if(completionBlock){
            completionBlock(image);
        }
    }];
  
    [self.queue addOperation:operation];
    
    
}
@end
