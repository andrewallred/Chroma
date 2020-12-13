//
//  AppDelegate.m
//  Chroma
//
//  Created by Allred, Andrew on 12/9/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (id)init {
    
    self = [super init];
    if (self) {
        NSLog(@"init");
        self.displayManager = [[DisplayManager alloc] init];
    }
    return self;
        
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
