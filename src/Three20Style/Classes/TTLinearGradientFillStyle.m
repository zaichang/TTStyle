//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TTLinearGradientFillStyle.h"

// Style
#import "TTShape.h"
#import "TTStyleContext.h"

// Style (private)
#import "TTStyleInternal.h"

// Core
#import "TTCorePreprocessorMacros.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTLinearGradientFillStyle

@synthesize color1 = _color1;
@synthesize color2 = _color2;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_color1);
  TT_RELEASE_SAFELY(_color2);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTLinearGradientFillStyle*)styleWithColor1:(UIColor*)color1 color2:(UIColor*)color2
                                         next:(TTStyle*)next {
  TTLinearGradientFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.color1 = color1;
  style.color2 = color2;
  style.startPoint = CGPointMake(0.5, 0.0);
  style.endPoint = CGPointMake(0.5, 1.0);
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTLinearGradientFillStyle*)styleWithColor1:(UIColor*)color1 color2:(UIColor*)color2
                                   startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
                                         next:(TTStyle*)next {
  TTLinearGradientFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.color1 = color1;
  style.color2 = color2;
  style.startPoint = startPoint;
  style.endPoint = endPoint;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(TTStyleContext*)context {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGRect rect = context.frame;

  CGContextSaveGState(ctx);
  [context.shape addToPath:rect];
  CGContextClip(ctx);

  UIColor* colors[] = {_color1, _color2};
  CGGradientRef gradient = [self newGradientWithColors:colors count:2];

  CGPoint gradientStart = CGPointMake(rect.origin.x + self.startPoint.x * rect.size.width,
                                      rect.origin.y + self.startPoint.y * rect.size.height);
  CGPoint gradientEnd = CGPointMake(rect.origin.x + self.endPoint.x * rect.size.width,
                                    rect.origin.y + self.endPoint.y * rect.size.height);

  CGContextDrawLinearGradient(ctx, gradient, gradientStart, gradientEnd, kCGGradientDrawsAfterEndLocation);
  CGGradientRelease(gradient);

  CGContextRestoreGState(ctx);

  return [self.next draw:context];
}


@end
