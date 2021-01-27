//
//  TestRootViewController.m
//  TestDemo
//
//  Created by DTiOS on 2021/1/26.
//

#import "TestRootViewController.h"
#import "BasicsShowViewController.h"
#import "OpenShowViewController.h"

@interface TestRootViewController ()

@end

@implementation TestRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}


- (IBAction)buttonClickOne:(id)sender
{
    BasicsShowViewController *vc = [BasicsShowViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)buttonClickTwo:(id)sender
{
    OpenShowViewController *vc = [OpenShowViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
