//
//  OpenCVImage.h
//  Graphmetrino
//
//  Created by Aleksey Tyurenkov on 7/1/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


namespace cv
{
    class Mat;
}

@interface OpenCVImage : NSObject

- (instancetype)initWithUIImage:(UIImage *)image;

- (cv::Mat)cvMat;

- (UIImage *)convert2UIImage;

@end
