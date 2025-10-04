//
//  iTgLegacy2AppDelegate.h
//  iTgLegacy2
//
//  Created by Igor Sementsov on 04.10.25.
//  Copyright ProZubi 2025. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

enum {
	ALLERT_TYPE_ASK_INPUT,
	ALLERT_TYPE_YES_NO,
};

@interface iTgLegacy2AppDelegate : NSObject <UIApplicationDelegate> {
	
	IBOutlet UIWindow *window;
	IBOutlet UINavigationController *navigationController;
	
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@property NSInteger allertType;
//@property (strong, nonatomic) void (^askInput_onDone)(NSString *text);
//@property (strong, nonatomic) void (^askYesNo_onYes)();


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

-(void)showMessage:(NSString *)msg;

@end

