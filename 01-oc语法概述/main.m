//
//  main.m
//  01-oc语法概述
//
//  Created by 熊凯 on 2017/4/11.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //#import与c语言的#include作用类似，不同之处是import会自动避免重复引入文件
        //#import<>写法：直接去系统的编译器目录进行查找头文件并包含，如果不存在报错
        //#import “”写法：先找当前工程下的，如果不存在再去找编译器目录下的头文件，均没有找到报错
        // oc的所有关键字基本都是以@符号开头
        //@“”是oc字符串的书写格式
        /*基本数据类型：
         char----默认零值：‘’
         int----默认零值：0
         float---默认零值：0.0
         double---默认零值：0.0
         nil---相当于c语言中的NULL----值为0
         BOOL---YES(1)/NO(0)---别名bool---而在c语言中0代表假，非0代表真-----默认零值：NO
         Boolean----true(1)/NO(0)-----和BOOL一样只是值的别名为true，false----默认零值：false
         NSObject：对象类型------默认零值：nil或NULL
         Class：类类型---所有类被加载后会生成唯一一个类描述的对象被称为Class类型
         block：代码段
         id：万能指针
         SEL：方法选择器
         unichar:oc字符类型----type unsigned short-----两个字节长度，可以支持中文---而c语言的char长度为一个字节不支持中文
                    输出unichar使用的占位符为 %C 大写的C,,,c语言处时char使用小写的 %c
         */
        /*
         oc的输出函数NSLog(@"字符串",...)
         参数1:必须是oc格式的字符串，参数2:为可变参数，用于向参数1的格式化控制字符串的占位符进行填充
         */
        NSLog(@"true=%d;false=%d",true,false);
        NSLog(@"YES=%d;NO=%d",YES,NO);
        NSLog(@"nil=%d;NULL=%d",nil,NULL);
        NSLog(@"Hello, World!");
    }
    return 0;
}
