//
//  OpenCVWrapper.h
//  Graphmetrino
//
//  Created by Aleksey Tyurenkov on 7/1/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

- (instancetype)initWithImage:(UIImage *)image;
- (BOOL)recognize;
- (UIImage *)processedImage;

@end
