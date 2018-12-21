//
//  TestBWindowController.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "TestBWindowController.h"
#import "LDWindonwControllerManager.h"

@interface TestBWindowController ()

@end

@implementation TestBWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void)close {
    [super close];
    if ([self windowShouldClose:self.window]) {
        [[LDWindonwControllerManager sharedManager] removeController:self];
    }
}
- (BOOL)windowShouldClose:(id)sender {
    return YES;
}

- (IBAction)closeWindow:(id)sender {
    [self close];
}


@end
