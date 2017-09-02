//
//  main.m
//  13-set方法的内存管理
//
//  Created by 熊凯 on 2017/4/17.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation Book:NSObject
{
    NSString *_name;
}
-(void)dealloc
{
    NSLog(@"book dealloc");
    //[super dealloc];
}
@end

@implementation Person:NSObject
{
    Book *_book;
}
-(void)setBook:(Book *)book
{
    /*setter方法内存管理需要先对旧的对象release来，因为_book将引用新的对象，而不再引用旧的对象那么需要将旧的对象计数器-1，即调用旧对象的release；接着是它将引用新的对象，那么要将新的对象计数器+1，即调用新对象的retain方法
    if(self->_book != book){
        if(self->_book){
            [self->_book release];
        }
        self->_book = [book retain];
     }
     */
    self->_book = book;
}
-(Book *)book
{
    return self->_book;
}
-(void)dealloc//内存管理中一般需要重写该方法，用于当前对象被回收时来释放其引用的其他对象
{
    /*
     当前对象被回收，那么在回收之前需要将其引用的其他oc对象进行release来将所引用的对象的计数器-1
     if(self->_book){
        [self->_book release];
     }
     */
    NSLog(@"person dealloc");
    //[super dealloc];必须在最后一行调用父类的dealloc方法释放父类的资源
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Book *book1 = [[Book alloc]init];//book1计数器为：1-----book1初次创建自动retain计数器增加1
        Person *person1 = [[Person alloc]init];//person1计数器为：1-----person1初次创建自动retain计数器增加1
        person1.book = book1;//book1计数器为：2----setBook方法----person1对象引用book1需要将book1计数器增加1
        //[person1 release];//person1计数器为：0，即person1被回收他所引用的其他对象会自动release一次，此时book1的计数器为：1
        //如果将上面的[person1 release]改为[book1 release],那么book1的计数器为：1，而person1的计数器也为：1
        //而book1变量已经是指针，book1对象已经成为僵尸对象，而person1仍然指向了该僵尸对象
    }
    return 0;
}
