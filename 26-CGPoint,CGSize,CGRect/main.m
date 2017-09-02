//
//  main.m
//  26-CGPoint,CGSize,CGRect
//
//  Created by 熊凯 on 2017/5/3.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Foundation框架的内置的结构体
        //CGPoint:表示坐标.----是NSPoint的别名
        CGPoint point = {.x=1,.y=2};
        //point = {1,2};
        point.x = 1;
        point.y = 2;
        point = CGPointMake(1, 2);
        point = NSMakePoint(1, 2);
        NSLog(@"x = %lf ; y = %lf",point.x,point.y);
        
        //CGSize:声明大小。---是NSSize的别名
        CGSize size = {.width=1,.height=2};
        size.width = 1;
        size.height = 2;
        size = CGSizeMake(1, 2);
        size = NSMakeSize(1, 2);
        NSLog(@"width = %lf ; height = %lf",size.width,size.height);
        
        //CGRect:声明坐标信息，包括坐标位置和大小
        CGRect rect = {.origin={.x=1,.y=2},.size={.width=2,.height=4}};
        
        //NSValue:用来包装集合中无法存储非oc对象的基本数据类型包括结构体的数据，这样就可以存储在集合中
        NSValue *pointValue = [NSValue valueWithPoint:point];
        point = pointValue.pointValue;
        NSLog(@"%@",NSStringFromPoint(point));
    }
    return 0;
}
