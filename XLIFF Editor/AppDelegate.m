//
//  AppDelegate.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "AppDelegate.h"

#import "DocumentController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (instancetype)init {
    if ((self = [super init])) {
        (void)[[DocumentController alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
    [[NSDocumentController sharedDocumentController] openDocument:sender];
    return NO;
}

@end
