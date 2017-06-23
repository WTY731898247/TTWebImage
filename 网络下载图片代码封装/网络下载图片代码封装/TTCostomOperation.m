//
//  TTCostomOperation.m
//  网络下载图片代码封装
//
//  Created by 吴天益 on 2017/6/23.
//  Copyright © 2017年 ttt. All rights reserved.
//

#import "TTCostomOperation.h"

@interface TTCostomOperation ()

@property (nonatomic,copy) NSString *urlString;

@property (nonatomic,copy) void(^useImageBlock)(UIImage *image) ;

@end

@implementation TTCostomOperation

#pragma mark
#pragma mark - 实例化类方法
+(instancetype)loadImageWithUrlString:(NSString *)urlString useImageBlock:(void (^)(UIImage *))useImageBlock{
    
    TTCostomOperation *operation=[TTCostomOperation new];
    
    //把网络字符串和完成后赋值操作全局化
    operation.urlString=urlString;
    
    operation.useImageBlock=useImageBlock;
    
    return operation;
}


#pragma mark
#pragma mark - 自定义operation不管执行什么都会自动走这个方法,子线程环境
-(void)main{
    
    NSURL *url=[NSURL URLWithString:self.urlString];
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    

    
    //耗时操作
    UIImage *image=[UIImage imageWithData:data];
    
    //把image回调出去进行UI操作,主线程
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if(_useImageBlock){
            _useImageBlock(image);
        }
    }];
    
    
    
    
}


@end
