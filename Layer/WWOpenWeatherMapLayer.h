/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWOpenWeatherMapLayer.h 1323 2013-05-10 16:53:03Z tgaskins $
 */

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"

/**
* Provides a layer for Open Weather Map data.
*/
@interface WWOpenWeatherMapLayer : WWRenderableLayer
{
    NSTimer* timer;
}

/// @name Initializing the Open Weather Map Layer

/**
* Initializes the Open Weather Map layer.
*
* @return The initialized layer.
*/
- (WWOpenWeatherMapLayer*) init;

@end