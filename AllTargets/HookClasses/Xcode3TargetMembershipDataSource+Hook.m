//
//  Xcode3TargetMembershipDataSource+Hook.m
//  AllTargets
//
//  Created by Jobs on 15/6/21.
//  Copyright (c) 2015年 Jobs. All rights reserved.
//

#import "Xcode3TargetMembershipDataSource+Hook.h"
#import "Xcode3TargetWrapper.h"

@implementation Xcode3TargetMembershipDataSource (Hook)

+ (void)hook
{
    [self jr_swizzleMethod:@selector(updateTargets) withMethod:@selector(updateTargetsHook) error:nil];
}


- (void)updateTargetsHook
{
    // We first call the original method
    [self updateTargetsHook];
    
    // Run our custom code
    NSMutableArray *wrappedTargets = [self valueForKey:@"wrappedTargets"];
    for (Xcode3TargetWrapper *wrappedTarget in wrappedTargets) {
        wrappedTarget.selected = YES;
    }
}

@end
