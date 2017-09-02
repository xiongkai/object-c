//
//  main.m
//  22-深浅copy
//
//  Created by 熊凯 on 2017/5/3.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.NSString的copy
        
        //无论是MRC还是ARC，对于NSString类型的属性或参数，一般都是用的是copy----copy调用的是对应的对象的copy方法
        
        //copy实质上是代表一个方法：用于对象的拷贝，是NSObject的成员方法
        
        //NSString:copy方法返回的是当前对象并没有创建新的对象------浅拷贝
        //NSMutableString:copy方法返回的是与当前对象不同的一个新对象NSString类型的------深拷贝
        
        //mutablecopy:定义在NSObject中的成员方法，用于拷贝对象
        
        //NSString:mutablecopy方法返回的是创建的新的对象------深拷贝
        //NSMutableString:mutablecopy方法返回的是创建的新的对象------深拷贝
        
        //对于存储在常量区的字符串是不会被回收，所以retain和release是无效的;;而存储在堆中的字符串与其他普通对象一样有引用计数
        //浅拷贝引用计数器+1；；；深拷贝创建的是一个新的对象那么计数器是初始为1.
        
        
        //对于自定义的对象如果希望能进行拷贝，需要实现NSCoping协议，并实现copyWithZone方法
            //copy拷贝对象实质调用的是方法copyWithZone
        
    }
    return 0;
}
