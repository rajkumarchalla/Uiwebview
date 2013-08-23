//
//  rajViewController.m
//  Uiwebview
//
//  Created by Raveendra Prasad on 28/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rajViewController.h"

@interface rajViewController ()

@end

@implementation rajViewController
@synthesize webpage;
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self CreateDynamicControl];
}

-(void)CreateDynamicControl
{
    // programmatically Create UINavigationController
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:navBar];
    
    // programmatically Create UIActivityIndicatorView
    
    av = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(5, 11, 20, 20)];
    [av setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [av setHidden:FALSE];
    [self.view addSubview:av];
    
    // programmatically Create UITextField
    
    txfUrl = [[UITextField alloc] initWithFrame:CGRectMake(44, 7, 223, 31)];
    txfUrl.borderStyle = UITextBorderStyleRoundedRect;
    txfUrl.returnKeyType = UIReturnKeyDone;
    txfUrl.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txfUrl.delegate = self;
    [navBar addSubview:txfUrl];
    
    // programmatically Create UIButton
    
    UIButton *BtnSearch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BtnSearch setTitle:@"Go" forState:UIControlStateNormal];
    [BtnSearch setTintColor:[UIColor grayColor]];
    [BtnSearch setFrame:CGRectMake(271, 6, 44, 31)];
    [BtnSearch addTarget:self action:@selector(GoClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BtnSearch];
    
    // programmatically Create UIWebView
    
    WebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 372)];
    WebView.delegate = self;
    [self.view addSubview:WebView];
    
    // programmatically Create UIToolbar
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 416, 320, 44)];
    [self.view addSubview:toolBar];
    
    // UIBarButtonItem programmatically add in UIToolbar
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"Backward" style:UIBarButtonItemStyleBordered target:self action:@selector(GoBack)];
    UIBarButtonItem *btnFoward = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStyleBordered target:self action:@selector(GoForward)];
    UIBarButtonItem *FixeSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    FixeSpace.width = 150.0f;
    
    
    NSArray *buttons = [NSArray arrayWithObjects: btnBack,FixeSpace,btnFoward, nil];
    [toolBar setItems:buttons];
    NSString *url=[NSString stringWithFormat:@"http://"];
    txfUrl.text=url;
    
}

//webview delegate mathods to manage the webview content.
-(void)GoClicked
{
    [txfUrl resignFirstResponder];
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[txfUrl text]]]];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [av startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [av stopAnimating];
}

-(void)GoBack
{
    [WebView goBack];
}
-(void)GoForward
{
    [WebView goForward];
}

//  UITextField delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txfUrl resignFirstResponder];
    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:txfUrl.text]]];
    //    NSString *query=[txfUrl.text stringByReplacingOccurrencesOfString:@"  " withString:@" + "];
    //    NSURL *urlquery=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",query]];
    //    NSURLRequest *request=[NSURLRequest requestWithURL:urlquery];
    return YES;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
