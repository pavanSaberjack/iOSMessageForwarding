//
//  PIViewController.m
//  MessagePassing
//
//  Created by pavan on 5/13/13.
//  Copyright (c) 2013 pavan_saberjack. All rights reserved.
//

#import "PIViewController.h"
#import "PICustomTableView.h"


@interface PIViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    PICustomTableView *table;
    
    NSUInteger rowcount;
}
@end

@implementation PIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    rowcount = 10;
    
    table = [[PICustomTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.view addSubview:table];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:10.0f];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)reloadData
{
    [table reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    [cell.textLabel setText:@"dummy text"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
