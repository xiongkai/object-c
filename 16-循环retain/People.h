//
//  People.h
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/25.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface People : NSObject
{
    Car *_car;
}

@property (nonatomic,retain) Car *car;

-(void)test1;

-(void)printCar:(Car *)car;

@end
