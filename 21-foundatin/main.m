//
//  main.m
//  21-foundatin
//
//  Created by 熊凯 on 2017/4/24.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

void testNSString(){
    //oc字符串的恒定性：与java类似字符串常量池，当使用一个oc字符串字面亮创建字符串是会先检查字符串常量池中是否有，若有直接用，没有就回创建一个并存入字符串常量池中。如果创建的字符串是存储在堆中的，若堆中有相同的字符串拿来直接用，如果没有则创建新的
    //所以在oc中的字符串，只要在所在的存储区能找到就不会创建新的字符串而是从存储区取出来直接使用，否则就创建新的
    NSString *s1 = @"123";//创建的字符串存储在常量池
    NSString *s2 = @"123";//创建的字符串存储在常量池
    NSString *s3 = [[NSString alloc] initWithString:@"123"];//创建的字符串存储在常量池
    NSString *s4 = [NSString stringWithString:@"123"];//创建的字符串存储在常量池
    NSLog(@"s1 = %p;s2 = %p;s3 = %p;s4 = %p",s1,s2,s3,s4);
    NSLog(@"NSString---------------常用API");
    //创建一个空字符串
    NSString *emptyString1 = [NSString new];//创建的空字符串存储在常量池
    NSString *emptyString2 = [[NSString alloc] init];
    NSString *emptyString3 = [NSString string];
    NSString *emptyString4 = @"";
    NSLog(@"创建一个空字符串 1=%@;2=%@;3=%@;4=%@",emptyString1,emptyString2,emptyString3,emptyString4);
    //格式化字符串创建新的字符串 -----[[NSString alloc] initWithString:@"jack-%d",28]
    NSString *string0 = [NSString stringWithFormat:@"jack-%d",28];//创建的字符串存储在堆中
    NSString *string00 = [NSString stringWithFormat:@"jack-%d",28];
    NSString *string000 = @"jack-28";
    NSLog(@"使用stringWidthFormat方法格式化字符串创建新的字符串 = %p %p %p",string0,string00,string000);
    NSLog(@"使用stringWidthFormat方法格式化字符串创建新的字符串 = %@",string0);
    //获取字符串的长度
    NSString *string1 = @"wo shi yi ge zi fu chuan!";
    NSLog(@"使用length方法获取字符串的长度，length=%lu",[string1 length]);
    //将c字符串转换为oc字符串
    char *cstring1 = "1233333";
    NSString *string2 = [NSString stringWithUTF8String:cstring1];
    char *cstring = string2.UTF8String;//将在oc字符串转换为c字符串
    NSLog(@"使用stringWidthUTF8String方法将c字符串转换为oc字符串 = %@",string2);
    //获取oc字符串的指定索引的字符
    unichar char1 = [string2 characterAtIndex:2];
    NSLog(@"使用characterAtIndex方法湖区指定索引的字符 = %C",char1);
    //判断两个oc的字符串的值是否相等
    BOOL isEqual1 = [string1 isEqualToString:string2];
    NSLog(@"使用isEqualToString方法判断两个字符串是否相等，%@",isEqual1?@"YES":@"NO");
    //判断两个oc字符串的大小；；；
    //返回值为枚举值：NSOrderedAscending（-1，小于），NSOrderedSame（0，等于），NSOrderedDescending（1，大于）
    NSComparisonResult result1 = [string1 compare:string2];
    NSLog(@"使用compare方法比较两个字符串的大小关系，string1 %@ string2",(result1==NSOrderedSame?@"等于":(result1==NSOrderedAscending?@"小于":@"大于")));
    //忽略大小写比较两个字符串的大小
    [string1 compare:string2 options:NSCaseInsensitiveSearch];
    [string2 caseInsensitiveCompare:string2];
    //将字符串写到指定路径下的文件中
    /*参数1:写入的文件路径；参数2:YES--现将内容写到一个临时文件如果写入成功在拷贝到指定路径的文件，NO--直接写到指定路径的文件中；
     参数3:制定以什么编码将数据写入到文件中；参数4:一个二级指针参数，需要传递一个NSError指针的地址
     返回值为BOOl：
        YES--文件写入成功，那么传入的参数4为nil；
        NO--写入文件失败，那么传入的参数4不为nil，就可以通过err获取存储失败的原因
     */
    NSError *err = nil;
    [string2 writeToFile:@"/Users/xiongkai/Desktop/abc.txt" atomically:NO encoding:NSUTF8StringEncoding error:&err];
    //读取文件的内容初始化字符串对象-----和上述方法的参数意义一致
    NSString *strFromFile = [NSString stringWithContentsOfFile:@"/Users/xiongkai/Desktop/a.txt" encoding:NSUTF8StringEncoding error:nil];
    /*NSURL
     读取或写入本地文件：路径：file:///Users/xiongkai/Desktop/abc.txt
     读取或写入网络路径文件:路径:http://www.baidu.com
     读取或写入ftp文件：路径:ftp://www.baidu.cn/.abc.txt
     */
    NSURL *url = [NSURL URLWithString:@"file:///Users/xiongkai/Desktop/abc.txt"];//读取本地路径文件
    //url = [NSURL URLWithString:@"http://www.baidu.com"];//读取网络地址文件
    //url = [NSURL URLWithString:@"ftp://www.baidu.com"];//读取ftp地址文件
    NSString *strFromUrl = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",strFromUrl);
    [@"33333" writeToURL:url atomically:NO encoding:NSUTF8StringEncoding error:nil];
    strFromUrl = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",strFromUrl);
    //判断字符串是否以指定的字符串开头或结束
    [string1 hasPrefix:@"1"];[string1 hasSuffix:@"2"];
    //在字符串中搜索指定的字符串
    /*---返回值为NSRange类型
     location:目标字符串出现的位置----若果不存在将会NSUInteger的最大值NSNotFound
     length：不存在为0；存在则为目标字符串的长度
     */
    NSRange range1 = [string1 rangeOfString:@"wo"];
    NSLog(@"location = %lu ; length = %lu",range1.location,range1.length);
    /*结构体的初始化方法
     1:NSRange range = {1,2};
     2:NSRange range = {.location=1,.length=12};
     3.NSrange range;
       range.location = 1;
       range.length = 12;
     //oc中初始化NSRange结构体的特有方式，使用函数NSMakeRange
     4.NSRange range = NSMakeRange(1,12);
     
     //将NSRange转换为字符串函数：NSStringFromRange（NSRange range）；
     */
    //将字符串中子字符串替换成指定的字符串
    NSString *strReplace = [string1 stringByReplacingOccurrencesOfString:@"wo" withString:@"ni"];
    NSLog(@"%@",strReplace);
    //字符串的类型转换
    //字符串转换为数字：将字符串中从开始至遇到的第一个非数字的字符为止转换为对应类型的数值
    //转换为BOOL:将字符串中从开始至遇到的第一个非数字的字符为止转换为对应类型的数值--如果为0则为NO否则为YES
    NSLog(@"abc123 to int = %d",[@"abc123" intValue]);
    NSLog(@"123abc to int = %d",[@"123abc" intValue]);
    NSLog(@"123abc to bool = %@",[@"123abc" boolValue]?@"YES":@"NO");
    NSLog(@"abc123 to bool = %@",[@"abc123" boolValue]?@"YES":@"NO");
    NSLog(@"023abc to bool = %@",[@"023abc" boolValue]?@"YES":@"NO");
    NSLog(@"0abc to bool = %@",[@"0abc" boolValue]?@"YES":@"NO");
    NSLog(@"0.1abc to bool = %@",[@"0abc" boolValue]?@"YES":@"NO");
    //去掉字符串中头部和尾部的空格相当于java的trim方法
    NSLog(@"%@",[@"   123   " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
    //去掉字符串头部和尾部指定的字符串
    NSLog(@"%@",[@"aaa123aaa" stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"aaa"]]);
    //可变字符串NSMutableString：不能是用oc字符串字面量进行创建--@“123”创建的是一个NSString而不是一个NSMutableString
}

void testNSArray(){
    /*数组NSArray----只能存储oc对象不能存储基本数据类型
                ----和c数组一样一经创建初始化后长度就固定了无法改变长度
                ----有序，和c数组一样有下标
                ----元素的类型都是id类型的
                ----一个数组可以有类型不同的元素
     */
    //创建长度为0的NSArray数组------但是由于长度为0所以没有意义
    NSArray *arr1 = [[NSArray alloc] init];
    arr1 = [NSArray new];
    arr1 = [NSArray array];
    //创建数组的同时指定一个元素此时长度为1---但是还是没有什么实际意义
    arr1 = [[NSArray alloc] initWithObjects:@"123"];
    arr1 = [NSArray arrayWithObject:@"123"];
    //创建数组的同时指定多个元素---长度为传入的元素的个数
    //----但是传入多个参数的时候必须要额外传入一个nil表示参数传递结束---也就是传入多个参数初始化数组时只要遇到空指针nil就代表参数传递结束---即便nil后面还有参数也会被忽略
    arr1 = [[NSArray alloc] initWithObjects:@"123", @"234", @"345", nil];//长度为3
    arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3",nil];
    NSLog(@"length = %lu   %@",arr1.count,arr1);
    //创建数组的简写方式----不需要加nil参数而且也不能加会报错，因为[]中的元素都会被识别为数组的元素，而数组的元素只能时OC的对象，nil实际为数值0
    arr1 = @[@"11",@"22",@"33"];
    NSLog(@"%@",arr1);
    //获取和修改数组中的元素
    //---通过c语言的访问数组的方式进行访问：变量名[下标]
    //---通过NSArray的方法：objectAtIndex:index
    NSLog(@"%@   %@",arr1[0],[arr1 objectAtIndex:2]);
    //判断数组中是否存在某个对象
    NSLog(@"%@",[arr1 containsObject:@"11"]?@"YES":@"NO");
    //获取数组中的第一个元素：firstObject
    //获取数组中的最后一个元素:lastObject
    //与通过下标获取不同的是，如果下标越界会报错，而firstObject和lastObject不会报错只会返回nil
    NSLog(@"firstObject = %@,lastObject = %@",arr1.firstObject,arr1.lastObject);
    //在数组中查找一个对象第一次出现的位置，返回元素的索引，不存在返回NSNotFound（其值为NSUIntegr的最大值）
    NSLog(@"222 index = %lu",[arr1 indexOfObject:@"222"]);
    //数组的遍历
    unsigned long length = arr1.count;
    for (int i = 0; i < length; i++) {
        NSLog(@"index = %d value = %@",i,arr1[i]);
    }
    for (NSString *ts in arr1) {
        NSLog(@"value = %@",ts);
    }
    [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj = %@;idx = %lu;stop = %@",obj,idx,*stop?@"YES":@"NO");
        *stop = YES;
        //其中stop指针是用来控制循环是否结束，stop为YES则结束，为NO则不会结束
    }];
    //将数组元素以指定的字符串链接成一个字符串
    NSLog(@"%@",[arr1 componentsJoinedByString:@"/"]);
    //将一个字符串以指定的字符串分割并生成一个数组
    NSString *ssss = @"11,22,33,44,55,66";
    NSLog(@"%@",[ssss componentsSeparatedByString:@","]);
    
    //可变数组NSMutableArray:在NSArray的基础上进行了扩展，可变数组可进行新增和删除即长度可变
    //NSMutableArray的不能使用@[@"1",@"2"]的简写方式创建，这种简写方式创建的是NSArray不可变数组对象
    NSMutableArray *mutableArr1 = [NSMutableArray arrayWithArray:arr1];
    NSLog(@"mutableArr1 = %@",mutableArr1);
    //向可变数组中添加一个元素，传入的参数是作为一个整体即便传入的是一个数组也只作为一个元素进行添加
    [mutableArr1 addObject:@"321"];
    [mutableArr1 addObject:@"321"];
    //将一个数组中的所有元素分别插入到可变数组中，传入的数组有多少个元素就回添加多少个元素
    [mutableArr1 addObjectsFromArray:arr1];
    //将一个对象作为一个元素插入到可变数组中的指定位置
    [mutableArr1 insertObject:@"abc" atIndex:1];
    //将一个数组中的所有元素分别插入到指定的索引位置
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 2)];
    [mutableArr1 insertObjects:@[@"a",@"b"] atIndexes:indexSet];
    NSLog(@"mutableArr1 = %@",mutableArr1);
    [mutableArr1 removeObject:@"321"];//删除的所有匹配的元素
    NSLog(@"mutableArr1 = %@",mutableArr1);
    [mutableArr1 removeObjectAtIndex:1];//删除指定索引位置的元素
    NSLog(@"mutableArr1 = %@",mutableArr1);
    [mutableArr1 removeAllObjects];//清空可变数组中的所有元素
}

