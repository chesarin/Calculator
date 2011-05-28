//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Cesar Vargas on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
	if (!brain){
		brain = [[CalculatorBrain alloc] init];
	}
	return brain;
}
- (IBAction)digitPressed:(UIButton *)sender
{
	NSString *digit = [[sender titleLabel] text];
	if (userIsInTheMiddleOfTypingANumber){
		[display setText:[[display text] stringByAppendingString:digit]];
	}
	else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}

}
- (IBAction)operationPressed:(UIButton *)sender
{
	if (userIsInTheMiddleOfTypingANumber){
		[[self brain] setOperand:[[display text] doubleValue]];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	//NSLog(@"The answer to %@, the universe and everything is %d.",@"life",42);
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g", result]];
}
- (IBAction)dotPressed:(UIButton *)sender
{
	NSString *dot = [[sender titleLabel] text];
	NSLog(@"The button pressed is %@ ", dot);
	if (userIsInTheMiddleOfTypingANumber){
		NSRange range = [[display text] rangeOfString:@"."];
		if (range.location == NSNotFound ){
			[display setText:[[display text] stringByAppendingString:dot]];
			NSLog(@"Yes, user is in the middle of typing a number");
			NSLog(@"And number is %@",[display text]);
			}
		else {
			NSLog(@"Let's not do anything for now, but there is a dot found on the string %@",[display text]);
		}

	
	}
	else {
		NSLog(@"User has pressed dot button first");
		[display setText:dot];
		userIsInTheMiddleOfTypingANumber = YES;
	}
	//NSLog(@"The value of userIsInTheMiddleOfTypingANumber is %@", userIsInTheMiddleOfTypingANumber);
}


@end
