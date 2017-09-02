//
//  main.m
//  11-description|sel
//
//  Created by 熊凯 on 2017/4/17.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation Person:NSObject

-(void)test
{
    //每个方法内部都内置一个_cmd代表了当前的方法
    NSLog(@"test");
    NSLog(@"_cmd %@",NSStringFromSelector(_cmd));
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //我们定义的类本身也是一个实力对象，它的类型为Class即类对象,每一个类只会生成一个Class对象
        //程序启动时会进行类加载，当类加载时调用的是+load方法；当第一次进行初始化创建一个对象时调用+initialize
        /*程序启动时类和其分类的load方法都会调用，分类不会覆盖原类的load方法
        而创建对象时，调用initialize方法时，分类的该方法会覆盖原类的，即分类的调用了而原类的该方法不会调用
         
         因为类在程序启动时进行加载，还未被识别为同一个类于是分开加载并调用各自的load方法，注意先加载父类的load，在加载子类的load，在加载分类的load
         加载完成后分类和原类被识别为同一个类了后，相同的方法分类中相当于重写了分类的进行覆盖，之后创建对象就只会调用最后一个编译的分类的initialize
         */
        //Class类分别有一个成员方法和类方法class用于获取所属类对应的class对象
        //Class本省为一个指针类型即自带*号
        //如：获取NSString对应的class对象
        Class class1 = [Person class];
        Class class2 = [[Person new] class];
        NSLog(@"%p %p",class1,class2);
        
        //description方法相当于java的tostring方法
        
        //SEL代表一个方法---每一个方法对应一个SEL标识----当我们调用一个方法时实质是发送了该方法对应的SEl消息，根据SEL找到对应的方法地址就能调用该方法
        Person *p = [Person new];
        //调用方法test--实质将test包装成一个SEl--然后找当方法地址进行调用
        [p test];
        //也可以直接通过一个@selctor(方法名)来指定SEl，进行方法寻址调用方法
        [p performSelector:@selector(test)];
        
        //创建selector类型,selector本省为指针类型即自带*号
        SEL sel_test = @selector(test);
        SEL sel_test_1 = NSSelectorFromString(@"test");
        [p performSelector:sel_test];
        [p performSelector:sel_test_1];
        
        //判断一个对象是否有某一个方法
        NSString *testStr  = @"123";
        NSLog(@"has methond:%@",[testStr respondsToSelector:@selector(test)] ? @"YES" : @"NO");
        
    }
    return 0;
}