void testNSNumber(){
    //NSNumber:数值类型的包装类型
    //比如数组和集合中只能存储OC对象，那么对于基本数据类型如数值型可以使用NSNumber进行包装就可以存储在数组等集合中了
    //创建NSNumber对象的简写方式：@数值  或者 @(数值)
    NSNumber *number1 = @10;
    NSNumber *number2 = @YES;
    NSNumber *number3 = @11.1f;
    int a = 1;
    //将一个基本数据类型的变量转换为NSNumber对象：@(变量名)
    NSNumber *number4 = @(a);
}

void testPlistFile(){
    //.plist文件存储数组，集合数据
    NSArray *arr1 = @[@"123",@"345"];
    [arr1 writeToFile:@"/Users/xiongkai/Desktop/a.plist" atomically:NO];
    //将保存在.plist中的数组数据读取到内存中
    arr1 = [NSArray arrayWithContentsOfFile:@"/Users/xiongkai/Desktop/a.plist"];
    NSLog(@"%@",arr1);
}

void testNSDictionary(){
    //NSDictionary:字典。定长已经创建初始化后长度就不可变化，只允许修改元素的值和获取元素值。一经初始化元素个数固定，key键固定
    //以键值对存储：其中key只能是继承了NSCoping协议的对象才能，而value只能是OC对象
    //字典实质也是一个数组，只是数组的每个元素是key-value的键值对，
    //但是字典的顺序是根据key的hash值排列的，所以没有类似数组的o,1,2,3的数值下标，可以通过key获取对应的value
    //创建无元素的字典对象-----实际使用没有意义的，因为NSDictionary为不可变字典
    NSDictionary * dict1 = [NSDictionary new];
    dict1 = [[NSDictionary alloc] init];
    dict1 = [NSDictionary dictionary];
    //由于不可变字典创建后无法增删元素，所以一般在创建初始化时就确定字典的元素个数
    //dictionaryWithObjectsAndKeys:键a的值，键a名，键b的值，键b名，...,nil
    dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"xiong kai",@"name",@"wu han",@"address", nil];
    NSLog(@"%@",dict1);
    //通过key获取字典对应的value，不会报错，如果key在字典中不存在返回值为nil
    NSLog(@"name = %@",[dict1 valueAtIndex:0 inPropertyWithKey:@"name"]);
    NSLog(@"name = %@",[dict1 objectForKey:@"name"]);
    NSLog(@"name = %@",[dict1 valueForKey:@"name"]);
    NSLog(@"name = %@",dict1[@"name"]);//获取指定键名对应的值的简写方式
    //创建字典的简写方式：@[键名：键值，键名：键值,...];-----简写方式创建的是NSDictionary而不是NSMutableDictionary
    
    //遍历字典--for in循环遍历是对字典的key进行便利
    for (NSString *key in dict1) {
        NSLog(@"key = %@ ; value = %@",key,dict1[key]);
    }
    [dict1 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@ ; value = %@",key,obj);
    }];
    
    //NSMutableDictionary:可变字典，相对于NSDictionary不可变字典，可变字典可以增加和删除元素
    //不能使用简写方式创建字典，因为简写方式创建的是不可变字典NSDictionary
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithDictionary:dict1];
    //修改可变字典的元素的value或为可变字典添加元素
    [dict2 setObject:@"hh" forKey:@"name"];
    [dict2 setObject:@"vv" forKey:@"abc"];
    NSLog(@"%@",dict2);
    
    //保存字典信息到.plist文件或从.plist文件读取信息到字典中
    [dict2 writeToFile:@"/Users/xiongkai/Desktop/dict.plist" atomically:NO];
    dict2 = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Users/xiongkai/Desktop/dict.plist"];
    NSLog(@"%@",dict2);
}

