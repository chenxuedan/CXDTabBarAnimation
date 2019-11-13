//
//  NSDate+CXDAdd.h
//  Schedule
//
//  Created by chenxuedan on 2018/6/15.
//Copyright © 2018年 cxd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Provides extensions for 'NSDate'.
 */
@interface NSDate (CXDAdd)

#pragma mark - Component Properties

//Year component
@property (nonatomic, readonly)NSInteger year;
//Month component(1~12)
@property (nonatomic, readonly)NSInteger month;
//Day component(1~31)
@property (nonatomic, readonly)NSInteger day;
//Hour component(0~23)
@property (nonatomic, readonly)NSInteger hour;
//Minute component(0~59)
@property (nonatomic, readonly)NSInteger minute;
//Second component(0~59)
@property (nonatomic, readonly)NSInteger second;
//Nanosecond component
@property (nonatomic, readonly)NSInteger nanosecond;
//Weekday component(1~7, first day is based on user setting)
@property (nonatomic, readonly)NSInteger weekday;
//WeekdayOrdinal component
@property (nonatomic, readonly)NSInteger weekdayOrdinal;
//WeekOfMonth component(1~5)
@property (nonatomic, readonly)NSInteger weekOfMonth;
//WeekOfYear component(1~53)
@property (nonatomic, readonly)NSInteger weekOfYear;
//YearForWeekOfYear component
@property (nonatomic, readonly)NSInteger yearForWeekOfYear;
//Quarter component
@property (nonatomic, readonly)NSInteger quarter;
//Whether the month is leap month
@property (nonatomic, readonly)BOOL isLeapMonth;
//Whether the year is leap year
@property (nonatomic, readonly)BOOL isLeapYear;
//Whether date is today (based on current locale)
@property (nonatomic, readonly)BOOL isToday;
//Whether date is yesterday (based on current locale)
@property (nonatomic, readonly)BOOL isYesterday;


#pragma mark - Date modify

/**
 Returns a date representing the receiver date shifted later by the provided number of years.

 @param years Number of years to add.
 @return Date modified by the number of desired years.
 */
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;

/**
 Returns a date representing the receiver date shifted later by th provided number of months.

 @param months Number of months to add.
 @return Date modified by the number of desired months.
 */
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 Returns a date representing the receiver date shifted later by the provided number of weeks.

 @param weeks Number of weeks to add.
 @return Date modified by the number of desired weeks.
 */
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 Returns a date representing the receiver date shifted later by the provided number of days.

 @param days Number of days to add.
 @return Date modofied by the number of desired days.
 */
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;

/**
 Returns a date representing the receiver date shifted later by the provided number of hours.

 @param hours Number of hours  to add.
 @return Date modified by th number of desired hours.
 */
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 Returns a date representing the receiver date shifted later by the provided number of minutes.

 @param minutes Number of minutes to add.
 @return Date modified by the number of desired minutes.
 */
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 Returns a date representing the receiver date shifted later by the provided number of seconds.

 @param seconds Number of seconds to add.
 @return Date modified by the number of desired seconds.
 */
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;

#pragma mark - Date Format
- (nullable NSString *)stringWithFormat:(NSString *)format;

- (nullable NSString *)stringWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone locale:(nullable NSLocale *)locale;

/**
 Returns a string representing this date in ISO8601 format. e.g. "2010-07-09T16:13:30+12:00"

 @return NSString representing the formatter date string in ISO8601.
 */
- (nullable NSString *)stringWithISOFormat;

/**
 Returns a date parsed form given string interpreted using the format.

 @param dateString The string to parse.
 @param format The string's date format.
 @return A date representation of string interpreted using the format. If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

+ (nullable NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone locale:(nullable NSLocale *)locale;

+ (nullable NSDate *)dateWithISOFormatString:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END
