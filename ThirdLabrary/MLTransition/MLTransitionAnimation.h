//
//  MLTransitionAnimation.h
//  MLTransitionNavigationController
//
//  Created by molon on 6/29/14.
//  Copyright (c) 2014 molon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    MLTransitionAnimationTypePush, //push
	MLTransitionAnimationTypePop, //pop
} MLTransitionAnimationType;

@interface MLTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) MLTransitionAnimationType type;

@end
