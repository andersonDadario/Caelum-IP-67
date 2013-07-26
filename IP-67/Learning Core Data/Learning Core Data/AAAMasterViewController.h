//
//  AAAMasterViewController.h
//  Learning Core Data
//
//  Created by ios3644 on 26/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AAADetailViewController;

#import <CoreData/CoreData.h>

@interface AAAMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) AAADetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
