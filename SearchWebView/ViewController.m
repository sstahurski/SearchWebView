//
//  ViewController.m
//  SearchWebView
//
//  Created by Scott Stahurski on 2/28/16.
//  Copyright © 2016 Scott Stahurski. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView_SearchWebView.h"


@interface ViewController ()
{
    int totalItemsFound;
}


@property (strong, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (strong, nonatomic) IBOutlet UIWebView   *webView;
@property (strong, nonatomic) IBOutlet UILabel     *labelOccurences;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Lets load the webview with the yahoo page
    NSURL *url = [NSURL URLWithString:@"http://www.slashdot.org"];
    
    [self.webView setScalesPageToFit:YES];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    totalItemsFound = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//SEARCH
/////////////////////////////////////////////////////////
-(void)searchForText
{
    //remove all existing hilights
    [self.webView removeAllHighlights];
    
    
    totalItemsFound = 0;
    
    //now perform the search against the HTML document
    NSString* searchText = self.textFieldSearch.text;
    
    if(searchText.length > 0)
        totalItemsFound = (int)[self.webView highlightAllOccurencesOfString:searchText];
    
    
    //now set the text label to the number of items found
    self.labelOccurences.text = [NSString stringWithFormat:@"%d", totalItemsFound];
    
}


//UITextFiledDelegate
///////////////////////////////////////////////
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self searchForText];
    
    //hide keyboard
    [self.textFieldSearch resignFirstResponder];
    return YES;
}

//SELECTORS
////////////////////////////////////////////////

- (IBAction)searchWebViewSelector:(id)sender
{
    [self searchForText];
    [self.textFieldSearch resignFirstResponder];
}

- (IBAction)searchPreviousSelector:(id)sender {
    
    [self.webView searchPrevious];
}


- (IBAction)searchNextSelector:(id)sender {
    
    [self.webView searchNext];
}


@end
