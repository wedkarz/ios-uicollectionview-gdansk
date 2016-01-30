//
// Created by Maciej Oczko on 26/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakersViewController.h"
#import "SpeakersDataSource.h"

@interface SpeakersViewController () <UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView *collectionView;
@end

@implementation SpeakersViewController

/*
    This is a view controller for managing collection view.
    It takes `SpeakersDataSource` as a dependency to provide items for collection view.

    Please follow the TODOs to complete this exercise.
    (To list TODOs in AppCode use CMD+6 shortcut.)

    HINT 1: This controller should be a collection view delegate.
    HINT 2: `SpeakersDataSource` should be a collection view data source.
 */
+ (instancetype)withDataSource:(SpeakersDataSource *)dataSource {
    return [[self alloc] initWithDataSource:dataSource];
}

- (instancetype)initWithDataSource:(SpeakersDataSource *)dataSource {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _dataSource = dataSource;
        self.title = @"Speakers";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Speakers"]
                                                          tag:1];
    }

    return self;
}

- (void)loadView {
    // Remove this after setting self.view
    [super loadView];

    // TODO 1. You should create a UICollectionView with UICollectionViewFlowLayout here.
    // This is a place where you can set collection view's delegate and data source.

    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.sectionInset = UIEdgeInsetsMake(2, 5, 2, 5);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [_dataSource bindWithCollectionView:self.collectionView];

    self.collectionView.delegate = self;

    [self.view addSubview:self.collectionView];
    // HINT 1: Remember about special delegate protocol for UICollectionViewFlowLayout.
    // HINT 2: For setting data source please see `-bindWithCollectionView:` method in `SpeakersDataSource` class (which should be invoked here).
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

// TODO 4. You should override `-collectionView:layout:sizeForItemAtIndexPath:` method to provide cell size.
// HINT: Remember about special delegate protocol for UICollectionViewFlowLayout.

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width / 2 - 10,self.view.frame.size.width / 2 - 10);
}


@end
