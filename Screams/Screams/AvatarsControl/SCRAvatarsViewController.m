//
//  SCRAvatarsViewController.m
//  Screams
//
//  Created by Administrator on 7/30/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#import "SCRAvatarsViewController.h"
#import "SCRAvatarViewCell.h"

@interface SCRAvatarsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *avatarsCollectionView;

@end

@implementation SCRAvatarsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.avatarsCollectionView registerClass: [SCRAvatarViewCell class] forCellWithReuseIdentifier:@"SCRAvatarViewCell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CollectionViewDelegate Implementation

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
//    
//    if(kNoOfImages%kNoOfImagesInRow == 0)
//    {
//        return kNoOfImages/kNoOfImagesInRow;
//    }
//    else
//    {
//        return (kNoOfImages/kNoOfImagesInRow +1);
//    }
    return 2;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
//    if(kNoOfImages%kNoOfImagesInRow == 0)
//    {
//        return kNoOfImagesInRow;
//    }
//    else
//    {
//        if(section == kNoOfImages/kNoOfImagesInRow)
//            return kNoOfImages%kNoOfImagesInRow;
//        else
//            return kNoOfImagesInRow;
//    }
    return 2;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    int indexValue = indexPath.section * kNoOfImagesInRow + indexPath.item;
//    MEMFlickrImageEntity *imageEntity = localStore[indexValue];
//    FlickrImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrImageViewCell" forIndexPath:indexPath];
//    // cell.flickrImageView = [[TJImageView alloc] initWithFrame:cell.OverlayView.frame];
//    
//    [cell setImageDataToCell:imageEntity.locationUrl];
//    
//    //    [cell.flickrImageView setImageURLString:imageEntity.locationUrl];
//    cell.titleLabel.text = imageEntity.title;
//    cell.flickrImageView.hidden = imageEntity.hideImage;
//    cell.OverlayView.hidden = !imageEntity.hideImage;
//    
//    return cell;
    
    SCRAvatarViewCell *avatarViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SCRAvatarViewCell" forIndexPath:indexPath];
    return avatarViewCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    int indexValue = indexPath.section * kNoOfImagesInRow + indexPath.item;
//    if([gameLogicObject getGameStatus]!=MEMGameState_COMPLETED)
//    {
//        BOOL selectionResult = [gameLogicObject resultForSelection:indexValue];
//        if(selectionResult)
//        {
//            FlickrImageViewCell *cell = (FlickrImageViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//            cell.flickrImageView.hidden = false;
//            cell.OverlayView.hidden = true;
//            //[self updateImageEntityToShowAtIndex:indexValue];
//            
//            [self proceedToNextGameStep];
//        }
//        else
//        {
//            [MEMGlobals showMessage:@"Try again!" withTitle:@"Wrong Answer"];
//        }
//    }
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    return CGSizeMake((collectionViewContainer.frame.size.width/kNoOfImagesInRow)-5, (collectionViewContainer.frame.size.height/kNoOfImagesInRow)-5);
    return CGSizeMake(150,190);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    UIEdgeInsets insets = { .left = 2, .right = 0, .top = 2, .bottom = 0};
    return insets;
    
}


@end