void testNSDate(){
    //NSDate:日期类
    NSDate *date1 = [NSDate new];
    date1 = [NSDate date];
    NSLog(@"now = %@",date1);
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSLog(@"%@",[formatter stringFromDate:date1]);
    NSLog(@"%@",[formatter dateFromString:@"2016-12-11 12:55:12"]);
    //得到当前时间加或减n秒的时间
    date1 = [NSDate dateWithTimeIntervalSinceNow:60];
    NSLog(@"%@",date1);
    //返回两个时间之间的时间差
    NSTimeInterval timeInterval = [date1 timeIntervalSinceDate:[NSDate new]];
    NSLog(@"%lf",timeInterval);
    //获取一个日期中的年，月，日，时，分，秒各部分的值-----NSDate不能直接得到，可以使用formatter分别格式化得到
    //也可以使用NSCalendar这个类进行获取
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    //参数1:指定要获取参数2日期的那些部分值
    NSDateComponents *dateComponents1 = [calendar1 components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date1];
    NSLog(@"year = %ld;month = %ld;day = %ld",dateComponents1.year,dateComponents1.month,dateComponents1.day);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {//集合的元素是一个强类型的指针，在集合创建时内部调用了autorelease方法而被添加到了自动释放池
        testNSString();
        testNSArray();
        testPlistFile();
        testNSDictionary();
        testNSDate();
    }
    return 0;
}
