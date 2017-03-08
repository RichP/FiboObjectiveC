//
//  ViewController.m
//  FiboObjectiveC
//
//  Created by Richard Pickup on 08/03/2017.
//  Copyright © 2017 RP Software Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSInteger cellCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cellCount = 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    
    return self.cellCount;
}


- (NSInteger) fibonacciForIndex:(NSInteger) index {
    
    if(index == 0 || index == 1) {
        return 1;
    }
    
    
    
    
    
    // 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610
    return [self fibonacciForIndex:index - 1] + [self fibonacciForIndex:index - 2];
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* fiboCell = @"fiboCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:fiboCell];
    
//    A Fibonacci series is a series where the next number is defined as the sum of the previous two.
//    n[i] = n[i-1] + n[i-2]
//    n[0] = n[1] = 1
    
    
   // cell.textLabel.text = @"";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        NSInteger value = 1;
        
        if(indexPath.row > 1) {
            
            value = [self fibonacciForIndex:indexPath.row];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.textLabel.text = [NSString stringWithFormat:@"Value %ld: == %ld", (long)indexPath.row, (long)value];
            
        });
    });

    
    
    
    
    return cell;
    
}






- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if((indexPath.row  % 50) == 0  && indexPath.row > 0) {
        self.cellCount += 50;
        [tableView reloadData];
    }
    
}


@end
