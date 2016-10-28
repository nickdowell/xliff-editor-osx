//
//  Document.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "Document.h"


@interface Document ()

@property (nonatomic, strong) NSXMLDocument *xml;

@end


@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
}

+ (BOOL)autosavesInPlace {
    return NO;
}

- (void)makeWindowControllers {
    [self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    return [self.xml XMLDataWithOptions:NSXMLNodePrettyPrint];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    NSXMLDocument *xml = [[NSXMLDocument alloc] initWithData:data options:0 error:outError];
    if (!xml) {
        return NO;
    }
    NSXMLElement *root = [xml rootElement];
    if (![root.name isEqualToString:@"xliff"] || ![root.name isEqualToString:@"xlf"]) {
        return NO;
    }
    self.xml = xml;
    NSMutableArray *array = [NSMutableArray array];
    for (NSXMLNode *node in [root nodesForXPath:@"//trans-unit" error:NULL]) {
        [array addObject:[[TranslationUnit alloc] initWithXMLNode:node]];
    }
    self.translationUnits = [NSArray arrayWithArray:array];
    return YES;
}

@end
