//
//  main.m
//  06-点语法
//
//  Created by 熊凯 on 2017/4/15.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [Person new];
        [p1 setName:@"xiongkai"];
        NSLog(@"%@",[p1 name]);
        //oc中的成员变量建议使用下划线开头
        //oc中定义成员变量的getter setter方法时
        //而setter方法必须有且仅有一个参数，返回值可有可无；getter方法，必须无参数，有返回值。然后方法名如下xxx的格式就会被识别为一组getter setter方法
        //getter方法格式：变量名去掉下划线 ----如：xxx
        //setter方法格式：与java类似------set+变量名去掉下划线首字母大写---如：setXxx
        //那么点语法：oc的点语法掉用的getter setter方法而非成员变量，，，一对getter，setter方法对应的属性名称就是getter方法名称
        p1.age = 10;//---赋值时调用的是setAge方法---实质是 [p1 setAge:10]
        NSLog(@"age = %d",p1.age);//---获取值调用的是age方法---实质是[p1 age]
        
        p1.test = 10;
    }
    return 0;
}
