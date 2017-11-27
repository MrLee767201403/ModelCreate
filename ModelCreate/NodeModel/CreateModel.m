//
//  NodeModelHelper.m
//  ModelCreate
//
//  Created by 李刚 on 2017/10/27.
//  Copyright © 2017年 Mr.Lee. All rights reserved.
//

#import "CreateModel.h"
#import "NodeModel.h"
#import "NodeModelStrings.h"

@implementation CreateModel

+ (void)createModelWithJsonData:(NSDictionary *)jsonData rootModelName:(NSString *)rootModelName {
    
    NSParameterAssert(jsonData);
    NSParameterAssert(rootModelName);
    
    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        NodeModel *nodeModel = [NodeModel nodeModelWithDictionary:jsonData modelName:rootModelName level:0];
        for (NodeModel *node in nodeModel.allSubNodes) {
            NodeModelStrings *nodeModelString = [NodeModelStrings nodeModelStringsWithNodeModel:node];
            [nodeModelString createFile];
        }
        
        NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
    }
}

+ (void)ceateJsonFile:(NSDictionary *)jsonData {

    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:jsonData
                                                       options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                         error:nil];
        
        if (data) {

            [data writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/data.json"]
                   atomically:YES];
            
            NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
        }
    }
}

@end
