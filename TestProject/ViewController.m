//
//  ViewController.m
//  TestProject
//
//  Created by hanwenguang on 17/5/24.
//  Copyright © 2017年 hanwenguang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //快速排列
//    [self quickData];
    //冒泡排序
//    [self bubblingSort];
    //选择排序
    [self changeSort];
}


#pragma mark - 快速排列
- (void)quickData {
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"13", @"24", @"5", @"12", @"44", @"21", @"29", nil];
    
    //    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    
    [self quickSortArray:arr withLIndex:0 andRIndex:arr.count - 1];
    
    NSLog(@"%@",arr);
}

- (void)quickSortArray:(NSMutableArray *)array withLIndex:(NSInteger)lIndex andRIndex:(NSInteger)rIndex {
    //数组为空，直接返回
    if (lIndex >= rIndex) {
        return;
    }
    
    NSInteger i = lIndex;
    NSInteger j = rIndex;
    //基准值：就是找一个值作为标准
    NSInteger value = [array[i] integerValue];
    
    while (i < j) {
        //从右边开始查找比基准值小的值。如果比基准数大，继续查找
        while (i < j && [array[j] integerValue] >= value) {
            j--;
            NSLog(@"\ni: %ld, \nj:%ld, \nvalue:%ld, \narray[j]:%ld", i, j, value, [array[j] integerValue]);
        }
        //如果比基准值小，就调换位置
        array[i] = array[j];
        
        //当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值,如果比基准数小，继续查找
        while (i < j && [array[i] integerValue] <= value) {
            i ++;
            NSLog(@"i: %ld, \nj:%ld, \nvalue:%ld, \narray[j]:%ld", i, j, value, [array[i] integerValue]);

        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
    }
    
    array[i] = @(value);
    
    [self quickSortArray:array withLIndex:lIndex andRIndex:i - 1];
    
    [self quickSortArray:array withLIndex:i + 1 andRIndex:rIndex];
}

#pragma mark - 冒泡排序
- (void)bubblingSort {
    
    NSMutableArray *arr_Mut = [NSMutableArray arrayWithObjects:@1,@4,@12,@14,@22,@23,@5,nil];
    static NSInteger ci = 0;
    static NSInteger di = 0;

    for (int i = 0; i < arr_Mut.count; i ++) {
        /**
         *  这里有两种写法
         *  1、以下：for (int j = 0; j < arr_M.count - 1 - i; j ++)
         *  2、for (int j = 0; j < arr_M.count - 1; j ++)
         *  我们可以看出来，这两种不同的写法结果是一样的，只是方法二循环的次数要多很多，可以打印ci查看
         */
        for (int j = 0; j < arr_Mut.count - 1 - i; j ++) {
           
            if (arr_Mut[j] > arr_Mut[j + 1]) {
                [arr_Mut exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
            NSLog(@"次数：%ld", ci);
            ci++;
        }
        //这个毫无疑问就是数组的个数
        NSLog(@"i次数：%ld", di);
        di ++;
    }
    //最终的数组
    NSLog(@"%@", arr_Mut);
}

#pragma mark - 选择排序
- (void)changeSort {
    
    NSMutableArray *arr_Mut = [NSMutableArray arrayWithObjects:@11,@4,@12,@14,@22,@23,@5,nil];
   
    static NSInteger ci = 0;
    static NSInteger di = 0;

    for (int i = 0; i < arr_Mut.count; i ++) {
        
        for (int j = i + 1; j < arr_Mut.count; j ++) {
            
            if (arr_Mut[i] > arr_Mut[j]) {
                
                [arr_Mut exchangeObjectAtIndex:i withObjectAtIndex:j];
                NSLog(@"\n数组\n%@\n arr_Mut[i]：%@\n arr_Mut[j]：%@\n次数：%ld\n", arr_Mut, arr_Mut[i], arr_Mut[j], ci);

                ci++;
            }
            NSLog(@"这是次数：%ld", di);
            di ++;
        }
    }
    NSLog(@"%@", arr_Mut);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
