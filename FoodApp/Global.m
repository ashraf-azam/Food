//
//  Global.m
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

#import "Global.h"
#import "FoodApp-Swift.h"
@implementation Global

static Global *hybrid;
static dispatch_once_t once;

+ (Global *)shareInstance {
    dispatch_once(&once, ^{
        hybrid = [Global new];
    });
    return hybrid;
}

-(void)convertXML {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipe" ofType:@"json"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"dict : %@", dict);
    NSDictionary *foodName = [dict objectForKey:@"Name"];
    for (NSString *name in foodName) {
        [self.foodName addObject:name];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
