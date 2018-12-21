//
//  AppDelegate.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "AppDelegate.h"
#import "Anm.h"



@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    Anm *a = [[Anm alloc] init];
//    a.name123 = @"2";
//    [a test];
//    return;
    SEL sel1 = @selector(methodNoReturnAndArgument);
    SEL sel2 = @selector(methodNoReturnWithArgument:);
    SEL sel3 = @selector(methodReturnWithArgument:);
    id obj1 = @"1";
    id obj2 = @"2";
    id obj3 = @"3";
    id ret1;
    id ret2;
    id ret3;
    void *a;
    [self performSelector:sel1];
    [self performSelector:sel1 withObject:nil];
    [self performSelector:sel1 withObject:obj1];
//    ret1 = [self performSelector:sel1 withObject:obj1]; // 崩溃
    /// 接受参数错误
    /// 下面这行转换就没有问题

    a = (__bridge void *)[self performSelector:sel1 withObject:obj1];
    
//        [self performSelector:sel2]; // 崩溃
    /// 有参数去没有传
    [self performSelector:sel2 withObject:nil];
    //    ret2 = [self performSelector:sel2 withObject:nil]; // 崩溃
    /// 接受参数错误
    ret2 = [self performSelector:sel2 withObject:obj2];
    
    //    [self performSelector:sel3];    // 崩溃
    [self performSelector:sel3 withObject:nil];
    ret3 = [self performSelector:sel3 withObject:nil];
    ret3 = [self performSelector:sel3 withObject:obj3];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)methodNoReturnAndArgument {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
- (void)methodNoReturnWithArgument:(id)obj {
    NSLog(@"argument:%@",obj);
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
- (id)methodReturnWithArgument:(id)obj {
    NSLog(@"argument:%@",obj);
    NSLog(@"return:%@",obj);
    return obj;
}
@end
