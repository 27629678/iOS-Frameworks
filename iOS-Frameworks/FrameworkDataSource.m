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
    return [[self.targetClass alloc] initWithNibName:NSStringFromClass(self.targetClass)
                                              bundle:nil];
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
        @[[Framework frameworkWithName:@"Accounts.framework" target:[AccountsViewController class]]
          ];
    });
    
    return frameworks;
}

@end        // FrameworkDataSource
