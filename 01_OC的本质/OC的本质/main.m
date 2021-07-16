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
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));
    }
    return 0;
}
