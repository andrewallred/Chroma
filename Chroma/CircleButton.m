//
//  CircleButton.m
//  Chroma
//
//  Created by Allred, Andrew on 12/13/20.
//

#import "CircleButton.h"
#import "AppDelegate.h"

@implementation CircleButton {
    AppDelegate* appDelegate;
}

- (void)awakeFromNib{
    NSLog(@"awakeFromNib");
    
    appDelegate = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    
    [self setAction:@selector(didClick:)];
    [self setTarget:self];
}

-(void) didClick:(id*) button {
    NSLog(@"Clicked");
    
    [appDelegate.displayManager setColor:self.color];
    [appDelegate.displayManager updateDisplay];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSBezierPath* path = [NSBezierPath bezierPathWithOvalInRect:dirtyRect];
    [path addClip];
    
    [self.color setFill];
    [path fill];
}

@end
