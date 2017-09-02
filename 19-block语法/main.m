//
//  main.m
//  19-block语法
//
//  Created by 熊凯 on 2017/4/24.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int sum(int a,int b){
    return a+b;
}

//自定义类型名称
//typedef 实际类型 类型别名；-----对于block的类型不能定义类型别名，block的名称即为类型名称

typedef int (^defMyBlock)(int,int);//定义类一个名为defMyBlock的的block类型

int useBlock(defMyBlock b){
    return b(1,2);
}
//block类型作为函数的参数时可以是block的完整声明格式必须写block的名称，可省略形参名称，调用时通过block名称调用
//也可以时block的typedef的短类型名
int useBlock2(int (^defBlock2)(int a,int b)){
    return defBlock2(1,2);
}
//block类型作为函数的返回值类型不需要写block名称,不能写block类型的完整声明，
//而需要使用typedef定义block的短类型，使用短类型名称作为函数的返回类型
//(int (^)(int,int)) returnBlock(int (^defBlock2)(int a,int b)){---函数返回类型为block类型的完整声明无法通过编译
//    return ^int(int a,int b){return a+b;};
//}
defMyBlock returnBlock(int (^defBlock2)(int a,int b)){//使用block类型的typedef的的短类型名
    return ^int(int a,int b){return a+b;};
}

@interface BlockTest : NSObject

//block类型作为方法的参数时可以是block类型的完整声明格式不需要写block的名称，
//也可以是block的typedef的短类型调用时通过形参名调用
-(void)printHaha:(BOOL (^)()) haha;
//block类型作为方法的返回值类型时不需要写block的名称，既可以是block的typedef的短类型也可以是完整类型声明格式
-(BOOL (^)())printHaha2:(BOOL (^)()) haha;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //block的标识符：^
        //block类似函数:可以有参数，返回值
        /*定义格式：其中 中括号 代表可选部分
         返回值类型 (^block名称)([形参1类型 [形参1变量名],形参2类型 [形参2变量名],...]) = ^[返回值类型][([形参1类型 形参1变量名,形参2 形参2变量名,...])]{
         
            代码；//和写函数一样-----但是block的函数体内的能直接访问外部的变量却不能直接修改外部的变量
                如果非要修改外部的变量，那么需要使用__block来修饰外部的变量
         
         };
         block的声明中只有参数的变量名称可以省略
         block的代码块定义中返回值类型可以省略，没有参数时参数括号可以省略
         //等号后面的相当于为block的值，注意：block值的末尾也是要加 分号 的。
         
         //调用格式：
         //调用block和调用函数一样：block名称(实参列表)
         */
        
        //1.无参数，无返回值的block
        int a = 1;
        __block int b = 2;
        void (^myBlock1)() = ^{
            NSLog(@"it's block%d",a);//可以访问外部的变量
            //a = 11;//但是不能修改外部的变量
            b = 3;//如果非要修改外部的变量，那么需要使用__block来修饰外部的变量
        };
        myBlock1();
        
        //2.无参数，有返回值的block
        int (^myBlock2)() = ^int{
            NSLog(@"%@",@"it's block2");
            return 1;
        };
        int block2value = myBlock2();
        NSLog(@"block2 value = %d",block2value);
        
        //3,有参数，有返回值的block
        int (^myBlock3)(int a,int b) = ^int(int a,int b){
            NSLog(@"%@",@"it's block3");
            return a+b;
        };
        int block3value = myBlock3(1,2);
        NSLog(@"block3 value = %d",block3value);
        
        //4.指向函数的指针
        int (*p)(int,int) = sum;
        NSLog(@"函数指针 %d",p(1,3));
        
        //5.将block作为参数传递值函数或方法
        defMyBlock defblock1 = ^int(int a,int b){
            return a + b;
        };
        NSLog(@"userBlock = %d",useBlock(defblock1));
        NSLog(@"userBlock2 = %d",^(int a,int b){return a+b;}(1,5));
    }
    return 0;
}
