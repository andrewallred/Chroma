//
//  WindowController.m
//  Chroma
//
//  Created by Allred, Andrew on 12/10/20.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (BOOL) windowShouldClose:(NSWindow *)sender {
    [NSApp hide:nil];
    return NO;
}

@end
