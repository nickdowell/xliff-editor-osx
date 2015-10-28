//
//  TranslationUnit.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "TranslationUnit.h"


@implementation TranslationUnit

- (instancetype)initWithXMLNode:(NSXMLNode *)node {
    if ((self = [super init])) {
        _node = node;
        for (NSXMLNode *child in node.children) {
            if ([child.name isEqualToString:@"source"]) {
                _sourceNode = child;
            }
            if ([child.name isEqualToString:@"target"]) {
                _targetNode = child;
            }
            if ([child.name isEqualToString:@"note"]) {
                _noteNode = child;
            }
        }
    }
    return self;
}

@end
