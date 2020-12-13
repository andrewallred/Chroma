//
//  NSViewWithRoundedCorners.m
//  Chroma
//
//  Created by Allred, Andrew on 12/12/20.
//

#import "NSViewWithRoundedCorners.h"

@implementation NSViewWithRoundedCorners

- (void)awakeFromNib{
    NSLog(@"awakeFromNib");
}

- (id) init {
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initWithFrame");
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    
    NSRect rect = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height);
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:10 yRadius:10];
    [path addClip];
    
    NSGradient* gradient = [[NSGradient alloc] initWithStartingColor:[NSColor darkGrayColor] endingColor:[NSColor darkGrayColor]];
    
    [gradient drawInRect:self.frame angle:90];
    
}

@end
