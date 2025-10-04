//
//  Message.h
//  iTgLegacy2
//
//  Created by Igor Sementsov on 04.10.25.
//  Copyright 2025 ProZubi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MessageAction.h"
#import "Peer.h"

@interface Message : NSManagedObject {

}

@property (retain) NSNumber * messageType;
@property (retain) NSDate * date;
@property (retain) NSDate * edit_date;
@property (retain) NSNumber * edit_hide;
@property (retain) NSNumber * effect;
@property (retain) NSNumber * forwards;
@property (retain) NSNumber * from_boosts_applied;
@property (retain) NSNumber * from_scheduled;
@property (retain) NSNumber * grouped_id;
@property (retain) NSNumber * id;
@property (retain) NSNumber * invert_media;
@property (retain) NSNumber * legacy;
@property (retain) NSNumber * media_unread;
@property (retain) NSNumber * mentioned;
@property (retain) NSString * message;
@property (retain) NSNumber * noforwards;
@property (retain) NSNumber * offline;
@property (retain) NSNumber * out;
@property (retain) NSNumber * pinned;
@property (retain) NSNumber * post;
@property (retain) NSString * post_author;
@property (retain) NSNumber * quick_reply_shortcut_id;
@property (retain) NSNumber * silent;
@property (retain) NSNumber * ttl_period;
@property (retain) NSNumber * via_bot_id;
@property (retain) NSNumber * via_business_bot_id;

@property (retain) MessageAction * action;
@property (retain) NSSet* entities;
@property (retain) NSManagedObject * factcheck;
@property (retain) Peer * from_id;
@property (retain) NSManagedObject * media;
@property (retain) Peer * peer_id;
@property (retain) NSManagedObject * reactions;
@property (retain) NSManagedObject * replies;
@property (retain) NSManagedObject * reply_markup;
@property (retain) NSManagedObject * reply_to;
@property (retain) NSSet* restriction_reason;
@property (retain) Peer * saved_peer_id;

@end

// coalesce these into one @interface Message (CoreDataGeneratedAccessors) section
@interface Message (CoreDataGeneratedAccessors)
- (void)addEntitiesObject:(NSManagedObject *)value;
- (void)removeEntitiesObject:(NSManagedObject *)value;
- (void)addEntities:(NSSet *)value;
- (void)removeEntities:(NSSet *)value;

- (void)addRestriction_reasonObject:(NSManagedObject *)value;
- (void)removeRestriction_reasonObject:(NSManagedObject *)value;
- (void)addRestriction_reason:(NSSet *)value;
- (void)removeRestriction_reason:(NSSet *)value;
@end
