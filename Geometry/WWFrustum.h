/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWFrustum.h 1456 2013-06-19 18:04:17Z dcollins $
 */

#import <Foundation/Foundation.h>

@class WWPlane;
@class WWMatrix;

/**
* Represents a view frustum.
*/
@interface WWFrustum : NSObject

/// @name Frustum Attributes

@property(nonatomic, readonly) WWPlane* left;
@property(nonatomic, readonly) WWPlane* right;
@property(nonatomic, readonly) WWPlane* bottom;
@property(nonatomic, readonly) WWPlane* top;
@property(nonatomic, readonly) WWPlane* near;
@property(nonatomic, readonly) WWPlane* far;

/// @name Initializing Frustums

/**
* Initializes this frustum to have each plane a unit distance from the frustum center.
*
* @return The initialized frustum.
*/
- (WWFrustum*) initToCanonicalFrustum;

/**
* Initialize this frustum with specified frustum planes.
*
* The specified planes become part of the initialized frustum. They are not copied.
*
* @param left The left frustum plane.
* @param right The right frustum plane.
* @param bottom The bottom frustum plane.
* @param top The top frustum plane.
* @param near The near frustum plane.
* @param far The far frustum plane.
*
* @return The initialized frustum.
*
* @exception NSInvalidArgumentException If any of the planes are nil.
*/
- (WWFrustum*) initWithPlanes:(WWPlane*)left
                        right:(WWPlane*)right
                       bottom:(WWPlane*)bottom
                          top:(WWPlane*)top
                         near:(WWPlane*)near
                          far:(WWPlane*)far;

/**
* Transforms this frustum by a specified matrix.
*
* @param matrix The matrix to transform this frustum by.
*
* @exception NSInvalidArgumentException If the matrix is nil.
*/
- (void) transformByMatrix:(WWMatrix*)matrix;

/**
* Normalizes the planes of this frustum.
*/
- (void) normalize;

@end