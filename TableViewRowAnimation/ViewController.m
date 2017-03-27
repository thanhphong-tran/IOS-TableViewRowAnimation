//
//  ViewController.m
//  TableViewRowAnimation
//
//  Created by CPU11808 on 3/27/17.
//  Copyright © 2017 CPU11808. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"

@interface ViewController () <UITableViewDataSource>

@property(nonatomic) NSMutableArray *messages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *add = [UIBarButtonItem new];
    add.title = @"Add";
    [add setTarget:self];
    [add setAction:@selector(addButtonClick)];
    
    
    UIBarButtonItem *delete = [UIBarButtonItem new];
    delete.title = @"Delete";
    [delete setTarget:self];
    [delete setAction:@selector(deleteButtonClick)];
    
    self.navigationItem.leftBarButtonItem = add;
    self.navigationItem.rightBarButtonItem = delete;
    
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.messages = [NSMutableArray new];
    [_messages addObject:[Message messageWithContent:@"new message" isLeft:true]];
}

- (void)addButtonClick {
    NSLog(@"add");
    
    static BOOL isLeft = true;
    isLeft = !isLeft;

    [_tableView beginUpdates];
    [_messages insertObject:[Message messageWithContent:@"new message" isLeft:isLeft] atIndex:0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [_tableView insertRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:isLeft ? UITableViewRowAnimationLeft:UITableViewRowAnimationRight];
    [_tableView endUpdates];
}

- (void)deleteButtonClick {
    NSLog(@"delete");

    if ([_messages count] > 0) {
        
        [_tableView beginUpdates];

        [_messages removeObjectAtIndex:0];
        
        NSArray *indexPaths = [[NSArray alloc] initWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
        
        BOOL isLeft = ((Message *)_messages[0]).isLeft;
        int animation = isLeft ? UITableViewRowAnimationLeft : UITableViewRowAnimationRight;
        [_tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
        
        [_tableView endUpdates];
    }
    
}

#pragma mark UITabbleViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *leftCellIdentify = @"LeftCell";
    static NSString *rightCellIdentify = @"RightCell";
    
    Message *message = _messages[indexPath.row];

    UITableViewCell *cell;
    if (message.isLeft) {
        cell = [tableView dequeueReusableCellWithIdentifier:leftCellIdentify];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:rightCellIdentify];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = message.content;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
