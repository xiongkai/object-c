//
//  main.m
//  12-内存管理概述
//
//  Created by 熊凯 on 2017/4/17.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    NSString *_name;
}
@property int age;
@property NSString *name;
@end

@implementation Person
-(void)dealloc
{
    NSLog(@"Person dealloc");
    if(_name != nil){
        [_name release];
    }
    [super dealloc];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //oc的内存管理范围只对继承了NSObject的类创建的对象，对其他类型则无效（int，float，double，char ，struct，enum等无效）
        //oc对象为引用赋值，而其他类型为值传递；值传递即将实际值进行复制一份进行复制，而引用传递是将对象的地址复制给变量
        
        //引用计数器：
        //1.每个oc对象内部都有一个4字节的计数器，表示对象被引用的次数，，
        //    当该计数器的值为0时，表示该对象没有被引用了，就会被回收；当该计数器不为0时，除非推出程序就不会被回收
        //2.计数器的操作
        //     给对象发送一个retain消息，就可以让该对象的引用计数器+1，并返回当前对象
        //     给对象发送一个release消息，就可以让该对象的引用计数器-1
        //     给对象发送一个retainCount消息，就可以让该对象当前引用计数器的数值
        
        //对象销毁的操作：当一个对象的引用数为0时，将会被系统销毁回收内存
        //1.系统回收对象时，会自动发送一个dealloc消息，所以不要自己调用dealloc方法
        //     一般会重写dealloc方法，进行资源的释放--释放该对象引用的其他对象
        //     一旦重写了dealloc方法，就必须调用[super dealloc]，而且要放到最后调用
        
        //1.此时的计数器为：1
        Person *p = [[Person alloc]init];
        NSLog(@"retainCount = %lu",[p retainCount]);
        //2.此时的计数器为：2
        [p retain];
        //3.此时的计数器为：1
        [p release];
        //4.此时的计数器为：0
        //release只是让计数器-1，，此时计数器虽然为0但不代表回收内存，而是说计数器为0的对象没有其他地方引用他，为可回收状态，即为僵尸对象
        //但是此时的变量p的指针并没有清空，还是能访问到僵尸对象，指向僵尸对象的指针称为也指针
        [p release];
        //5.第四步时p所指向的对象已经为一个僵尸对象，僵尸对象的内存空间是不可用的，那么p为野指针，使用野指针访问对象，会出现不可预料的错误
        //[p retain]//对于已经成为僵尸对象的对象，即便retain也不可能将一个僵尸对象变为可用
        //[p release];
        
        //oc中不存在空指针错误，给空指针发送消息不会报错--------
        //但是使用结构体的访问属性的 -> 直接访问成员变量会报错---因为->符号并不是oc的发送消息而是直接取值，oc对象本质为一个结构体
        //空指针代表变量未指向任何对象，即指针变量值为nil，NULL或0；
    }
    return 0;
}
