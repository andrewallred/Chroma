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

- (void)updateDisplay {
    CGSetDisplayTransferByFormula(CGMainDisplayID(), redMin, redMax, redGamma, greenMin, greenMax, greenGamma, blueMin, blueMax, blueGamma);
}

- (void)setColor:(NSColor*)color {
    
    redMax = [color redComponent];
    greenMax = [color greenComponent];
    blueMax = [color blueComponent];
    
}

@end
