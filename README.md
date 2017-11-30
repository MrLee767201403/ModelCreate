#ModelCreate
一句代码生成数据模型

你只需要下载我的项目，然后使用的你URL运行，既可自动生成数据模型，

然后根据打印的路径，找到模型文件，拖进你的工程

对于和关键字冲突的字段，使用的时候，自己手动改一下就行

    // 1.创建url
    NSURL * url = [NSURL URLWithString:@"你请求的URL"];
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

#效果图
运行后会自动打印出文件地址
![image](https://github.com/MrLee767201403/ModelCreate/blob/master/QQ20171130-135848%402x.png)

前往文件夹
![image](https://github.com/MrLee767201403/ModelCreate/blob/master/QQ20171130-135929%402x.png)

这些就是自动生成的模型文件了,直接拖进自己的工程使用就行
![image](https://github.com/MrLee767201403/ModelCreate/blob/master/QQ20171130-135946%402x.png)

随便打开一个看一下, 对于字段于关键字冲突的,我们提供了后期维护的方法,按照图片所示,对.h和.m文件稍加修改即可
![image](https://github.com/MrLee767201403/ModelCreate/blob/master/QQ20171130-140223%402x.png)

这是.m文件
![image](https://github.com/MrLee767201403/ModelCreate/blob/master/QQ20171130-140543%402x.png)
