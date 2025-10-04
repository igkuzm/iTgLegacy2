//
//  ChatPhoto.h
//  iTgLegacy2
//
//  Created by Igor Sementsov on 04.10.25.
//  Copyright 2025 ProZubi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface ChatPhoto : NSManagedObject {

}

@property (retain) NSNumber * chatPhotoType;
@property (retain) NSNumber * dc_id;
@property (retain) NSNumber * has_video;
@property (retain) NSNumber * photo_id;
@property (retain) NSData * stripped_thumb;

@end
