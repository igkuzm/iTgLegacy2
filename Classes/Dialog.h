//
//  Dialog.h
//  iTgLegacy2
//
//  Created by Igor Sementsov on 04.10.25.
//  Copyright 2025 ProZubi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Peer.h"

@interface Dialog : NSManagedObject {

}
@property (retain) NSNumber * dialogType;
@property (retain) NSNumber * folder_id;
@property (retain) NSNumber * pinned;
@property (retain) NSNumber * pts;
@property (retain) NSNumber * read_inbox_max_id;
@property (retain) NSNumber * read_outbox_max_id;
@property (retain) NSNumber * top_message;
@property (retain) NSNumber * ttl_period;
@property (retain) NSNumber * unread_count;
@property (retain) NSNumber * unread_mark;
@property (retain) NSNumber * unread_mentions_count;
@property (retain) NSNumber * unread_muted_messages_count;
@property (retain) NSNumber * unread_muted_peers_count;
@property (retain) NSNumber * unread_reactions_count;
@property (retain) NSNumber * unread_unmuted_messages_count;
@property (retain) NSNumber * unread_unmuted_peers_count;
@property (retain) NSNumber * view_forum_as_message;

@property (retain) NSManagedObject * draft;
@property (retain) NSManagedObject * folder;
@property (retain) NSManagedObject * fwd_from;
@property (retain) NSManagedObject * notify_settings;
@property (retain) Peer * peer;

@end
