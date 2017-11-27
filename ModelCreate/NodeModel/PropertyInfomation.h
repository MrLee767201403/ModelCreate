//
//  PropertyInfomation.h
//  ModelCreate
//
//  Created by 李刚 on 2017/10/27.
//  Copyright © 2017年 Mr.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    
    kNSString,
    kNSNumber,
    kNull,
    kNSDictionary,
    kNSArray,
    
} PropertyType;

@interface PropertyInfomation : NSObject

/**
 *  属性类型
 */
@property (nonatomic) PropertyType  propertyType;

/**
 *  属性代表值
 */
@property (nonatomic, weak) id      propertyValue;

/**
 *  便利构造器
 *
 *  @param type          属性类型
 *  @param propertyValue 属性代表值
 *
 *  @return 实例对象
 */
+ (instancetype)propertyInfomationWithPropertyType:(PropertyType)type propertyValue:(id)propertyValue;

@end
