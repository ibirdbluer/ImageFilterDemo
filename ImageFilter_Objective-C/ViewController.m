//
//  ViewController.m
//  ImageFilter_Objective-C
//
//  Created by Gregory Qian on 25/08/2017.
//  Copyright © 2017 Gregory Qian. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"

@interface ViewController () {
    GPUImageOutput<GPUImageInput> *filter;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *title;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.title isEqualToString:@"Saturation"]) {
        filter = [[GPUImageSaturationFilter alloc] init];
    }else if([self.title isEqualToString:@"Contrast"]) {
        filter = [[GPUImageContrastFilter alloc] init];
    }else if([self.title isEqualToString:@"Sepia"]) {
        filter = [[GPUImageSepiaFilter alloc] init];
    }else if([self.title isEqualToString:@"Pixellate"]) {
        filter = [[GPUImagePixellateFilter alloc] init];
    }else if([self.title isEqualToString:@"Polar Pixellate"]) {
        filter = [[GPUImagePolarPixellateFilter alloc] init];
    }else if([self.title isEqualToString:@"Pixellate position"]) {
        filter = [[GPUImagePixellatePositionFilter alloc] init];
    }else if([self.title isEqualToString:@"Polka Dot"]) {
        filter = [[GPUImagePolkaDotFilter alloc] init];
    }
    
    UIImage *inputImage = [UIImage imageNamed:@"IMG_1108.jpg"];
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    
    [stillImageSource addTarget:filter];
    [filter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [filter imageFromCurrentFramebuffer];
    
    self.imageView.image = currentFilteredVideoFrame;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
