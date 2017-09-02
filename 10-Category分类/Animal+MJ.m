//
//  Animal+MJ.m
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/16.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import "Animal+MJ.h"

@implementation Animal (MJ)
-(void)myPrint
{
    NSLog(@"name = %@ ; age = %d ;filed = %d",self->_name,self->_age,self->_filed);
}
@end
