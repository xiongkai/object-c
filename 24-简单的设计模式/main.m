//
//  main.m
//  24-简单的设计模式
//
//  Created by 熊凯 on 2017/5/3.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*1.单例模式：一个类的的对象始终只有一个相同对象
         alloc方法：用于分配内存空间创建一个对象-----实质上alloc内部调用的是方法allocWithZone方法，该方法才是真正分配内存空间创建对象的方法
         
         单例：
         +(instancetype)allocWithZone:(struct _NSZone *)zone
         {
            static id instance = nil;
            if(instance == nil)
            {
                instance = [super allocWithZone:zone];
            }
            return instance;
         }
        */
    }
    return 0;
}
