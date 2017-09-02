//
//  Animal.m
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/16.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import "Animal.h"
#import "Animal_Animal.h"

@interface Animal ()

@end

@implementation Animal

-(id)initWidthName:(NSString *)name andAge:(int)age
{
    if (self = [super init]) {
        self->_name = name;
        self->_age = age;
    }
    return self;
}

@end
