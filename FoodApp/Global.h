//
//  Global.h
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Global : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) UIImage *imageFood;
@property (nonatomic, strong) NSString * ingredients;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSMutableArray * foodName;
+ (Global *)shareInstance;
- (void) convertXML;

@end

NS_ASSUME_NONNULL_END
