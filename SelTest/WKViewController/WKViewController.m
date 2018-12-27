//
//  WKViewController.m
//  SelTest
//
//  Created by Murphy on 2018/12/27.
//  Copyright © 2018 Murphy. All rights reserved.
//

#import "WKViewController.h"
#import <WebKit/WKWebView.h>

@interface WKViewController ()
@property (nonatomic, weak) IBOutlet WKWebView *webView;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:[path stringByAppendingPathComponent:@"source"]];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *htmlStr = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:htmlStr baseURL:baseURL];
}
- (void)viewWillAppear {
    [super viewWillAppear];
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index"
//                                                          ofType:@"html"];
////    NSURL *url = [NSURL fileURLWithPath:htmlPath];
//    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
////    [self.webView loadHTMLString:htmlPath baseURL:nil];
 
}
@end
