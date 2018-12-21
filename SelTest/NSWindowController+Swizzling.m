//
//  NSWindowController+Swizzling.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "NSWindowController+Swizzling.h"
#import <objc/runtime.h>
#import "LDWindonwControllerManager.h"

@implementation NSWindowController (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
//        SEL originalSelector = @selector(showWindow:);
//        SEL swizzledSelector = @selector(sw_showWindow:);
//
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//
//        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//        if (success) {
//            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//        SEL originalCloseSelector = @selector(close);
//        SEL swizzledCloseSelector = @selector(sw_close);
//
//        Method originalCloseMethod = class_getInstanceMethod(class, originalCloseSelector);
//        Method swizzledCloseMethod = class_getInstanceMethod(class, swizzledCloseSelector);
//
//        BOOL CloseSuccess = class_addMethod(class, originalCloseSelector, method_getImplementation(swizzledCloseMethod), method_getTypeEncoding(swizzledCloseMethod));
//        if (CloseSuccess) {
//            class_replaceMethod(class, swizzledCloseSelector, method_getImplementation(originalCloseMethod), method_getTypeEncoding(originalCloseMethod));
//        } else {
//            method_exchangeImplementations(originalCloseMethod, swizzledCloseMethod);
//        }

        SEL originalDeallocSelector = NSSelectorFromString(@"dealloc");
        SEL swizzledDeallocSelector = @selector(sw_dealloc);
        
        Method originalDeallocMethod = class_getInstanceMethod(class, originalDeallocSelector);
        Method swizzledDeallocMethod = class_getInstanceMethod(class, swizzledDeallocSelector);
        
        BOOL DeallocSuccess = class_addMethod(class, originalDeallocSelector, method_getImplementation(swizzledDeallocMethod), method_getTypeEncoding(swizzledDeallocMethod));
        if (DeallocSuccess) {
            class_replaceMethod(class, swizzledDeallocSelector, method_getImplementation(originalDeallocMethod), method_getTypeEncoding(originalDeallocMethod));
        } else {
            method_exchangeImplementations(originalDeallocMethod, swizzledDeallocMethod);
        }
    });
}

//- (void)sw_showWindow:(id)sender {
//    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
//    [[LDWindonwControllerManager sharedManager] addController:self];
//    [self sw_showWindow:sender];
//}
//- (void)sw_close {
//    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
//    [[LDWindonwControllerManager sharedManager] removeController:self];
//    [self sw_close];
//}
- (void)sw_dealloc {
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [self sw_dealloc];
}

@end
