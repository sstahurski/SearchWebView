//
//  UIWebView_SearchWebView.m
//  SearchWebView
//
//  Created by Scott Stahurski on 2/28/16.
//  Copyright © 2016 Scott Stahurski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIWebView_SearchWebView.h"

@implementation UIWebView (SearchWebView)

- (NSInteger)highlightAllOccurencesOfString:(NSString*)str
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SearchWebView" ofType:@"js"];
    NSString *jsCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self stringByEvaluatingJavaScriptFromString:jsCode];
    
    NSString *startSearch = [NSString stringWithFormat:@"MyApp_HighlightAllOccurencesOfString('%@')",str];
    [self stringByEvaluatingJavaScriptFromString:startSearch];
    
    NSString *result = [self stringByEvaluatingJavaScriptFromString:@"MyApp_SearchResultCount"];
    return [result integerValue];
}

- (void)removeAllHighlights
{
    [self stringByEvaluatingJavaScriptFromString:@"MyApp_RemoveAllHighlights()"];
}


-(void)searchNext
{
    [self stringByEvaluatingJavaScriptFromString:@"searchNext()"];
}

-(void)searchPrevious
{
    [self stringByEvaluatingJavaScriptFromString:@"searchPrev()"];
}

@end
