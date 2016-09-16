//
//  TranslationUnit.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "TranslationUnit.h"


@implementation TranslationUnit {
    NSXMLElement *_element;
    NSXMLNode *_targetNode;
}

- (instancetype)initWithXMLNode:(NSXMLNode *)node {
    if ([node isKindOfClass:[NSXMLElement class]] && (self = [super init])) {
        _element = (id)node;
        for (NSXMLNode *child in node.children) {
            if ([child.name isEqualToString:@"source"]) {
                _source = [child.stringValue copy];
            }
            if ([child.name isEqualToString:@"target"]) {
                _targetNode = child;
            }
            if ([child.name isEqualToString:@"note"]) {
                _note = [child.stringValue copy];;
            }
        }
    }
    return self;
}

- (NSString *)target {
    return _targetNode.stringValue;
}

- (void)setTarget:(NSString *)target {
    if (_targetNode) {
        _targetNode.stringValue = target;
    } else {
        _targetNode = [[NSXMLElement alloc] initWithName:@"target" stringValue:target];
        [_element addChild:_targetNode];
    }
    NSParameterAssert([_element.XMLString rangeOfString:target].location != NSNotFound);
}

@end
