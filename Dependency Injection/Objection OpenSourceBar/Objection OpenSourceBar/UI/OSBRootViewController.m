#import "OSBRootViewController.h"
#import "OSBTheme.h"
#import "OSBNetworkManger.h"
#import "OSBCellView.h"


@implementation OSBRootViewController {
    id<OSBTheme> _theme;
    NSArray *_items;
}

- (instancetype)initWithTheme:(id <OSBTheme>)theme {
    self = [super init];
    if (self) {
        _theme = theme;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
    self.tableView.backgroundColor = [_theme backgroundColor];
    self.tableView.rowHeight = 44;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[OSBCellView class] forCellReuseIdentifier:@"OSBCellViewId"];

    _items = [_networkManger getItemes];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OSBCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"OSBCellViewId" forIndexPath:indexPath];
    cell.title.text = _items[(NSUInteger)indexPath.row];
    [cell applyTheme:_theme];
    return cell;
}



@end