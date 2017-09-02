//
//  main.m
//  18-ARC
//
//  Created by 熊凯 on 2017/4/20.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Dog : NSObject

@property (nonatomic,nullable,readwrite,strong) Person *person;

@end

@implementation Dog

-(void)dealloc
{
    NSLog(@"Dog dealloc");
}
@end

@interface Person : NSObject
{
    ///property所要对应的成员变量的指针是强指针还是弱指针也要一致否则编译不通过
    //如下显示声明了一个强指针的_dog3成员变量，而property中的dog3指定为weak弱指针了，两只指针的强弱类型不一致
    //Dog *_dog3;
}

@property (nonatomic,nullable,readwrite,strong) Dog *dog;

@property (nonatomic,nullable,readwrite,weak) Dog *dog2;

@property (nonatomic,nullable,readwrite,weak) Dog *dog3;

@end

@implementation Person

-(void)dealloc
{
    NSLog(@"Person dealloc");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //ARC为xcode的特新帮我们自动生成内存管理代码
        //Automatic Reference Counting简称ARC
        //自动生成retain，release等操作引用计数器的代码，来完成内存管理
        //在ARC模式下，是不允许自己调用retain，release，retainCount代码，包括@property也不要使用retain参数可以使用strong代替
        //允许重写dealloc方法但不允许添加[super dealloc]代码。
        
        //但是ARC是怎么知道我么你在什么时候不需要再用某个对象而release的呢？
        //ARC的判断准则，只要没有强引用指针指向该对象，那么该对象的就会被释放，即ARC判断在没有强指针引用该对象的位置就生成release代码用于释放对象
        //当一个变量指向某个对象就会retain一次；当一个变量不再指向某个对象就会release一次
        
        //强指针：默认情况向都为强指针,,,,修饰符__strong
        NSString *str1 = @"123";//强指针，默认为__strong修饰符
        __strong NSString *str2 = @"321";//强指针，显示指定修饰符__strong
        
        
        //弱指针：需要显示指定,,,,修饰符__weak
        //弱指针不能决定对象要不要被回收，只要没有强指针变量指向该对象就会被回收，而其他引用该对象的弱引用变量也会被置空
        //如果一个对象一开始创建就赋值给一个弱指针变量，那么这个对象一创建就会被释放
        __weak NSString *str3 = @"321";//弱指针，显示指定修饰符__weak
        
        
        //@property指定成员变量指针类型为强指针还是弱指针的参数组：strong（强指针），weak（若指针）
        Dog *dog = [[Dog alloc] init];
        Dog *dog2 = [[Dog alloc] init];
        Person *person = [[Person alloc] init];
        person.dog = dog;
        person.dog2 = dog2;
        person = nil;
        dog = nil;
        dog2 = nil;
        
        //如果两个对象互相引用即循环引用，那么就会出现谁都不会销毁的问题。
        //可以参考 ”16-循环retain“ 代码，
        //关于手动内存管理：循环引用问题，@property参数可以一端retain，一端assign。
        //关于ARC自动内存管理：循环引用问题，@property参数可以一端strong，一端weak；
        Dog *d = [[Dog alloc] init];
        Person *p = [[Person alloc] init];
        p.dog2 = d;
        d.person = p;
        
        //对象创建出来就使用弱指针存储，会发生刚创建完就会被回收
        __weak Dog *weakDog = [[Dog alloc] init];
        NSLog(@"weak dog = %@",weakDog);
        Dog *dog3 = [[Dog alloc] init];
        __weak Dog *weakDog2 = dog3;
        NSLog(@"weak dog2 = %@",weakDog2);
        
        //
        Person *person2 = [[Person alloc] init];
        person2.dog3 = [[Dog alloc] init];
        NSLog(@"person2 的 weak dog3 = %@",person2.dog3);
    }
    return 0;
}
