//
//  main.m
//  17-autorelease
//
//  Created by 熊凯 on 2017/4/20.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation Person:NSObject

+(Person *)instance
{
    return [[[Person alloc] init] autorelease];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {//自动释放池----数据结构为栈
        
        
        //每一个类都有一个成员方法：autorelease
        //作用：将对象放到autoreleasepool自动释放池中，并返回当前对象本身,autorelease方法不会对计数器+1即不会调用retain
        //autorelease方法只有在自动释放池代码块中调用才会被放进自动释放池中
        //对于放入自动释放池中的对象可以省略release主动对计数器进行减操作
        //当自动释放池销毁时，会自动对释放池中的对象做一次release操作，而避免了手动release
        
        //将需要使用自动释放次进行管理的代码写在自动释放池代码块中
        
        
        //!!!错误写法
        /*1.调用了autorelease方法之后 又调用release方法
         Person *p = [[[Person alloc] init] autorelease];
         
         [p release];
         */
        /*2.连续多次调用autorelease方法------最后会报野指针错误：在自动释放池的对象栈中就会有重复多余的对象引用，这样当计数器为0了之后自动释放一次次还会对后续多余的对象引用进行release，那么就出现了调用一个已被回收或不可用的对象
         Person *p = [[[[Person alloc] init] autorelease] autorelease];
         */
        
        
        //没有调用系统的alloc，new，copy方法，就不需要调用release方法，
        //oc的很多类创建对象都不要调用alloc，new，copy方法，因为内部使用的是autorelease返回的对象
        
        
    }//自动释放次结束销毁-----池中管理的对象将被release计数器-1
    return 0;
}
