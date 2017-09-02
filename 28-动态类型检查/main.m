//
//  main.m
//  28-动态类型检查
//
//  Created by 熊凯 on 2017/5/10.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //判断一个对象是否有某一个成员方法
        NSString *testStr1  = @"123";
        NSLog(@"has methond:%@",[testStr1 respondsToSelector:@selector(test)] ? @"YES" : @"NO");
        
        //判断一个类是否有某一个类方法
        NSLog(@"has methond:%@",[NSString instancesRespondToSelector:@selector(test)] ? @"YES" : @"NO");
        
        //判断一个对象是否为某个类或其子类的实例：为指定类的或其子类的对象--YES；否则为NO。
        NSString *testStr2 = @"123";
        NSLog(@"is object of class NSString:%@",[testStr2 isKindOfClass:[NSString class]]? @"YES" : @"NO");
        NSLog(@"is object of class NSObject:%@",[testStr2 isKindOfClass:[NSObject class]]? @"YES" : @"NO");
        
        //判断一个对象是否为某个类的实例：为指定类的对象--YES；否则为NO。即只有为指定类型的实例才为真
        NSObject *testStr4 = [[NSString alloc] init];
        NSLog(@"is object of class NSString:%@",[testStr4 isMemberOfClass:[NSString class]]? @"YES" : @"NO");
        NSLog(@"is object of class NSObject:%@",[testStr4 isMemberOfClass:[NSObject class]]? @"YES" : @"NO");
        
        NSObject *obj1 = [[NSObject alloc] init];
        NSLog(@"is object of class NSObject:%@",[obj1 isMemberOfClass:[NSObject class]]? @"YES" : @"NO");
        
        
        //判断一个类是否为指定类的子类：为指定类的子类--YES；否则为NO。即只有为指定类子类才为真
        NSLog(@"is object of class NSString:%@",[NSString isSubclassOfClass:[NSObject class]]? @"YES" : @"NO");
        NSLog(@"is object of class NSString:%@",[NSObject isSubclassOfClass:[NSObject class]]? @"YES" : @"NO");
        NSLog(@"is object of class NSString:%@",[NSObject isSubclassOfClass:[NSString class]]? @"YES" : @"NO");
    }
    return 0;
}
