//
//  ViewController.m
//  ModelCreate
//
//  Created by 李刚 on 2017/10/27.
//  Copyright © 2017年 Mr.Lee. All rights reserved.
//

#import "ViewController.h"
#import "CreateModel.h"
// 生成模型后 拖进工程 然后导入头文件


@interface ViewController ()

@end

@implementation ViewController
#warning 如果没有找到生成的文件 可能是因为没有找到NodeModelStrings.plist文件 在Build Phase - Copy Bundle Resources中加入该文件即可

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 275, 30)];
    [button setTitle:@"生成模型文件" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:button];
}

- (void)loadData{
    // 1.创建url
    NSURL * url = [NSURL URLWithString:@"你请求数据的URL"];
    // 2.创建session对象
    NSURLSession * session = [NSURLSession sharedSession];
    // 系统提供的全局的NSURLSession对象，单例
    // 因为NSURLSession基于任务去完成相关的事件，所有的东西都放在任务内
    // 3.创建task请求任务
    // NSURLSessionTask就是NSURLSession任务的执行对象
    NSURLSessionTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         // 4.解析相关数据
         NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
         // 生成模型   Models文件夹下的 都是通过这句代码生成的
         // 执行完会打印出生成文件的地址，前往这个文件夹既可找到，然后拖进你的项目中就可了
        if (dict) {
            [CreateModel createModelWithJsonData:dict rootModelName:@"Model"];
        }
        
         // 默认的生成一个初始化方法
         // Model *model = [[Model alloc] initWithDictionary:dict];

        
        // 很多数据都有id这个字段，所以提供了一个后期维护的方法
        // 以StudentModel为例 我们把.h中的id属性 替换成studentID
        // 在点.m中的setValue:forUndefinedKey:方法中添加以下代码即可
        // if([key isEqualToString:@"id"]) {
        //     self.studentID = value;
        //     return;
        // }
    }];
    
    // 5.启动任务
    // 原因：NSURLSessionTask，task任务是属于挂起的状态，如果不启动，不会走block中实现的内容
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
