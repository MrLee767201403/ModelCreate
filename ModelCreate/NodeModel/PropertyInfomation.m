//
//  PropertyInfomation.m
//  ModelCreate
//
//  Created by 李刚 on 2017/10/27.
//  Copyright © 2017年 Mr.Lee. All rights reserved.
//

#import "PropertyInfomation.h"

@implementation PropertyInfomation

+ (instancetype)propertyInfomationWithPropertyType:(PropertyType)type propertyValue:(id)propertyValue {

    PropertyInfomation *infomation = [[[self class] alloc] init];
    
    infomation.propertyType  = type;
    infomation.propertyValue = propertyValue;
    
    return infomation;
}

@end
