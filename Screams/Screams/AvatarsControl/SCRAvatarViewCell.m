//
//  SCRAvatarViewCell.m
//  Screams
//
//  Created by Administrator on 7/30/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#import "SCRAvatarViewCell.h"

@implementation SCRAvatarViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"SCRAvatarViewCell" owner:self options:nil];
    if ([arrayOfViews count] < 1)
    {
        return nil;
    }
    if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
    {
        return nil;
    }
    self = [arrayOfViews objectAtIndex:0];
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
