//
//  ViewController.m
//  XLIFF Editor
//
//  Created by Nicolas Dowell on 2015-10-28.
//  Copyright © 2015 Nick Dowell. All rights reserved.
//

#import "ViewController.h"

#import "Document.h"


@interface ViewController () <NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, weak) Document *document;
@property (nonatomic, weak) IBOutlet NSTableView *tableView;

@end


@implementation ViewController

- (void)viewWillAppear {
    [super viewWillAppear];

    self.document = self.view.window.windowController.document;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.document.translationUnits.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    TranslationUnit *translationUnit = self.document.translationUnits[row];
    if ([tableColumn.identifier isEqualToString:@"source"]) {
        return translationUnit.sourceNode.stringValue;
    }
    if ([tableColumn.identifier isEqualToString:@"target"]) {
        return translationUnit.targetNode.stringValue;
    }
    if ([tableColumn.identifier isEqualToString:@"note"]) {
        return translationUnit.noteNode.stringValue;
    }
    return nil;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(nullable id)object forTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    TranslationUnit *translationUnit = self.document.translationUnits[row];
    if ([tableColumn.identifier isEqualToString:@"target"]) {
        NSParameterAssert([object isKindOfClass:[NSString class]]);
        translationUnit.targetNode.stringValue = object;
        [self.document updateChangeCount:NSChangeDone];
    }
}

#pragma mark - NSTableViewDelegate

@end
