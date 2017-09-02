//
//  main.m
//  04-继承特性
//
//  Created by 熊凯 on 2017/4/14.
//  Copyright © 2017年 熊凯. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    int age;
    @private
    int money;
}

-(int)getAge;
-(void)setAge:(int)age;

-(NSString *)getName;
-(void)setName:(NSString *)name;

@end

@implementation Person

-(int)getAge
{
    return self->age;
}
-(void)setAge:(int)age
{
    self->age = age;
}

-(NSString *)getName
{
    return self->name;
}
-(void)setName:(NSString *)name
{
    self->name = name;
}
+(void)stuTest
{
    NSLog(@"stu Test");
}

@end

@interface Student : Person
{
    //oc的继承是会将父类的的所有成员和方法不管是私有的还是公开的都继承过来，
    //所以，oc中不允许在子类中定义与父类中相同名称的成员变量,即便是私有的成员变量也不行，
    //但是子类却不能直接访问父类中的私有成员变量，可以通过方法父类继承的的可访问方法间接访问到
    
    //子类中可以定义于父类相同的方法-----那就是多态中的重写
    //int money;
}

@end
@implementation Student

-(void)setAge:(int)age
{   //super在继承中代表父类的一部分，用于直接调用父类中的方法---super只能用来调用父类的方法，不能用来访问成员变量
    //切确意思：在成员方法中代表只能调用父类的成员方法
    //         而在类方法中代表只能调用父类类方法
    NSLog(@"%d",[super getAge]);
}
+(void) test
{
    [super new];
}

-(void)test{
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *std1 = [Student new];
        NSLog(@"%@",[std1 getName]);
        //多台：重写，重载
        
        //一个类型的指针变量指向其子类的对象，再调用方法时调用的是实际所指对象的方法
        //但是如果想要访问一个只在子类中定义的成员变量和声明和实现的方法是访问不到的，因为父类中没有
        //即当一个父类类型的指针变量指向一个子类的对象时，只能访问到父类中定义的的方法和成员变量
        Person *p = std1;
        [p setAge:1];
        
        
        //对象的isa指针指向它所属类的Class对象，而类的Class对象的isa指针指向其父类Class对象
        
    }
    return 0;
}
