//
//  main.m
//  20-protocol
//
//  Created by 熊凯 on 2017/4/24.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Myprotocol <NSObject>//协议的祖宗是协议NSObject

@required//methond1为必须实现
-(void)methond1;

@optional//methond2和methond3可选实现
-(void)methond2:(NSString *)name;

+(void)methond3;

@end

@protocol Myprotocol2

-(void)methond1;
@optional
@property int propro;

@end

//用于声明一个名称如Myprotocol3为一个protocol协议，类似@class用于声明一个名称为一个类
//使用场景和@class一样，一般在.h文件中要用到某个protocol和class时使用@protocol和@class，在.m文件再导入对应的protocol和class的头文件
@protocol Myprotocol3;

@protocol Myprotocol4 <Myprotocol,Myprotocol2,Myprotocol3>//一个协议继承一个或多个protocol的格式

-(void)methond1;

@end

@protocol Myprotocol3

-(void)methond1;

@end

@class MyClass2;

@interface MyClass : NSObject <NSObject,Myprotocol,Myprotocol4>//一个类继承一个或多个protocol的格式

//限制obj对象必须是继承了Myprotocol2协议的类型
@property (nonatomic,nullable,readwrite,strong) MyClass2<Myprotocol2> *obj;

@end

@implementation MyClass

-(void)methond1
{
    NSLog(@"methond1");
}

-(void)methond2:(NSString *)name
{
    NSLog(@"methond2---%@",name);
}

+(void)methond3
{
    NSLog(@"methond3");
}

@end

@interface MyClass2 : NSObject <Myprotocol2>

@end

@implementation MyClass2

-(void)methond1
{
    NSLog(@"methond1");
}

-(void)methond2:(NSString *)name
{
    NSLog(@"methond2---%@",name);
}

+(void)methond3
{
    NSLog(@"methond3");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //protocol相当于java里面的接口，但是只能声明方法而和属性不能定义成员变量
        //声明的属性不会自动生成getter setter方法和成员变量的，需要手动实现或写@synthesize
        //而且protocol并不能作为一种类型，所以不能用来声明一个变量
        //那么一个遵循了某个protocol的类，是否需要实现protocol的所有方法呢？
        /*
         @required:必须实现，默认。------只是会报警告，而不会报错
         @optional:可选实现。------实现或不实现都不会有警告
         
         当一个类或一个protocol遵循了多个protocol，而这些protocol有多个相同的方法那么相同的方法就会覆盖并不会报错或警告
         
         NSObject：所有类的基类；其实还有一个同名的NSObject基协议protocol
         基类NSObject其实实现了基协议NSobject
         */
        MyClass *myClass = [[MyClass alloc] init];
        [myClass methond2:@"xk"];
        
        //当声明一个变量时，在类型后使用  <协议名>  形式可以限制创建的对象必须是继承了该协议的类型
        /*一般要声明一个遵循某一个协议的参数或变量时会使用NSObject<协议名>来进行限定----只能调用到NSObject和协议中声明的方法
         但是不能将两个都实现了相同协议的一个对象赋值给另一种类型的变量如：MyClass<NSObject> *a = [[NSObject alloc] init];
         因为只要继承了该协议即可匹配，而不需要住类型也匹配和java中的接口类似
         也可以使用id<协议名>形式声明类型。---即可以调用到所指对象中的所有方法，但是不能使用点语法和直接访问成员变量
         也可以限定指向的对象必须同时实现了多个协议：NSObject<协议1，协议2，...> 或id<协议1，协议2，....>
         */
        MyClass<Myprotocol2> *myClass2 = [[MyClass alloc] init];
        [myClass2 methond2:@"xk2"];
        myClass2.obj = [[MyClass2 alloc] init];
        [myClass2.obj methond2:@"xk3"];
        myClass2.obj = [[NSObject alloc] init];
        [myClass2.obj description];
        //myClass2.propro = 2;
        
        
        NSObject<Myprotocol2> *myClass3 = [[MyClass alloc] init];
        [myClass3 methond1];
        id<Myprotocol2> myClass4 = [[MyClass alloc] init];
        [myClass4 methond1];
        
        //MyClass<NSObject> *a = [[NSObject alloc] init];
        myClass2 = [[MyClass2 alloc] init];
    }
    return 0;
}
