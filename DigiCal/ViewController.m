//
//  ViewController.m
//  DigiCal
//
//  Created by Prashanna Raghavan on 2/1/16.
//  Copyright © 2016 Prashanna Raghavan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

typedef enum
{
    Addition = 0,
    Subtraction,
    Multiplication,
    Division
}OperatorType;

@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLabel;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;

@property(nonatomic,strong) NSMutableString *currentString;
@property(nonatomic,strong) NSMutableString *fullString;

@property int currentNumber;
@property float total;
@property int operand;
@property OperatorType OperatorType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.currentString = [NSMutableString string];
    self.fullString = [NSMutableString string];
    self.currentNumber = 0;
    self.total = 0.0f;
    self.operand = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabels:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case 10:
            
            self.operatorLabel.text = @"+";
            [self.fullString appendString:@"+"];
            self.historyLabel.text = self.fullString;
            self.operand = 0;
            
            break;
            
        case 11:
//            self.total -= self.currentNumber;
            self.operatorLabel.text = @"-";
            [self.fullString appendString:@"-"];
            self.historyLabel.text = self.fullString;
            self.operand = 1;
            
            break;
            
        case 12:
//            self.total *= self.currentNumber;
            self.operatorLabel.text = @"X";
            [self.fullString appendString:@"X"];
            self.historyLabel.text = self.fullString;
            self.operand = 2;
            
            break;
            
        case 13:
//            self.total /= self.currentNumber;
            self.operatorLabel.text = @"/";
            [self.fullString appendString:@"/"];
            self.historyLabel.text = self.fullString;
            self.operand = 3;
            
            break;
            
        case 14:
            
            break;
            
        case 15:
            
            break;
            
        case 16:
            self.operatorLabel.text = @"=";
            [self.fullString appendString:[NSString stringWithFormat:@"=%.2f",self.total]];
            self.historyLabel.text = self.fullString;
            self.currentLabel.text = [NSString stringWithFormat:@"%.2f",self.total];
            self.operand = -1;
            break;
            
        default:
            break;
    }
    
    
}

-(void)calculatePressed
{
    
}

- (IBAction)operatorPressed:(id)sender
{
    if (self.total == 0) {
        self.total = self.currentNumber;
    }
    
    else
    {
        switch (self.operand) {
            case 0:
                self.total += self.currentNumber;
                break;
                
            case 1:
                self.total -= self.currentNumber;
                break;
                
            case 2:
                self.total *= self.currentNumber;
                break;
                
            case 3:
                self.total /= self.currentNumber;
                break;
                
            case 4:
                
                break;
                
            case 5:
                
                break;
                
            case 6:
                self.currentLabel.text = [NSString stringWithFormat:@"%.2f",self.total];
                break;
                
            default:
                break;
        }
        
        
    }
    
    self.currentNumber = 0;
    [self updateLabels:sender];
}

- (IBAction)numberPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.currentNumber *= 10;
    self.currentNumber += (int)button.tag;
    self.currentLabel.text = [NSString stringWithFormat:@"%d",self.currentNumber];
    [self.fullString appendString:[NSString stringWithFormat:@"%d",(int)button.tag]];
    self.historyLabel.text = self.fullString;
}

- (IBAction)clearBtnPressed:(id)sender {
    self.currentLabel.text = @"0";
    self.historyLabel.text = @"";
    self.operatorLabel.text = @"";
    self.fullString = [NSMutableString stringWithString:@""];
    self.currentNumber = 0;
    self.total = 0.0f;
    self.operand = 0;
}

- (IBAction)offBtnPressed:(id)sender {
    
}

- (IBAction)memoryBtnPressed:(id)sender {
    
}


@end
