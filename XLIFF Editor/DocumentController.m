//
//  DocumentController.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "DocumentController.h"

@implementation DocumentController

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem {
    if (menuItem.action == @selector(newDocument:)) {
        return NO;
    }
    return [super validateMenuItem:menuItem];
}

@end
