//
//  LDWindonwControllerManager.h
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface LDWindonwControllerManager : NSObject

+ (instancetype)sharedManager;
- (void)addController:(NSWindowController *)c;
- (void)removeController:(NSWindowController *)c;

@property (nonatomic,strong,readonly) NSMutableSet *controllerSet;

@end

NS_ASSUME_NONNULL_END
