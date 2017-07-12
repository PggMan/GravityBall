//
//  AppDelegate.h
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/12.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

