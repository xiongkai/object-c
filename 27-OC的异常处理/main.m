//
//  main.m
//  27-OC的异常处理
//
//  Created by 熊凯 on 2017/5/5.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject
{
    @public
    int a;
}

- (void) test;

@end

@implementation Test


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //和java的类似,但是没有java的异常处理强大，并不是运行期间的异常都可以捕获到
        //如：oc的异常处理是捕获不到c语言异常的，，如下所示的：除数为0的的运行时异常就捕获不了，程序还是会因此中断
        //如：oc的异常处理对oc的一些异常也是捕获不到的，如下所示的：一个指针变量的值为nil时调用所发生的异常还是捕获不到而导致程序终止
        
        //因此在oc中的异常处理在实际应用中并不常用，一般使用逻辑判断来避免异常
        @try {
//            Test *test = [[Test alloc] init];
//            [test test];
            
//            int a = 1;
//            int b = 0;
//            int c = a / b;
            
            Test *t = nil;
            t->a = 1;
            
        } @catch (NSException *exception) {
            NSLog(@"catch:%@",exception);
        } @finally {
            NSLog(@"finally");
        }
    }
    return 0;
}
