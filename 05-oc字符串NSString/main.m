//
//  main.m
//  05-oc字符串NSString
//
//  Created by 熊凯 on 2017/4/15.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str = [NSString stringWithFormat:@"haha %@",@"xiongkai"];
        NSLog(@"%@",str);
        
        unsigned long length = [str length];
        NSLog(@"lenght = %lu",length);
        NSLog(@"lenght = %lu",str.length);
    }
    return 0;
}
