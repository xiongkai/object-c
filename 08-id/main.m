//
//  main.m
//  08-id
//
//  Created by 熊凯 on 2017/4/16.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
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

@implementation People

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSObject为所有类的父类即基类
        //但是NSObject类型的指针变量指向其子类时，该变量访问其子类中定义的方法时，由于NSObject中没有该方法而不能通过编译而报错
        //这和java类似
        
        //但是针对这种情况OC中新增一种万能指针类型：id
        
        //id也是一种数据类型--万能指针，可以指向货操作任何oc对象,,其中已经包含了*号，即本身就为一种指针类型，相当于NSObject *
        //但是与NSObject不同的是id类型的变量和其实际类型的指针变量功效一样，可以直接调用其所指对象的方法，而不会报错
        //但是不能使用[点语法]，因为点语法适用于getter setter或者说是操作成员变量的简写方式,
        //而且也不能直接访问成员变量，即id类型的变量只能访问方法
        //id类型能接受任何oc对象，，，id类型的变量都能赋值给其实际类的指针变量而不需要进行转换
        id p = [People new];
        [p setAge:10];
        //p.name = @"xkkkk";
        [p setName:@"xkkk"];
        
        NSLog(@"age = %d name = %@",[p age],[p name]);
    }
    return 0;
}
