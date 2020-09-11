//
//  IntemptClient.h
//  intempt
//
//  Created by Intempt on 18/03/20.
//  Copyright © 2020 Intempt. All rights reserved.
//

@import Foundation;
@import CoreLocation;
@import CoreBluetooth;

@protocol intemptDelegate <NSObject>
/**
 Called upon entering the region
 @param beaconData CLBeacon
*/
-(void)didEnterRegion:(CLBeacon*)beaconData;

/**
 Called upon exiting the region
 @param beaconData CLBeacon
*/
-(void)didExitRegion:(CLBeacon*)beaconData;

@end

@interface IntemptClient : NSObject

@property (weak, nonatomic) id <intemptDelegate> delegate;

@property (strong, nonatomic) CLLocation *currentLocation;

/**
Add Description
 @param organizationId Organization Id
 @param trackerId  Tracker Id
 @param token Source token
*/
+ (IntemptClient *)sharedClientWithOrganizationId:(NSString *)organizationId andTrackerId:(NSString *)trackerId andToken:(NSString *)token;

/**
Add Description
*/
+ (IntemptClient *)sharedClient;

/**
 Call this to authorize geo location always (iOS 8 and above). You must also add NSLocationAlwaysUsageDescription string to Info.plist to
 authorize geo location always (foreground and background), call this BEFORE doing anything else with ITClient.
 @note From iOS 13 user can't grant location tracking 'always' from app. A user need to go to app settings to manually enable it.
 */
+ (void)authorizeGeoLocationAlways;

/**
 Call this to authorize geo location when in use (iOS 8 and above). You must also add NSLocationWhenInUsageDescription string to Info.plist to
 authorize geo location when in use (foreground), call this BEFORE doing anything else with ITClient.
 */
+ (void)authorizeGeoLocationWhenInUse;

/**
 Call this to enable geo location. You'll probably only have to call this if for some reason you've explicitly
 disabled geo location.
 Geo location is ENABLED by default.
 */
+ (void)enableGeoLocation;

/**
 Call this to disable geo location. If you don't want to pop up a message to users asking them to approve geo location
 services, call this BEFORE doing anything else with ITClient.
 
 Geo location is ENABLED by default.
 */
+ (void)disableGeoLocation;

/**
 Call this to disable debug logging. It's disabled by default.
 */
+ (void)disableLogging;

/**
 Call this to enable debug logging.
 */
+ (void)enableLogging;

/**
 Returns whether or not logging is currently enabled.
 
 @return true if logging is enabled, false if disabled.
 */
+ (Boolean)isLoggingEnabled;

/**
 Call this to retrieve an instance of ITEventStore.
 @return An instance of ITEventStore.
 */


/**
 Call this if your code needs to use more than one Intempt project.  By convention, if you
 call this, you're responsible for releasing the returned instance once you're finished with it.
 
 Otherwise, just use [ITClient sharedClient].
 
 @param organizationId Your Intempt Organization ID.
 @param trackerId Your Intempt Tracker ID.
 @param token Your Intempt Tracker security token.
 @return An initialized instance of ITClient.
 */
- (id)initWithOrganizationId:(NSString *)organizationId andTrackerId:(NSString *)trackerId andToken:(NSString *)token;

/**
 Add description
 @param organizationId Your Intempt Organization ID.
 @param sourceId Your Intempt Tracker ID.
 @param token Your Intempt Tracker security token.
 @param propertiesOverrides A property Dictonary
 @param propertiesOverridesBlock A completion block
 @return An initialized instance of ITClient.
 */
-(id)initWithOrganizationId:(NSString *)organizationId andTrackerId:(NSString *)sourceId andToken:(NSString *)token andPropertiesOverrides:(NSDictionary *)propertiesOverrides andPropertiesOverridesBlock:(NSDictionary *(^)(NSString *))propertiesOverridesBlock;

/**
Add description
@param event Your Intempt Organization ID
@param eventCollection Your Intempt Tracker ID
@param anError Your Intempt Tracker security token
@return If event is added it will return YES otherwise NO
*/
- (BOOL)addEvent:(NSDictionary *)event toEventCollection:(NSString *)eventCollection error:(NSError **)anError;

/**
Add description
@param identity Identity
@param userProperties User properties dictionary
@param error A NSError object
*/
- (void)identify:(NSString*)identity withProperties:(NSDictionary *)userProperties error:(NSError **)error;

/**
Add description
@param collectionName Name of the collection
@param userProperties User properties dictionary
@param error A NSError object
*/
- (void)track:(NSString*)collectionName withProperties:(NSArray *)userProperties error:(NSError **)error;

/**
Add description
@param orgId Your Intempt Organization ID.
@param trackerId Your Intempt Tracker ID.
@param token Your Intempt Tracker security token.
*/
- (void)withOrgId:(NSString*)orgId andSourceId:(NSString*)trackerId andToken:(NSString*)token uuidString:(NSString*)uuid;

/**
 Call this to initialize CLLocationManager if not initialized and start updating location
*/
- (void)refreshCurrentLocation;

/**
Get Intempt Visitor ID
@return visitior ID
*/
- (NSString *)getVisitorId;

/**
 Get Intempt SDK Version
 @return The current SDK version.
 */
+ (NSString *)sdkVersion;


// defines the TBLog macro
#define INTEMPT_LOGGING_ENABLED [IIntemptClient loggingEnabled]
#define TBLog(message, ...)if([IntemptClient isLoggingEnabled]) NSLog(message, ##__VA_ARGS__)

@end

