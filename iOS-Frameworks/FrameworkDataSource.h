//
//  FrameworkDataSource.h
//  iOS-Frameworks
//
//  Created by hzyuxiaohua on 8/18/16.
//  Copyright © 2016 hzyuxiaohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@interface Framework : NSObject

@property (nonatomic, strong) NSString* name;

- (UIViewController *)viewController;

+ (instancetype)frameworkWithName:(NSString *)name target:(Class)target;

@end        // Framework

@interface FrameworkDataSource : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)allFrameworks;

@end        // FrameworkDataSource
