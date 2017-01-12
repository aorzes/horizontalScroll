//
//  ViewController.m
//  HorizontalScroll
//
//  Created by Anton Orzes on 12/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *slike;
    float sredina;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIImageView *slika1;
@property (weak, nonatomic) IBOutlet UIImageView *slika2;
@property (weak, nonatomic) IBOutlet UIImageView *slika3;
@property (weak, nonatomic) IBOutlet UIImageView *slika4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    sredina = self.view.frame.size.width/2;
    [_scroll.delegate self];
    slike = @[_slika1,_slika2,_slika3,_slika4];
}

-(void)centriraj {
    float min = sredina;
    float d = sredina;
    UIImageView *target = [slike objectAtIndex:0];
    for (UIImageView *sl in slike) {
        CGPoint np = [_scroll convertPoint:sl.center toView:self.view.window];
        d = fabs(np.x - sredina);
        if (d<min) {
            min = d;
            target = sl;
        }
    }
    //NSLog(@"slika:%f",min);
    CGRect imageRect = target.frame;
    imageRect.origin.x -= (self.view.bounds.size.width/2 - target.frame.size.width/2)/2;
    //imageRect.origin.x = target.frame.origin.x;
    //[_scroll scrollRectToVisible:imageRect animated:true];
    [_scroll setContentOffset:imageRect.origin animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self centriraj];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
   //[self centriraj];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self centriraj];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
