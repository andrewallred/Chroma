//
//  DisplayManager.m
//  Chroma
//
//  Created by Allred, Andrew on 12/13/20.
//

#import "DisplayManager.h"

@implementation DisplayManager

@synthesize redMin;
@synthesize redMax;
@synthesize redGamma;

@synthesize greenMin;
@synthesize greenMax;
@synthesize greenGamma;

@synthesize blueMin;
@synthesize blueMax;
@synthesize blueGamma;

- (id)init {
    
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    
    CGGetDisplayTransferByFormula(CGMainDisplayID(), &redMin, &redMax, &redGamma, &greenMin, &greenMax, &greenGamma, &blueMin, &blueMax, &blueGamma);
    
    return self;
    
}

CGDirectDisplayID displays[100];
uint32_t numDisplays;

-(void)updateDisplays {
    
    CGGetActiveDisplayList(100, displays, &numDisplays);
    
    for (int i = 0; i < numDisplays; i++) {
        [self updateDisplay:displays[i]];
    }

}

- (void)updateDisplay:(CGDirectDisplayID) displayId {
    CGSetDisplayTransferByFormula(displayId, redMin, redMax, redGamma, greenMin, greenMax, greenGamma, blueMin, blueMax, blueGamma);
}

- (void)setColor:(NSColor*)color {
    
    redMax = [color redComponent];
    greenMax = [color greenComponent];
    blueMax = [color blueComponent];
    
}

@end
