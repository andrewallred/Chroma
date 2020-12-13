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
    
//    [_redSlider setIntValue:appDelegate.displayManager.redMax];
//    [_greenSlider setIntValue:appDelegate.displayManager.greenMax];
//    [_blueSlider setIntValue:appDelegate.displayManager.blueMax];
    
    [_redSlider setTarget:self];
    [_redSlider setAction:@selector(redSliderValueChanged:)];
    
    [_greenSlider setTarget:self];
    [_greenSlider setAction:@selector(greenSliderValueChanged:)];
    
    [_blueSlider setTarget:self];
    [_blueSlider setAction:@selector(blueSliderValueChanged:)];
    
}

-(void)redSliderValueChanged:(NSSlider *)sender{
    
    appDelegate.displayManager.redMax = MAX(.1f, sender.intValue / 100.0f);
    
    [appDelegate.displayManager updateDisplay];
    
}

-(void)greenSliderValueChanged:(NSSlider *)sender{
    
    appDelegate.displayManager.greenMax = MAX(.1f, sender.intValue / 100.0f);
    
    [appDelegate.displayManager updateDisplay];
    
}

-(void)blueSliderValueChanged:(NSSlider *)sender{
    
    appDelegate.displayManager.blueMax = MAX(.1f, sender.intValue / 100.0f);
    
    [appDelegate.displayManager updateDisplay];
    
}

-(void) viewDidAppear {
    

    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

-(void) viewWillDisappear {
    
}


@end
