//
//  TranslationUnit.h
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TranslationUnit : NSObject

- (instancetype)initWithXMLNode:(NSXMLNode *)node;

@property (nonatomic, readonly) NSXMLNode *node;
@property (nonatomic, readonly) NSXMLNode *sourceNode;
@property (nonatomic, readonly) NSXMLNode *targetNode;
@property (nonatomic, readonly) NSXMLNode *noteNode;

@end
