//
//  ViewController.m
//  hBtn
//
//  Created by zzw on 2017/11/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "ViewController.h"
#import "crosswiseSelectView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    
    crosswiseSelectView * v = [[crosswiseSelectView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 200)];
    v.leftMarge = 20.0;
    v.itemMarge = 15.0;
    v.itemSpace = 15.0;
    v.section = 4;
    v.font = 15;
    v.dataSource = @[@"dadadafkkkkkkkk",@"asdasd",@"212",@"cccc",@"asdasdada",@"afsffsaafla;;;;",@"daazz",@"www",@"vvvv",@"z,l",@"ddd",@"weawarawrrw",@"aaaa",@"dddd",@"wwwww",@"ppo",@"222123",@"eweqeq",@"sdd",@"dadadad",@"dsdada",@"大大大",@"大啦啦啦啦啦",@"大萨达大大大大大",@"dadadafkkkkkkkk",@"asdasd",@"212",@"cccc",@"asdasdada",@"afsffsaafla;;;;",@"daazz",@"www",@"vvvv",@"z,l",@"ddd",@"weawarawrrw",@"aaaa",@"dddd",@"wwwww",@"ppo",@"222123",@"eweqeq",@"sdd",@"dadadad",@"dsdada",@"大大大",@"大啦啦啦啦啦",@"大萨达大大大大大"];
    [self.view addSubview:v];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
