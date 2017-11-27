//
//  NodeModelHelper.h
//  ModelCreate
//
//  Created by 李刚 on 2017/10/27.
//  Copyright © 2017年 Mr.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//
//// Used in swift
//
//let data     = NSData(contentsOfURL: NSURL(string: "http://www.duitang.com/album/1733789/masn/p/0/100/")!)
//let jsonData = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! [String : AnyObject]
//CreateModel.createModelWithJsonData(jsonData, rootModelName: "ResposeData")

@interface CreateModel : NSObject

/**
 *  获取json数据并推出控制器
 *
 *  @param jsonData      json数据
 *  @param rootModelName model名字
 */
+ (void)createModelWithJsonData:(NSDictionary *)jsonData rootModelName:(NSString *)rootModelName;

/**
 *  生成json数据
 *
 *  @param jsonData json数据
 */
+ (void)ceateJsonFile:(NSDictionary *)jsonData;

@end
