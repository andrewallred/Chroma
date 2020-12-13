//
//  DisplayManager.h
//  Chroma
//
//  Created by Allred, Andrew on 12/13/20.
//

#import <Foundation/Foundation.h>
#import <AppKit/NSColor.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisplayManager : NSObject

@property (assign) float redMin;
@property (assign) float redMax;
@property (assign) float redGamma;

@property (assign) float greenMin;
@property (assign) float greenMax;
@property (assign) float greenGamma;

@property (assign) float blueMin;
@property (assign) float blueMax;
@property (assign) float blueGamma;

- (void)updateDisplay;
- (void)setColor:(NSColor*)color;

@end

NS_ASSUME_NONNULL_END
