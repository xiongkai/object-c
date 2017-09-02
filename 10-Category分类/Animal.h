//
//  Animal.h
//  oc语言基础
//
//  Created by 熊凯 on 2017/4/16.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    int _age;
    NSString *_name;
    @private
    int _filed;
}
@property int age;
@property NSString *name;
@property NSString *haha;
-(id)initWidthName:(NSString *)name andAge:(int)age;
@end
