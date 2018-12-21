//
//  LDWindonwControllerManager.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "LDWindonwControllerManager.h"

@interface LDWindonwControllerManager ()

@property (nonatomic,strong) NSMutableSet *controllerSet;

@end

@implementation LDWindonwControllerManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.controllerSet = [NSMutableSet set];
    }
    return self;
}
- (void)addController:(NSWindowController *)c {
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    NSLog(@"before add %@",self.controllerSet);
    [self.controllerSet addObject:c];
    NSLog(@"after add %@",self.controllerSet);
}
- (void)removeController:(NSWindowController *)c {
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
//    BOOL windowShouldClose = YES;
//    if ([c.window.delegate respondsToSelector:@selector(windowShouldClose:)]) {
//        windowShouldClose = [c.window.delegate windowShouldClose:c.window];
//    }
//    if (!windowShouldClose) {
//        NSLog(@"该页面不能关闭，不释放该windowController %@",c);
//        return;
//    }
    
    NSLog(@"before remove %@",self.controllerSet);
    [self.controllerSet removeObject:c];
    NSLog(@"after remove %@",self.controllerSet);
}
- (id)controllerWithClass:(Class)cl {
    id wc = nil;
    [self.controllerSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:cl]) {
//            wc = obj;
            *stop = YES;
        }
    }];
    return wc;
}
- (void)clear {
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [self.controllerSet removeAllObjects];
}
@end
