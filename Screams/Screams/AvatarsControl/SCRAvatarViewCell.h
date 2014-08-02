//
//  SCRAvatarViewCell.h
//  Screams
//
//  Created by Administrator on 7/30/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRAvatarViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *avatarNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screamCountLabel;

@end
