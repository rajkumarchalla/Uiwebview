//
//  rajViewController.h
//  Uiwebview
//
//  Created by Raveendra Prasad on 28/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rajViewController : UIViewController<UIWebViewDelegate ,UITextFieldDelegate>
{
    UITextField *txfUrl;
    UIWebView *WebView;
    UIActivityIndicatorView *av;
}
@property UIWebView *webpage;

@end
