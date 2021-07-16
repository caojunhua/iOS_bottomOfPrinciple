//
//  main.m
//  OC的本质
//
//  Created by cao hua on 2021/7/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        // 打印结果
        // 2021-07-16 21:35:44.737306+0800 OC的本质[96736:18367567] 8
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));
        // 打印结果
        // 2021-07-16 21:35:44.737957+0800 OC的本质[96736:18367567] 16
        
        //不同iPhone的架构
        //模拟器(i386)
        //32bit(armv7)
        //64bit(arm64)
        
        //lldb 常用指令
        //1--> print p: 打印
        //2--> po :打印对象
        //3--> 读取内存 memory read+地址
        //简写  x 地址
        // memory read/数量+格式+字节数+ 内存地址
        //格式  x 16进制 f是浮点 d是10进制
        //字节大小 b:byte 1个字节 , h: half word 2个字节
        //       w:word 4个字节 ,  g: giant word 8个字节
        
        // 例如:
//        (lldb) x/3xw 0x100637530
//        0x100637530: 0x933a7119 0x001dffff 0x00000000
//        (lldb) x/4xw 0x100637530
//        0x100637530: 0x933a7119 0x001dffff 0x00000000 0x00000000
//        (lldb) x/4xg
//        0x100637540: 0x63756f54534e5b2d 0x7473754372614268
//        (lldb) x/4xg 0x100637530
//        0x100637530: 0x001dffff933a7119 0x0000000000000000
//        0x100637540: 0x63756f54534e5b2d 0x7473754372614268
        
        //----------------------分割线---------------------------//
        //4--> 修改内存中的地址
        //memory write 内存地址 数值
//        (lldb) x 0x100637530
//        0x100637530: 10 71 3a 93 ff ff 1d 00 00 00 00 00 00 00 00 00  .q:.............
//        0x100637540: 2d 5b 4e 53 54 6f 75 63 68 42 61 72 43 75 73 74  -[NSTouchBarCust
//        (lldb) memory write 0x100637537 88   注释: 从0x100637530往后数7个字节,将该内存地址的值重新修改
//        (lldb) x 0x100637530
//        0x100637530: 10 71 3a 93 ff ff 1d 88 00 00 00 00 00 00 00 00  .q:.............
//        0x100637540: 2d 5b 4e 53 54 6f 75 63 68 42 61 72 43 75 73 74  -[NSTouchBarCust
//        (lldb)
        
    }
    return 0;
}
