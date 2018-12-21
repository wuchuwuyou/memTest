//
//  Anm.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "Anm.h"


@interface Anm () {
    int age123;
}
@property (nonatomic, strong) void(^myblock)(void);
@end


@implementation Anm

- (void)test {
    age123 = 1;
    __weak typeof(self) weakSelf = self;
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//    });
    self.myblock = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%d", strongSelf->age123);
    };
//    void (^myblock) (void) = ^{
////        __strong typeof(weakSelf) strongSelf = weakSelf;
//    };

    self.myblock();
}

- (void)dealloc
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end
