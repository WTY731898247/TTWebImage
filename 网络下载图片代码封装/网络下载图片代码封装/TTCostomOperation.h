//
//  TTCostomOperation.h
//  网络下载图片代码封装
//
//  Created by 吴天益 on 2017/6/23.
//  Copyright © 2017年 ttt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTCostomOperation : NSOperation


+(instancetype)loadImageWithUrlString:(NSString *)urlString useImageBlock:(void(^)(UIImage *))useImageBlock;

@end
