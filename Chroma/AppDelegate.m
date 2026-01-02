//
//  AppDelegate.m
//  Chroma
//
//  Created by Allred, Andrew on 12/9/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSPopover* popover;
@property (strong, nonatomic) NSStatusItem* statusItem;

@end

@implementation AppDelegate

BOOL isPopover = NO;
- (id)init {
    
    self = [super init];
    if (self) {
        
        NSLog(@"init");
        self.displayManager = [[DisplayManager alloc] init];
        [NSApp setActivationPolicy: NSApplicationActivationPolicyAccessory];
        
    }
    return self;
        
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSPopover* popover = [[NSPopover alloc] init];
    popover.contentSize = NSSizeFromCGSize(CGSizeMake(160, 160));
    popover.behavior = NSPopoverBehaviorTransient;
    popover.contentViewController = self.mainViewController;
    self.popover = popover;
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    self.statusItem.button.image = [NSImage imageNamed:@"Icon"];
    self.statusItem.button.action = @selector(togglePopover:);
    
    [[NSApplication sharedApplication] activateIgnoringOtherApps : YES];
    
}

-(void) togglePopover:(id) sender {

    if (isPopover) {
        if ([self.popover isShown]) {
            [self.popover performClose:sender];
        } else {
            [self.popover showRelativeToRect:self.statusItem.button.bounds ofView:self.statusItem.button preferredEdge:NSRectEdgeMinY];
        }
    }
    else {
        if ([NSApplication sharedApplication].activationPolicy == NSApplicationActivationPolicyRegular) {
            [NSApp setActivationPolicy: NSApplicationActivationPolicyAccessory];
        } else {
            [NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
            [[NSApplication sharedApplication] activateIgnoringOtherApps : YES];
            
            // Show and bring the main window to the front
            NSWindow *mainWindow = [NSApplication sharedApplication].windows.firstObject;
            if (mainWindow) {
                [mainWindow makeKeyAndOrderFront:nil];
                [mainWindow orderFrontRegardless];
            }
        }
    }

}


@end
