//
//  TestAWindowController.m
//  SelTest
//
//  Created by Murphy on 2018/12/21.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "TestAWindowController.h"
#import "TestBWindowController.h"

@interface TestAWindowController () <NSWindowDelegate>

@end

@implementation TestAWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSButton *btn = [self.window standardWindowButton:NSWindowCloseButton];
    [btn setTarget:self];
    [btn setAction:@selector(hiddenWindow)];
}
- (void)hiddenWindow {
    [[NSApplication sharedApplication] hide:nil];
}

- (void)close {
    [super close];
}
- (BOOL)windowShouldClose:(id)sender {
    return NO;
}
- (IBAction)closeWindow:(id)sender {
    [self close];
}
- (IBAction)pushB:(id)sender {
    TestBWindowController *b = [[TestBWindowController alloc] initWithWindowNibName:@"TestBWindowController"];
    [b showWindow:nil];
}
@end
