//
//  PICustomTableView.m
//  MessagePassing
//
//  Created by pavan on 5/13/13.
//  Copyright (c) 2013 pavan_saberjack. All rights reserved.
//

#import "PICustomTableView.h"

@interface PICustomTableView() <UITableViewDelegate>
{
}
@property (nonatomic, strong) id<UITableViewDelegate>externalDelegate; // Delegate which implements datasource and other tableview methods except scroll delegates
@end

@implementation PICustomTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    super.delegate = self;
    self.externalDelegate = delegate;
}

- (id<UITableViewDelegate>)delegate
{
    return self.externalDelegate;
}

- (void)reloadData
{
    NSLog(@"reloadData");
    [super reloadData];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([self respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self];
    }
    else if ([self.externalDelegate respondsToSelector:[anInvocation selector]])
    {
        [anInvocation invokeWithTarget:self.externalDelegate];
    }
    else
    {
        [super forwardInvocation:anInvocation];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"'scrollViewDidScroll' Delegate called in custom class"); 
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"'scrollViewDidEndDragging' Delegate called in custom class"); 
}

@end
