//
//  ViewController.m
//  Chroma
//
//  Created by Allred, Andrew on 12/9/20.
//

#import "ViewController.h"
#import <CoreGraphics/CGDirectDisplay.h>



@implementation ViewController

float redMin;
float redMax;
float redGamma;

float greenMin;
float greenMax;
float greenGamma;

float blueMin;
float blueMax;
float blueGamma;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGGetDisplayTransferByFormula(CGMainDisplayID(), &redMin, &redMax, &redGamma, &greenMin, &greenMax, &greenGamma, &blueMin, &blueMax, &blueGamma);
    
    _redSlider.intValue = redMax * 100;
    _greenSlider.intValue = greenMax * 100;
    _blueSlider.intValue = blueMax * 100;
    
    [_redSlider setTarget:self];
    [_redSlider setAction:@selector(redSliderValueChanged:)];
    
    [_greenSlider setTarget:self];
    [_greenSlider setAction:@selector(greenSliderValueChanged:)];
    
    [_blueSlider setTarget:self];
    [_blueSlider setAction:@selector(blueSliderValueChanged:)];
    
}

-(void)redSliderValueChanged:(NSSlider *)sender{
    
    redMax = MAX(.1f, sender.intValue / 100.0f);
    
    CGSetDisplayTransferByFormula(CGMainDisplayID(), redMin, redMax, redGamma, greenMin, greenMax, greenGamma, blueMin, blueMax, blueGamma);
    
}

-(void)greenSliderValueChanged:(NSSlider *)sender{
    
    greenMax = MAX(.1f, sender.intValue / 100.0f);
    
    CGSetDisplayTransferByFormula(CGMainDisplayID(), redMin, redMax, redGamma, greenMin, greenMax, greenGamma, blueMin, blueMax, blueGamma);
    
}

-(void)blueSliderValueChanged:(NSSlider *)sender{
    
    blueMax = MAX(.1f, sender.intValue / 100.0f);
    
    CGSetDisplayTransferByFormula(CGMainDisplayID(), redMin, redMax, redGamma, greenMin, greenMax, greenGamma, blueMin, blueMax, blueGamma);
    
}

-(void) viewDidAppear {
    
    self.view.window.backgroundColor = [NSColor darkGrayColor];
    
    self.view.window.styleMask = self.view.window.styleMask & ~NSWindowStyleMaskResizable;
    
    //= mainWindow.styleMask & ~NSWindowStyleMaskResizable;
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

-(void) viewWillDisappear {
    
}


@end
