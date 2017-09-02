//
//  main.m
//  09-构造方法
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

//重写父类的init初始化方法
-(id)init
{
    //调用父类的init方法对父类中的成员变量进行初始化
    //并将super init的返回值再复制给self是为了避免在嗲用父类初始化方法是release掉self所指向的内存空间并重新alloc新的空间
    self = [super init];
    self.name = @"123";
    return self;
}
//构造方法只能是成员方法
-(id)initWidthName:(NSString *)name
{
    if (self = [super init]) {
        self->_name = name;
    }
    return self;
}

-(instancetype)initWidthName:(NSString *)name andAge:(int)age
{
    if (self = [super init]) {
        self->_name = name;
        self->_age = age;
    }
    return self;
}

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
        //在创建对象进行初始化时，会从该类的顶级父类开始进行
        //alloc用于分配内存空间；init用于进行对象的初始化
        //之前都是使用new类方法进行创建对象，但oc不建议使用，而是使用如下方式进行：先使用alloc进行内存空间分配，再使用init进行初始化
        People *p = [[People alloc]init];
        p.age = 10;
        //init为默认的初始化方法，我们可以定义自己的初始化方法，用于让对象创建后的成员变量指定我们想要的默认初始值
        NSLog(@"name = %@",p.name);
        
        People *p1 = [[People alloc]initWidthName:@"xiongkaikai"];
        p1 = [[People alloc]initWidthName:@"liushishi" andAge:12];
        NSLog(@"name = %@",p1.name);
        
        //构造方法的返回值类型
        //1.NSObject指针类型:----缺陷：访问不到实际类型中的方法及成员变量--需要强制类型转换
        //1:当前类类型指针-----缺陷：当子类调用时返回时却是父类指针类型
        //2:id----缺陷：只能访问方法，而无法使用点语法和直接访问成员变量
        //3:instancetype：---完美推荐---返回的实际创建的类型即当前类的指针类型
        
        //实例对象的创建：如果是定义一个类方法用于创建实例对象，那么最好将 类名 使用 self 替换
        
        //判断一个对象是否为某个类的实例：
        NSString *testStr = @"123";
        NSLog(@"is object of class NSString:%@",[testStr isKindOfClass:[NSString class]]? @"YES" : @"NO");
    }
    return 0;
}
