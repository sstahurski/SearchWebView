# SearchWebView
Obj-C / iOS.  This is an extention of the UIWebView that will allow the searching of a web page for a specific string.

#Features
The code is an small extention to UIWebView.  
It will hilight in yellow all occurances of a search string in a UIWebView.
Next, if you are using the previous/next features it will scroll to the next/previous occurance and hilight it in green.
But you can change the hilight colors in the javascript

#Files
Really all you need is to include the 
SearchWebView.js
UIWebView_SearchWebView.h
UIWebView_SearchWebView.m

#Methods
There are 4 methods to the class:

-(NSInteger)highlightAllOccurencesOfString:(NSString*)str;
Will perform a search for all of the occurances of a search string and will hilight them.
Note that it returns the number of hits, that way you can actually inform the user if you want how many occurances exits.

-(void)removeAllHighlights;
Removes all of the hilights....basically a rest

-(void)searchNext;
Goes to the first or next occurence of a hilighted string

-(void)searchPrevious;
Goes to the prevoius occurence of a hilighted string

(You can keep a position cursor in your view controller if you need to show which hilighted search item you are on)

#Coming soon?
Ability to select hilight colors...

#License
[MIT](http://choosealicense.com/licenses/mit/) open source... 

#Donate
If you found it useful and it saved you time and effort, please donate...  Thank you!
[![](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.me/SStahurski)
