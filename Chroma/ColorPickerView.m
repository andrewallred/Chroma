//
//  NSViewWithRoundedCorners.m
//  Chroma
//
//  Created by Allred, Andrew on 12/12/20.
//

#import "ColorPickerView.h"
#import "DisplayManager.h"
#import "AppDelegate.h"

@implementation ColorPickerView {
    AppDelegate* appDelegate;
}

- (void)awakeFromNib{
    NSLog(@"awakeFromNib");
    
    appDelegate = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    
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
    
    NSGradient* backgroundGradient = [[NSGradient alloc] initWithStartingColor:[NSColor whiteColor] endingColor:[NSColor whiteColor]];
    
    [backgroundGradient drawInRect:self.frame angle:90];
    
    CGContextRef c = [NSGraphicsContext currentContext].CGContext;
    
    int size = 20;
    float width = self.frame.size.height;
    //float halfWidth = width / 2;
    float height = self.frame.size.height;
    //float halfHeight = height / 2;
    
    for (int i = 0; i < width; i += size) {
        for (int j = 0; j < height; j += size) {
            
            [[self getColorFromCoordinatesFromX:i Y:j forSize:self.frame.size] setFill];
            CGContextFillRect(c, CGRectMake(i, j, size, size));
            
        }
    }
    
}

-(NSColor*) getColorFromCoordinatesFromX:(int) x Y:(int) y forSize:(CGSize) size {
    return [NSColor colorWithRed:1 green:y/size.height blue:x/size.width alpha:1.0];
}

-(void) mouseDown:(NSEvent *)event {
    
    NSPoint point = [event locationInWindow];
    
    NSColor* color = [self getColorFromCoordinatesFromX:point.x Y:point.y forSize:self.frame.size];
    
    appDelegate.displayManager.redMax = color.redComponent;
    appDelegate.displayManager.greenMax = color.greenComponent;
    appDelegate.displayManager.blueMax = color.blueComponent;
    
    [appDelegate.displayManager updateDisplays];
        
}

@end
