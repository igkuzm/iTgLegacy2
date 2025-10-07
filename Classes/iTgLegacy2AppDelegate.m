//
//  iTgLegacy2AppDelegate.m
//  iTgLegacy2
//
//  Created by Igor Sementsov on 04.10.25.
//  Copyright ProZubi 2025. All rights reserved.
//

#import "iTgLegacy2AppDelegate.h"
#import "RootViewController.h"
#import "ConnectionManager.h"
#import "tests.h"


@implementation iTgLegacy2AppDelegate

@synthesize window;
@synthesize navigationController;


- (id)init {
	if (self = [super init]) {
		// 
	}
	return self;
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	
	[self persistentStoreCoordinator];
	
	ConnectionManager *cm = [[ConnectionManager alloc]init];
	[cm connect];
	
	//tests *_t = [[tests alloc]init];
//	[_t performMTXTest];
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


/**
 Returns the support folder for the application, used to store the Core Data
 store file.  This code uses a folder named "CoreDataTest" for
 the content, either in the NSApplicationSupportDirectory location or (if the
 former cannot be found), the system's temporary directory.
 */

- (NSString *)documentsFolder {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
    //return [basePath stringByAppendingPathComponent:@"tg"];
	return [paths objectAtIndex:0];
}


/**
 Creates, retains, and returns the managed object model for the application 
 by merging all of the models found in the application bundle.
 */

- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
	
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.  This 
 implementation will create and return a coordinator, having added the 
 store for the application to it.  (The folder for the store is created, 
 if necessary.)
 */

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSFileManager *fileManager;
    NSString *documentsFolder = nil;
    NSURL *url;
    NSError *error;
    
    fileManager = [NSFileManager defaultManager];
    documentsFolder = [self documentsFolder];
    if ( ![fileManager fileExistsAtPath:documentsFolder isDirectory:NULL] ) {
        [fileManager createDirectoryAtPath:documentsFolder attributes:nil];
    }
    
    url = [NSURL fileURLWithPath: [documentsFolder stringByAppendingPathComponent: @"tg.sqlite"]];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error]){
        [self showMessage:error.description];
	}   
	
    return persistentStoreCoordinator;
}


/**
 Returns the managed object context for the application (which is already
 bound to the persistent store coordinator for the application.) 
 */

- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return managedObjectContext;
}


/**
 Returns the NSUndoManager for the application.  In this case, the manager
 returned is that of the managed object context for the application.
 */

- (NSUndoManager *)windowWillReturnUndoManager:(UIWindow *)window {
    return [[self managedObjectContext] undoManager];
}


-(void)showMessage:(NSString *)msg {
	UIAlertView *alert = 
	[[UIAlertView alloc]initWithTitle:@"" 
							  message:msg 
							 delegate:nil 
					cancelButtonTitle:@"Закрыть" 
					otherButtonTitles:nil];
	
	[alert show];
}
/*
-(void)askInput:(NSString *)msg onDone:(void (^)(NSString *text))onDone{
	self.askInput_onDone = onDone;
	self.allertType = ALLERT_TYPE_ASK_INPUT;
	UIAlertView *alert = 
	[[UIAlertView alloc]initWithTitle:@"" 
							  message:msg 
							 delegate:self 
					cancelButtonTitle:@"OK" 
					otherButtonTitles:nil];
	
	[alert setAlertViewStyle:UIAlertViewStylePlainTextInput]; 
	[alert show];
}

-(void)askYesNo:(NSString *)msg onYes:(void (^)())onYes{
	self.allertType = ALLERT_TYPE_YES_NO;
	self.askYesNo_onYes = onYes;
	UIAlertView *alert = 
	[[UIAlertView alloc]initWithTitle:@"" 
							  message:msg 
							 delegate:self 
					cancelButtonTitle:@"cancel" 
					otherButtonTitles:@"OK", nil];
	
	[alert show];
}

-(void)alertView:(UIAlertView *)alertView 
clickedButtonAtIndex:(NSInteger)buttonIndex
{	
	switch (self.allertType) {
		case ALLERT_TYPE_ASK_INPUT:
		{
			UITextField *textField = [alertView textFieldAtIndex:0];
			if (self.askInput_onDone)
				self.askInput_onDone(textField.text);
		}
			break;
		case ALLERT_TYPE_YES_NO:
		{
			if (buttonIndex == 1){
				if (self.askYesNo_onYes)
					self.askYesNo_onYes();
			}
		}
			break;
			
		default:
			break;
	}
	
}
*/
@end
