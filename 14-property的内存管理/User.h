//
//  User.h
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/25.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    int _age;
    NSString *_name;
}

@property (readwrite,nonatomic) int age;

@property (retain,readwrite,nonatomic,nullable) NSString *name;

-(void)test:(NSString * _Nonnull)param1 and:(NSString * _Nullable)param2;

-(void)test2:(NSString * _Nullable)param1 and:(NSString * _Nonnull)param2;

-(void)test3:(NSString *)param1 and:(NSString *)param2;

-(void)test3:(nullable NSString *)param1 and:(nonnull NSString *)param2;

@end
