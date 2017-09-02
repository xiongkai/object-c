//
//  main.m
//  25-归档和文件操作
//
//  Created by 熊凯 on 2017/5/3.
//  Copyright © 2017年 熊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //文件操作使用NSFileManager：单例的。文件管理器。
        //获取NSFileManager
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //返回值代表该路径的文件或文件夹是否存在
        BOOL isExist = [fileManager fileExistsAtPath:@"/Users/xiongkai/Desktop/dict.plist"];
        //返回值代表该路径的文件或文件夹是否存在----参数2 isDirectory指针代表是否为文件夹
        BOOL isDirectory;
        isExist = [fileManager fileExistsAtPath:@"/Users/xiongkai/Desktop" isDirectory:&isDirectory];
        NSLog(@"文件是否存在 = %@；是文件夹 = %@",isExist?@"YES":@"NO",isDirectory?@"YES":@"NO");
        //isReadableFileAtPath:是否可以对指定路径的文件或文件夹进行读取操作
        //isWritableFileAtPath:是否可以对指定路径的文件或文件夹进行写入操作
        //isDeletableFileAtPath:是否可以对指定路径的文件或文件夹进行删除操作
        
        //获取指定路径的文件或文件夹的基本信息：如创建时间，需改时间，等等信息
        NSDictionary *fileInfo = [fileManager attributesOfItemAtPath:@"/Users/xiongkai/Desktop/dict.plist" error:nil];
        for (id item in fileInfo) {
            NSLog(@"%@ : %@",item,fileInfo[item]);
        }
        //获取指定路径下的所有的文件夹和文件的路径:包括该路径下的一级，二级，n级目录
        NSArray *paths = [fileManager subpathsAtPath:@"/Users/xiongkai/Desktop"];
        for (NSString *item in paths) {
            NSLog(@"path = %@",item);
        }
        //获取指定路径下的一级目录的所有文件和文件夹的路径
        paths = [fileManager contentsOfDirectoryAtPath:@"/Users/xiongkai" error:nil];
        for (NSString *item in paths) {
            NSLog(@"path = %@",item);
        }
        
        //创建文件，写入数据
        //参数1:文件路径。参数2:文件内容。参数3:文件的属性----返回文件是否创建或写入成功
        NSData *data = [@"1111111" dataUsingEncoding:NSUTF8StringEncoding];
        [fileManager createFileAtPath:@"/Users/xiongkai/Desktop/file.txt" contents:data attributes:nil];
        
        //创建文件
        //参数1:文件夹路径；参数2:是否级联创建文件夹。如创建c文件夹而其父文件夹a，b都不存在是否级联创建
        [fileManager createDirectoryAtPath:@"/Users/xiongkai/Desktop/a/b/c" withIntermediateDirectories:NO attributes:nil error:nil];
        
        //删除置顶路径的文件或文件夹
        [fileManager removeItemAtPath:@"/User/xiongkai/Desktop/a.plist" error:nil];
        
        //移动或重命名指定路径的文件或文件夹
        [fileManager moveItemAtPath:@"/Users/xiongkai/Desktop/abc.txt" toPath:@"/Users/xiongkai/Desktop/abcd.txt" error:nil];
        
        //复制指定路径的文件或文件夹到指定路径
        [fileManager copyItemAtPath:@"/Users/xiongkai/Desktop/abcd.txt" toPath:@"/Users/xiongkai/Desktop/abbb.txt" error:nil];
    }
    return 0;
}
