//
//  ViewController.m
//  BlurText
//
//  Created by wangkun on 14-7-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

#define kDemoText   @"Hanzhong is located in southwestern Shaanxi, near the border with Gansu and Sichuan Provinces, and is a part of the Shannan region. It sits in the centre of the Hanzhong Basin (汉中盆地), on the Han River (Hanshui). The Daba Mountains are perched to the south of the city; to the north lie the Qin Mountains, and for this reason, Hanzhong is geographically considered to be part of southern China. However, on administrative terms, as Shaanxi is officially part of the northwest, it is too.[9][10] For more on the divisions between northern and southern China, see Northern and southern China.The city's administrative area (prefecture) ranges in latitude from 33° 02' to 33° 22' N and in longitude from 106° 51' to 107° 10' E, and is 27,246 square kilometres (10,520 sq mi).[11] The northern part of the prefecture is high while the southern part is generally low. Elevations range from around 500 metres (1,600 ft) in the urban area to 2,038 metres (6,686 ft) in the Qin Mountains."

#define kBlurText1   @"(汉中盆地)"
#define kBlurText2   @"33° 02' to 33° 22' N"
#define kBlurText3   @"art of southern China"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _blurTextView = [[WKBlurTextView alloc] initWithFrame:CGRectMake(10, 60, 300, 400)];
    _blurTextView.text  = kDemoText;
    _blurTextView.editable = false;
    _blurTextView.font = [UIFont boldSystemFontOfSize: 20];
    _blurTextView.backgroundColor = [UIColor whiteColor];
    _blurTextView.textColor = [UIColor blackColor];
    [self.view addSubview: _blurTextView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20,20,100,30)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Blur Effect";
    [self.view addSubview:label];
    
    
    _blurSwitch = [[UISwitch alloc] init];
    _blurSwitch.frame = CGRectMake(150, 20, 100, 40);
    [_blurSwitch addTarget:self action:@selector(onBlurSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_blurSwitch];
}

- (void)onBlurSwitchChanged:(UISwitch *)blurSwitch
{
    if (blurSwitch.on)
    {
        [self startBlur];
    }
    else
    {
        [self clearBlur];
    }
}


- (void)startBlur
{
    //blur by text
    NSArray *blurTexts = [NSArray arrayWithObjects:kBlurText1, kBlurText2, kBlurText3, nil];
    [_blurTextView blurTexts: blurTexts];
    
    //blur by range
    [_blurTextView blurRange:NSMakeRange(2, 20)];
}

- (void)clearBlur
{
    [_blurTextView cleanAllBlur];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
