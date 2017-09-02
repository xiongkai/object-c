//
//  main.m
//  02-oc类型BOOL
//
//  Created by 熊凯 on 2017/4/11.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // nil---相当于c语言中的NULL----值为0
        //BOOL---YES(1)/NO(0)---别名bool--本质为typedef singed char BOOL-而在c语言中0代表假，非0代表真
        //Boolean----true(1)/NO(0)----本质为typedef unsinged char Boolean----和BOOL一样只是值的别名为true，false
        NSLog(@"Hello, World!");
    }
    return 0;
}
