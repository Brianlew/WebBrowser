//
//  ViewController.m
//  WebBrowser
//
//  Created by Brian Lewis on 5/6/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
{
    __weak IBOutlet UIWebView *webView;
    __weak IBOutlet UITextField *urlText;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
}
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIApplication *application = [UIApplication sharedApplication];
    id<UIApplicationDelegate> applicationDelegate = application.delegate;
    AppDelegate *appDelegate = (AppDelegate *)applicationDelegate;
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.defaultUrl]]];
    
    activityIndicator.hidesWhenStopped = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Finished Loading");
    [activityIndicator stopAnimating];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString *urlString = [NSString stringWithFormat:@"http://%@", urlText.text];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    return YES;
}

- (IBAction)goBack:(id)sender {
    [webView goBack];
}

- (IBAction)goForward:(id)sender {
    [webView goForward];
}

@end
