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

@property (nonatomic, readonly) NSString *source;
@property (nonatomic, copy)     NSString *target;
@property (nonatomic, readonly) NSString *note;

@end
