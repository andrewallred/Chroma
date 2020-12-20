//
//  ViewController.m
//  Chroma
//
//  Created by Allred, Andrew on 12/9/20.
//

#import "ViewController.h"
#import <CoreGraphics/CGDirectDisplay.h>
#import "AppDelegate.h"

@implementation ViewController {
    AppDelegate* appDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    appDelegate.mainViewController = self;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
