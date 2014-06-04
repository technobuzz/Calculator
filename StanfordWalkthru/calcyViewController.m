//
//  calcyViewController.m
//  StanfordWalkthru
//
//  Created by CSG_Mobile04 on 9/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "calcyViewController.h"
#import "calcyBrain.h"

@interface calcyViewController ()
  @property (nonatomic) BOOL inProgressEnteringDigits;
  @property (nonatomic,strong ) calcyBrain *brain;
@end

@implementation calcyViewController
@synthesize calcyDisplayText = _calcyDisplayText;
@synthesize inProgressEnteringDigits = _inProgressEnteringDigits;

@synthesize  brain = _brain;

- (calcyBrain *) brain {

    if (_brain == nil) {
       _brain =  [[calcyBrain alloc]init];
    }
    
    return _brain;

}

- (void) setBrain : (calcyBrain *) brain {
    _brain = brain;

}


- (IBAction)enterPusher {
    // enter button pressed, 
    [self.brain pushOperand:[self.calcyDisplayText.text doubleValue]];
    self.inProgressEnteringDigits = NO;
    
    NSLog(@"enter pressed");
}


- (IBAction)secimalButton:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (IBAction)enterPressed {
    //[self.brain pushOperand:[self.calcyDisplayText.text doubleValue]];
   // self.inProgressEnteringDigits = NO;
}

- (IBAction)buttonTouched:(UIButton *)sender {
    
    //changed passed param from id to UIButton *
    // option buttton documentation
    
    ///////////////////////////////////////////////
    
    // get button pressed text from sender [sender currentTitle]
    NSString *buttonText = sender.currentTitle;
    
    // display button pressed text - @ means object in NSLog
    NSLog(@"the digit pressed was %@" ,buttonText);
    
    // getter for property of the output text label - can use self.calcyDisplayText
    UILabel *calculatorOutput = [self calcyDisplayText] ;
    
    NSString *calculatorOutputText = calculatorOutput.text ;
    NSLog (@"the display has value of %@", calculatorOutputText);

    
    // append button text value to calculator Output text
    NSString *newDisplayText = [calculatorOutputText stringByAppendingString:buttonText] ;
    NSLog (@"the new display has value of %@", newDisplayText);
    
    
    if (self.inProgressEnteringDigits){
        // assign self.calcyDisplayText with new display text value
        //[calculatorOutput setText:newDisplayText];
        self.calcyDisplayText.text = [self.calcyDisplayText.text stringByAppendingString:buttonText];
    
    }
    else {
    
        self.inProgressEnteringDigits = YES;
        // assign self.calcyDisplayText with new display text value
        //[calculatorOutput setText:newDisplayText];
        self.calcyDisplayText.text = buttonText;
        
    }
        
    
    
       
    
}
- (IBAction)multiplyButton:(UIButton *)sender {
    
    
    if (self.inProgressEnteringDigits){
        [self enterPressed ];
    }
    
    
    double result = [self.brain performOperation:sender.currentTitle];   
    
    NSString *val = [NSString stringWithFormat:@"%g", result];
    
    self.calcyDisplayText.text = val;
}

- (IBAction)additionButton:(UIButton *)sender {
    
    if (self.inProgressEnteringDigits){
        [self enterPressed ];
    }
        
        
    double result = [self.brain performOperation:sender.currentTitle];   
    
    NSString *val = [NSString stringWithFormat:@"%g", result];
    
    self.calcyDisplayText.text = val;
    
}
- (IBAction)divideButton:(UIButton *)sender {
}
#pragma mark - View lifecycle


@end
