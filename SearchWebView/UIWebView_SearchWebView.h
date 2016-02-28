//
//  UIWebView_SearchWebView.h
//  SearchWebView
//
//  Created by Scott Stahurski on 2/28/16.
//  Copyright © 2016 Scott Stahurski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (SearchWebView)

-(NSInteger)highlightAllOccurencesOfString:(NSString*)str;

-(void)removeAllHighlights;

-(void)searchNext;
-(void)searchPrevious;


@end
