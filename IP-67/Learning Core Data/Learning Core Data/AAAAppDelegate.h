//
//  AAAAppDelegate.h
//  Learning Core Data
//
//  Created by ios3644 on 26/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
