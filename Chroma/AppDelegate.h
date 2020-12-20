//
//  AppDelegate.h
//  Chroma
//
//  Created by Allred, Andrew on 12/9/20.
//

#import <Cocoa/Cocoa.h>
#import "DisplayManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) DisplayManager* displayManager;
@property (strong, nonatomic) NSViewController* mainViewController;

@end

