//
//  Car.h
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/25.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "People.h" ------由于People.h导入了Car.h,这样Car.h就不能导入People.h,会报错，可以使用@class 类名进行引用
@class People;//仅仅用于声明一个类，而不会导入对应的头文件，这样就可以通过编译了

@interface Car : NSObject
{
    People *_people;
}

@property (nonatomic,retain) People *people;

-(void)test1;

-(void)printPerson:(People *)people;

@end
