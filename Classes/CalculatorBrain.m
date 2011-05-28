//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Cesar Vargas on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void)setOperand:(double)anOperand
{
	operand = anOperand;
}
- (void)performWaitingOperation
{
	if ([@"+" isEqual:waitingOperation])
	{
		operand = waitingOperand + operand;
	}
	else if ([@"*" isEqual:waitingOperation])
	{
		operand = waitingOperand * operand;
	}
	else if ([@"-" isEqual:waitingOperation])
	{
		operand = waitingOperand - operand;
	}
	else if ([@"/" isEqual:waitingOperation])
	{
		if(operand){
			operand = waitingOperand / operand;
		}
	}
		
}

- (double)performOperation:(NSString *)operation
{
	if ([operation isEqual:@"sqrt"])
	{
		operand = sqrt(operand);
	}
	else if([operation isEqual:@"1/x"])
	{
		operand = 1 / operand;
	}
	else if([operation isEqual:@"sin"])
	{
		operand = sin(operand);
	}
	else if([operation isEqual:@"cos"])
	{
		operand = cos(operand);
	}
	else if([operation isEqual:@"Store"])
	{
		storage = operand;
	}
	else if([operation isEqual:@"Recall"])
	{
		operand = storage;
	}
	else if([operation isEqual:@"C"])
	{
		operand = 0.0;
		waitingOperation = nil;
		waitingOperand = 0.0;
		storage = 0.0;
	}
	else if([operation isEqual:@"Mem+"])
	{
		storage = storage + operand;
	}
	else if([@"+/-" isEqual:operation])
	{
		operand = - operand;
	}
	else
	{
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}
	return operand;
}

@end
