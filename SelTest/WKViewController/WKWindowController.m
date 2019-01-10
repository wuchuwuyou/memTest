//
//  WKWindowController.m
//  SelTest
//
//  Created by Murphy on 2018/12/27.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "WKWindowController.h"

@interface WKWindowController () <NSWindowDelegate>

@end

@implementation WKWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (BOOL)windowShouldClose:(NSWindow *)sender {
    return NO;
}
@end
