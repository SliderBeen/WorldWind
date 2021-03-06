/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.

 @version $Id: WWOffset.m 1440 2013-06-13 23:38:39Z dcollins $
 */

#import "WorldWind/Util/WWOffset.h"
#import "WorldWind/WorldWindConstants.h"
#import "WorldWind/WWLog.h"

@implementation WWOffset

//--------------------------------------------------------------------------------------------------------------------//
//-- Initializing Offsets --//
//--------------------------------------------------------------------------------------------------------------------//

- (WWOffset*) initWithX:(double)x y:(double)y xUnits:(NSString*)xUnits yUnits:(NSString*)yUnits
{
    self = [super init];

    _x = x;
    _y = y;
    _xUnits = xUnits;
    _yUnits = yUnits;

    return self;
}

- (WWOffset*) initWithPixelsX:(double)x y:(double)y
{
    self = [super init];

    _x = x;
    _y = y;
    _xUnits = WW_PIXELS;
    _yUnits = WW_PIXELS;

    return self;
}

- (WWOffset*) initWithInsetPixelsX:(double)x y:(double)y
{
    self = [super init];

    _x = x;
    _y = y;
    _xUnits = WW_INSET_PIXELS;
    _yUnits = WW_INSET_PIXELS;

    return self;
}

- (WWOffset*) initWithFractionX:(double)x y:(double)y
{
    self = [super init];

    _x = x;
    _y = y;
    _xUnits = WW_FRACTION;
    _yUnits = WW_FRACTION;

    return self;
}

- (WWOffset*) initWithOffset:(WWOffset*)offset
{
    if (offset == nil)
    {
        WWLOG_AND_THROW(NSInvalidArgumentException, @"Offset is nil")
    }

    self = [super init];

    _x = offset->_x;
    _y = offset->_y;
    _xUnits = offset->_xUnits;
    _yUnits = offset->_yUnits;

    return self;
}

//--------------------------------------------------------------------------------------------------------------------//
//-- Computing the Absolute Offset--//
//--------------------------------------------------------------------------------------------------------------------//

- (CGPoint) offsetForWidth:(double)width height:(double)height
{
    double x;
    if ([_xUnits isEqualToString:WW_FRACTION])
    {
        x = width * _x;
    }
    else if ([_xUnits isEqualToString:WW_INSET_PIXELS])
    {
        x = width - _x;
    }
    else // default to WW_PIXELS
    {
        x = _x;
    }

    double y;
    if ([_yUnits isEqualToString:WW_FRACTION])
    {
        y = height * _y;
    }
    else if ([_yUnits isEqualToString:WW_INSET_PIXELS])
    {
        y = height - _y;
    }
    else // default to WW_PIXELS
    {
        y = _y;
    }

    return CGPointMake((CGFloat) x, (CGFloat) y);
}

@end