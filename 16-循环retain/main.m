//
//  main.m
//  16-循环retain
//
//  Created by 熊凯 on 2017/4/20.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //！！！！！！头文件的循环引用导入问题：
        
        //存在类A和类B
        //假设类A和类B是分开定义在不同的文件中，类A头文件中使用了B类，那么A类头文件中导入B类头文件；同时B类头文件中使用了A类，那么B类头文件也要导入A类的头文件
        //那么就会出现循环引用头文件的情况，没完没了的头文件的引用-----编译器报错会提示其中一个类中无法识别另外一个类型
        
        //在上述这种情况下，当A类头文件中导入了B类的头文件，那么B类头文件中要使用A类就不要在使用#import “A.h”来导入A类的文件了
        //可以使用 @class 类名 形式来代替#import “A.h”头文件导入，解决循环引用的问题
        
        //实质上我们可以在一个类引用另外一个类时，可以不使用import来导入头文件，可以都写成@class 来在当前类中声明一个类名
        
        //但是@class xxx只能在当前文件中说明 xxx 是一个类但是却不知道 类xxx有什么方法和成员变量
        //这是可以将导入头文件的#import xxx写在类的实现.m文件中，这样就可以访问到xxx类的方法和成员变量
        
        /*
         总结：oc中的一个类由类声明头文件.h和类实现.m文件组成，当导入一个类一般都是导入对应的头文件，导当前类的头文件中，
                然后将当前类的头文件导入到，当前类的实现文件中；
              为了避免循环引用导入头文件的问题，头文件中导入另外一个头文件可以使用@class代替；而类的实现中还是导入当前类的头文件就好
         
                @class性能要高于#import
                @class只是告诉当前头文件 xxx为一个类，不用关心类的声明实现及开发中发生的变化
                而#import，每次编译时都会讲到的头文件都检查判断是否引入
         */
        
        
        //！！！！！！！对象的循环引用 或者说循环retain
        People *p = [[People alloc] init];// p 计数器：1
        Car *c = [[Car alloc] init];//c 计数器 ： 1
    
        //以下两行代码将发生循环reain问题，将有可能导致引用的对象没有release到计数器为0，从而发生内存泄漏的问题
        p.car = c; //c 计数器 ： 2
        c.people = p; // p 计数器：2
    
        [c release];// c 计数器 ：1
        [p release];//p 计数器： 1
        
        /*可见党程序结束时c，p的计数器不为0，所以无法执行对应的dealloc方法来释放它所引用的对象，
        即c无法释放掉引用的p,而p也没有释放掉所引用的c，就造成了内存泄漏
         
         解决方法时，两个类互相引用时对应setter方法的参数一端用retain，一端用assign即可解决
         @interface People : NSObject
         {
            Car *_car;
         }
         
         @property (nonatomic,retain) Car *car;
         
         @end
         
         @implementation People
         -(void)dealloc
         {
            [_car release];
            [super dealloc];
         }
         @end
         
         
         
         @interface Car : NSObject
         {
            People *_people;
         }
         
         @property (nonatomic,assign) People *people;
         
         @end
         
         @implementation Car
         -(void)dealloc
         {
            [_people dealloc];
            [super dealloc];
         }
         @end
         */
    }
    return 0;
}
