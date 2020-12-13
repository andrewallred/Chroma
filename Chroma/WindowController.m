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
    
    self.window.backgroundColor = [NSColor clearColor];
    self.window.styleMask = self.window.styleMask & ~NSWindowStyleMaskResizable;
    self.window.movableByWindowBackground = YES;
    
    [self.window setOpaque:NO];
    [self.window setHasShadow:NO];
    
}

- (BOOL) windowShouldClose:(NSWindow *)sender {
    [NSApp hide:nil];
    return NO;
}

@end
