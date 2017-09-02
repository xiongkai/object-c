//
//  main.m
//  07-property/synthesize
//
//  Created by 熊凯 on 2017/4/15.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person :NSObject
{
    int _money;
    int _age;
    NSString *_name;
    //int _test;
    int aaa;
    int xxx;
}
@property int age,money;
@property NSString *name;
@property int test;
@property int bbb;
@property int yyy;
@end

@implementation Person
@synthesize age = _age,money = _money,name = _name;
@synthesize bbb = aaa;
@synthesize yyy = zzz;
-(int)haha
{
    return _test;//自动生成了_test成员变量
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //之前提到点语法，会自动调用对应的getter setter方法，而getter setter方法的声明和实现都是自己手写的
        //oc提供了@property帮助自动生成getter setter 方法声明;@synthesize帮助自动生成getter setter方法的实现
        //@property只能写在类的声明中，@synthesize只能写在类的实现中
        /*
         @interface Person :NSObject
         {
            int _money;
            int _age;
            NSString *_name;
         }
         //xcode编译会自动生成getter setter方法：-(void)setAge:(int)age   和 -(int)age   的声明
         //相同数据类型的可以以逗号分隔属性变量声明为一条@property
         //在未定义对应的@synthesize的情况：
        //  默认是与 _属性名 的成员变量对应，如果该成员变量不存在自动生成私有的 _属性名 的成员变量，如果存在则不会自动再生成该成员变量
         @property int age,[money];
         @property NSString *name;//private NSString *_name;
         @end
         
         @implementation Person
         
         //xcode编译会自动生成getter setter方法的实现，其中age对应与类声明中@property int age，
         //可以以逗号分隔同时指定属性与成员变量的对应关系
         //@synthesize用于指定与对应的@property 的成员变量的对应关系
         //如果未明确对应的成员变量名 如@synthesize age； 那么则age属性默认与age成员变量对应，如果age成员变量存在则不会自动生成，否则生成私有的age成员变量
         //如果指定了对应的成员变量名 如@synthesize age = _age；那么age属性就与_age成员变量对应，如果_age成员变量存在则不会自动生成，反之生成是有的_age
         //实质上@property会自动完成@synthesize的事情，不写@synthesize部分也可以
         @synthesize age = _age,[money = _money],[name = _name];
         
         //如果自己实现了getter方法或setter方法，那么自动生成就不会帮我们生成已经自己声明或实现的部分
         ／*相当于如下代码
         -(void)setAge:(int)age
         {
         self->_age = age;
         }
         -(int)age
         {
         return self->_age;
         }
         *／
         
         @end
         
         */
        Person *person1 = [Person new];
        person1.age = 10;
        person1.name = @"xiongkai";
        NSLog(@"age = %d ; name = %@",person1.age,person1.name);
    }
    return 0;
}
