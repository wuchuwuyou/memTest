//
//  AppDelegate.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "AppDelegate.h"
#import "Anm.h"
#import "TestAWindowController.h"
#import "TestBWindowController.h"
#import "LDWindonwControllerManager.h"

#import "WKViewController/WKViewController.h"
#import "WKViewController/WKWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    WKViewController *viewController = [[WKViewController alloc]initWithNibName:@"WKViewController" bundle:nil];
    
    NSWindowStyleMask styleMask = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable;
    NSRect rect = NSMakeRect(0, 0, 400, 200);
    NSWindow *window = [[NSWindow alloc]initWithContentRect:rect styleMask:styleMask backing:NSBackingStoreBuffered defer:YES];
    window.contentViewController = viewController;
    
    WKWindowController *wkWC = [[WKWindowController alloc] initWithWindow:window];
    window.delegate = wkWC;
    [wkWC.window center];
    [wkWC.window orderFront:nil];
    [[LDWindonwControllerManager sharedManager] addController:wkWC];
}


//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    TestAWindowController *a = [[TestAWindowController alloc] initWithWindowNibName:@"TestAWindowController"];
//    [a showWindow:nil];
//    [[LDWindonwControllerManager sharedManager] addController:a];
//
//}
/*
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    Anm *a = [[Anm alloc] init];
//    a.name123 = @"2";
//    [a test];
//    return;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

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
    /// debug 下崩溃
    /// 接受参数错误
    /// 下面这行转换就没有问题

    a = (__bridge void *)[self performSelector:sel1 withObject:obj1];
    
//        [self performSelector:sel2]; // 崩溃
    /// 有参数去没有传
    [self performSelector:sel2 withObject:nil];
    
//    ret2 = [self performSelector:sel2 withObject:nil]; // 崩溃
    /// debug 下崩溃
    /// 接受参数错误

//    ret2 = [self performSelector:sel2 withObject:obj2]; // 崩溃
    /// debug 下不崩溃
    /// release 崩溃
    /// 下面这行转换就没有问题
    a = (__bridge void *) [self performSelector:sel2 withObject:obj2];
    
    
    
    //    [self performSelector:sel3];    // 崩溃
    [self performSelector:sel3 withObject:nil];
    ret3 = [self performSelector:sel3 withObject:nil];
    ret3 = [self performSelector:sel3 withObject:obj3];
#pragma clang diagnostic pop

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
 */
@end
