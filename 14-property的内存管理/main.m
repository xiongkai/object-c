//
//  main.m
//  14-property的内存管理
//
//  Created by 熊凯 on 2017/4/17.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //@property内存管理参数组：retain，assign（默认），copy三者只能同时写其中一个------应用于NSObject类型，对于非NSObject类型用assign
        
        //@property @synthesize自动生成的getter setter方法的代码只是简单的取值和复制，
        //所以生成的setter方法是没有内存管理的部分关于对引用的其他对象的计数器的retain +1和release -1的操作
        //oc可以对@property指定参数来让其生成对引用的对象进行内存管理，即生成对引用的对象的计数器进行retain和release的操作
        /*实例如下写法----在@property后加（retain）---这个retain就会对setter方法生成先让旧的对象release再让新的对象retain的代码
         @property(retain) (Person *)person;
         实际生成的setter方法的代码如下：
         -(void)setPerson:(Person *)person
         {
            if(_person != person)
            {
                if(_person != nil)
                {
                    [_person release];
                }
                _person = [person retain];
            }
         }
         */
        /*
         @property默认参数为（assign）：即生成的普通的setter方法没有生成的旧对象的release，对新对象的retain操作代码
         @property (assign) (Person *) person;-----默认参数为assign写和不写一样
         等于 ：@property (Person *) person;
         生成的代码：
         -(void)setPerson:(Person *)person
         {
            _person = person;//生成的代码是直接将参数赋值给成员变量，而没有任何的内存管理操作代码
         }
         */
        
        /*参数copy类似与retain，也会生成release旧对象，retain新对象的内存管理代码---一般NSString类型的属性使用copy
         @property (copy) (Person *)person;
         */
        
        
        //@property是否生成setter方法的参数组：readwrite（默认），readonly-------二者只能写其中一个
        //readwrite:会生成getter，setter方法；
        //readonly:只生成getter方法，不会生成setter方法；
        
        
        //@property多线程管理参数组：nonatomic，atomic（默认）-----二者写其一
        //atomic:在生成getter，setter方法针对多线程环境增加同步机制，即加锁保证线程安全；
        //nonatomic：与atomic相反不会加锁------性能比atomic高；
        
        //@property方法名称控制参数组：getter=xxx ，setter=xxx:----可以同时写；其中xxx和xxx:代表所要指定生成的方法的名称
        //默认生成的getter方法名：和属性名相同
        //默认生成的setter方法名：set+属性名首字母大写---注意如果方法有参数一定要在方法名后加冒号否则不能传参数，冒号也是方法名的一部分
        /*
         @property (Person *) person;
         生成的getter方法名：person      生成的setter方法名：setPerson:
         
         @property (getter=getPerson,setter=setPerson:) (Person *) person
         生成的getter方法名：getPerson      生成的setter方法名：setPerson:
         */
        
        
        //@property方法参数可否为nil参数组：nonnull，nullable（默认）-----二者写其一 ----应用于NSObject类型
        //nonnull:参数不可为nil；--------对应与方法参数的_Nonnull和nonnull-------如果传入的是nil只会提示警告而不会报错
        //nullable:参数可为nil；--------对应于方法参数的_Nullable和nullable
        
        User *user1 = [[User alloc] init];
        [user1 test:nil and:nil];
        
        
        
        //@property成员变量是强引用指针还是弱引用参数组：strong，weak-----二者写其一 ----应用于NSObject类型
        //strong:强引用指针
        //weak:弱引用指针
    }
    return 0;
}
