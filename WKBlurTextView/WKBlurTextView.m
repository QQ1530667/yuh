//
//  WKBlurTextView.m
//  BlurText
//
//  Created by wangkun on 14-7-16.
//  Copyright (c) 2014年 wangkun. All rights reserved.
//

#import "WKBlurTextView.h"
#import "FXBlurView.h"

@implementation WKBlurTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _ifSelectable = FALSE;
    }
    return self;
}
//Override to prevent select mode
- (BOOL)canBecomeFirstResponder
{
    return _ifSelectable;
}

#pragma  mark - BlurText

- (void)cleanAllBlur
{
    for (UIView *subView in self.subviews)
    {
        if ([subView isKindOfClass:[FXBlurView class]])
        {
            [subView removeFromSuperview];
        }
    }
}

- (UITextRange *)textRangeFromNSRange:(NSRange)range
{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *start = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *end = [self positionFromPosition:start offset:range.length];
    UITextRange *textRange = [self textRangeFromPosition:start toPosition:end];
    
    return textRange;
}

- (NSMutableArray *)rectsForText:(NSString *)text
{
    NSRange textNSRange = [self.text rangeOfString:text];
    UITextRange *textUIRange = [self textRangeFromNSRange: textNSRange];
    
    return [NSMutableArray  arrayWithArray:[self selectionRectsForRange:textUIRange]];
}

- (void)blurRects:(NSArray *)rects
{
    for (UITextSelectionRect *selectionRect in rects)
    {
        FXBlurView *blurView = [[FXBlurView alloc] initWithFrame:selectionRect.rect];
        blurView.blurRadius = 10;
        
        [self addSubview:blurView];
    }
}

- (void)blurText:(NSString *)blurText
{
    _effectRects = [self rectsForText:blurText];
    [self blurRects:_effectRects];
}

- (void)blurTexts:(NSArray *)texts
{
    for (NSString *text in texts)
    {
        [self blurText:text];
    }
}

- (void)blurRange:(NSRange)range
{
    
    [self blurRects:[self selectionRectsForRange:[self textRangeFromNSRange:range]]];
}
@end
