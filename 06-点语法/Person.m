//
//  Person.m
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/15.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import "Person.h"

@implementation Person

-(int)age
{
    return self->_age;
}

-(void)setAge:(int)age
{
    self->_age = age;
}

-(NSString *)name
{
    return self->_name;
}

-(void)setName:(NSString *)name
{
    self->_name = name;
}

-(void)test
{
    NSLog(@"get test");
}

-(int)setTest:(int)test
{
    NSLog(@"set test");
    return 0;
}

@end
