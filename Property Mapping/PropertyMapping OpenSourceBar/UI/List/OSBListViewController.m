//
//  OSBListViewController.m
//  PropertyMapping OpenSourceBar
//
//  Created by Michał Laskowski on 27/01/15.
//  Copyright (c) 2015 Polidea Sp. z o.o. All rights reserved.
//

#import <Mantle/MTLJSONAdapter.h>
#import "OSBListViewController.h"
#import "OSBListViewCell.h"
#import "OSBArticleViewController.h"
#import "OSBMantleArticle.h"
#import "OSBManualArticle.h"
#import "DCKeyValueObjectMapping.h"
#import "OSBPropertyMapperArticle.h"
#import "OSBKeyValueObjectMappingArticle.h"

@implementation OSBListViewController {
    NSArray *_items;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _items = @[@"Manual", @"KeyValueObjectMapping", @"KZPropertyMapper", @"Mantle"];
        self.navigationItem.title = @"Property mapping";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    [self.tableView registerClass:[OSBListViewCell class] forCellReuseIdentifier:@"OSBListCellId"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OSBListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OSBListCellId" forIndexPath:indexPath];

    cell.titleLabel.text = indexPath.row < _items.count ? _items[(NSUInteger)indexPath.row] : @"";

    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"article" ofType:@"json"];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path]
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];

    id<OSBArticle> article;
    if (indexPath.row == 0) {
        article = [[OSBManualArticle alloc] initWithDictionary:data];
    }
    else if (indexPath.row == 1) {
        article = [OSBKeyValueObjectMappingArticle articleFromDictionary:data];
    }
    else if (indexPath.row == 2) {
        article = [[OSBPropertyMapperArticle alloc] initWithDictionary:data];
    }
    else if (indexPath.row == 3) {
        article = [MTLJSONAdapter modelOfClass:OSBMantleArticle.class
                            fromJSONDictionary:data
                                         error:nil];
    }

    OSBArticleViewController *articleViewController = [[OSBArticleViewController alloc] initWithArticle:article
                                                                                                  title:_items[(NSUInteger)indexPath.row]];
    [self showViewController:articleViewController sender:self];
}

@end
