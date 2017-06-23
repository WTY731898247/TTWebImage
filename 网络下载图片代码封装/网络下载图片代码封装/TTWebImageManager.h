//
//  TTWebImageManager.h
//  网络下载图片代码封装
//
//  Created by 吴天益 on 2017/6/23.
//  Copyright © 2017年 ttt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TTWebImageManager : NSObject

+(instancetype)sharedManager;

-(void)loadImageWithUrlString:(NSString *)urlString completionBlock:(void(^)(UIImage *))completionBlock;
@end
