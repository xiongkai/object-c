//
//  Person.h
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/15.
//  Copyright © 2017年 熊凯. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    int _age;
}

-(NSString *)name;

-(void)setName:(NSString *)name;

-(int)age;

-(void)setAge:(int)age;

-(void)test;

-(int)setTest:(int)test;

@end
