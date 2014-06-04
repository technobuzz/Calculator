//
//  calcyBrain.m
//  StanfordWalkthru
//
//  Created by CSG_Mobile04 on 9/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "calcyBrain.h"

@interface calcyBrain () 

@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation calcyBrain

@synthesize operandStack = _operandStack;


- (NSMutableArray *) operandStack {
    
    if (_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    return _operandStack;
}

- (void) setOperandStack: (NSMutableArray *) operandStack {
    _operandStack  = operandStack ;
}

- (double) popOperand {
    
    NSNumber *d = [self.operandStack lastObject];
    
    if (d) {
        [self.operandStack removeLastObject];
    }
    return [d doubleValue];
}


- (void) pushOperand : (double) operand {
    
    NSNumber *number = [NSNumber numberWithDouble:operand];
    
    [self.operandStack addObject:number];
    
    
}
- (double) performOperation: (NSString *) operation {
    
    
    double result = 0;
    
    if ([operation isEqualToString:@"+"]){
        result = self.popOperand + self.popOperand ;
    }

    else if ([@"*" isEqualToString:operation]){
        result = self.popOperand * self.popOperand ;
    }
    
    [self pushOperand : result];
    
    return result;
    
}

@end
