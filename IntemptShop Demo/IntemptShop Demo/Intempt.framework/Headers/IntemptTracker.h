//
//  IntemptTracker.h
//  intempt
//
//  Created by Intempt on 18/03/20.
//  Copyright © 2020 Intempt. All rights reserved.
//

#ifndef IntemptTracker_h
#define IntemptTracker_h
@import UIKit;

@interface IntemptTracker : NSObject

/**
 Please add description.
 @param orgId  Your Intempt Organization ID generated from intempt developer console
 @param sourceId Your Intempt Source ID generated from intempt developer console
 @param token Your Intempt Source token generated from intempt developer console
*/
+ (void)trackingWithOrgId:(NSString*)orgId andSourceId:(NSString*)sourceId andToken:(NSString*)token;

/**
 This will authorize geo location always (iOS 8 and above). You must also add NSLocationAlwaysUsageDescription string to Info.plist to
 authorize geo location always (foreground and background)
 @note From iOS 13 user can't grant location tracking 'always' from app. A user need to go to app settings to manually enable it.
*/
+ (void)enableGeoLocationAlways;

/**
 This will authorize geo location when in use (iOS 8 and above). You must also add NSLocationWhenInUsageDescription string to Info.plist to
 authorize geo location when in use (foreground)
*/
+ (void)enableGeoLocationInUse;

/**
Please add description.
 @param identity An Identity
 @param userProperties A dictionary of user properties
 @param error A NSError object
 @note In Swift you can pass Error object instead of NSError as error
*/
+ (void)identify:(NSString*)identity withProperties:(NSDictionary*)userProperties error:(NSError**)error;

/**
Please add description.
 @param event A Dictionary value
 @param eventCollection A String value
 @param error A NSError object
 @note In Swift you can pass Error object instead of NSError as error
 @return If event is added it will return YES otherwise NO
*/
+ (BOOL)addEvent:(NSDictionary*)event toEventCollection:(NSString*)eventCollection error:(NSError**)error;

/**
Please add description.
 @param collectionName A collection name
 @param userProperties An Array of user properties
 @param error A NSError object
 @note In Swift you can pass Error object instead of NSError as error
*/
+ (void)track:(NSString*)collectionName withProperties:(NSArray*)userProperties error:(NSError**)error;

/**
Please add description.
 @param orgId  Your Intempt Organization ID generated from intempt developer console
 @param sourceId Your Intempt Source ID generated from intempt developer console
 @param token Your Intempt Source token generated from intempt developer console
 @param uuid A device UUID
*/
+ (void)beaconWithOrgId:(NSString*)orgId andSourceId:(NSString*)sourceId andToken:(NSString*)token andDeviceUUID:(NSString*)uuid;
@end

#endif
