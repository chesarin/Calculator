//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Cesar Vargas on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {

	double operand;
	NSString *waitingOperation;
	double waitingOperand;
	double storage;
}
- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;

@end
