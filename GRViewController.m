//
//  GRViewController.m
//  GitReference
//
//  Created by Thomas Fox on 4/27/2558 BE.
//  Copyright (c) 2558 BE DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat heightForLabel = 20;
static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface GRViewController ()

@end

@implementation GRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad {
    
    
    
    for( int i = 0; i<[[self gitCommands] count]; i++){
        
    
    UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(5, 25 + 50*i, self.view.frame.size.width, 20)];
    
    
    gitCommand.text = [self gitCommands][i][Command];
    [self.view addSubview:gitCommand];
        
        
    UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(40, 50 + 50*i, self.view.frame.size.width, 20)];
        
        
        gitReference.text = [self gitCommands][i][Reference];
        [self.view addSubview:gitReference];
    }

    
    

}

-(NSArray *)gitCommands
{
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference
{
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}

@end
