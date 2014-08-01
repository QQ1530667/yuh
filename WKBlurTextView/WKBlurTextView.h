//
//  WKBlurTextView.h
//  BlurText
//
//  Created by wangkun on 14-7-16.
//  Copyright (c) 2014年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKBlurTextView : UITextView

@property (nonatomic, retain) NSMutableArray *effectRects;
@property (nonatomic, assign) BOOL ifSelectable;

- (void)blurText:(NSString *)blurText;  //text
- (void)blurTexts:(NSArray *)texts;     //array of text

- (void)blurRange:(NSRange)range;

- (void)cleanAllBlur;

@end
