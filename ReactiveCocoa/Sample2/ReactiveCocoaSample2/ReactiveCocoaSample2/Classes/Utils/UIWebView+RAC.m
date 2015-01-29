//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "UIWebView+RAC.h"
#import "BlocksKit+UIKit.h"
#import "RequestBuilder+Authorization.h"

@implementation UIWebView (RAC)

- (RACSignal *)shouldStartLoadSignal {
    RACSubject *shouldStartLoad = [RACSubject subject];
    self.bk_shouldStartLoadBlock = ^BOOL(UIWebView *_, NSURLRequest *request, UIWebViewNavigationType navigationType) {
        BOOL isRedirectURL = [request.URL.absoluteString hasPrefix:RedirectURLString];
        if (isRedirectURL) {
            [shouldStartLoad sendNext:request.URL];
            [shouldStartLoad sendCompleted];
        }
        return !isRedirectURL;
    };
    return shouldStartLoad;
}

@end
