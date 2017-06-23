//
//  ViewController.m
//  网络下载图片代码封装
//
//  Created by 吴天益 on 2017/6/23.
//  Copyright © 2017年 ttt. All rights reserved.
//

#import "ViewController.h"
#import "TTCostomOperation.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "TTModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *TTImageView;

@property(nonatomic,strong)NSOperationQueue *queue;

@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.queue=[[NSOperationQueue alloc] init];
    
    [self loadData];

}


#pragma mark
#pragma mark - 加载数据
-(void)loadData{
    
    NSString *urlString=@"https://raw.githubusercontent.com/zhangxiaochuZXC/SHHM06/master/apps.json";
    
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // AFN会自动的JSON数据进行反序列化 : responseObject就是JSON反序列化完成后的结果
        NSArray *dictArr = responseObject;
        self.dataArray = [NSArray yy_modelArrayWithClass:[TTModel class] json:dictArr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    
}

#pragma mark
#pragma mark - 点击屏幕
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    //设置占位图
    self.TTImageView.image=[UIImage imageNamed:@"logo"];
    
    //随机获取数组中的模型
    TTModel *model=self.dataArray[arc4random_uniform((uint32_t)self.dataArray.count)];
    
    
    //实例化自定义operation
    TTCostomOperation *operation=[TTCostomOperation loadImageWithUrlString:model.icon useImageBlock:^(UIImage *image) {
        self.TTImageView.image=image;
    }];
    
    
    
    [self.queue addOperation:operation];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
