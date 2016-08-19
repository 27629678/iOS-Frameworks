//
//  FrameworkDataSource.m
//  iOS-Frameworks
//
//  Created by hzyuxiaohua on 8/18/16.
//  Copyright © 2016 hzyuxiaohua. All rights reserved.
//

#import "FrameworkDataSource.h"

#import "AccountsViewController.h"

@interface Framework ()

@property (nonatomic, assign) Class targetClass;

@end

@implementation Framework

+ (instancetype)frameworkWithName:(NSString *)name target:(__unsafe_unretained Class)target
{
    Framework* instance = [[Framework alloc] init];
    instance.name = name;
    instance.targetClass = target;
    
    return instance;
}

- (UIViewController *)viewController
{
    NSString* nibName = NSStringFromClass(self.targetClass);
    NSArray* components = [nibName componentsSeparatedByString:@"."];
    return [[self.targetClass alloc] initWithNibName:components.lastObject bundle:nil];
}

@end        // Framework

@implementation FrameworkDataSource

+ (instancetype)sharedInstance
{
    static FrameworkDataSource* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FrameworkDataSource alloc] init];
    });
    
    return instance;
}

- (NSArray *)allFrameworks
{
    static NSArray* frameworks = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        frameworks =
        @[[Framework frameworkWithName:@"Accounts.framework" target:[AccountsViewController class]],
          [Framework frameworkWithName:@"AdSupport.framework" target:AdSupportViewController.self]
          ];
    });
    
    return frameworks;
}

@end        // FrameworkDataSource
