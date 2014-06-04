//
//  calcyBrain.h
//  StanfordWalkthru
//
//  Created by CSG_Mobile04 on 9/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calcyBrain : NSObject

- (void) pushOperand : (double) operand;
- (double) performOperation: (NSString *) operation;

@end
