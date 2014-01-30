//
//  ViewController.m
//  Sample013003
//
//  Created by tikomo on 2014/01/30.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

#import "ViewController.h"

// ここにクラス変数とか記述


@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;


@end




@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
#pragma mark - case1
    
    NSDate* theDate = [NSDate alloc]; // インスタンスを作る
    theDate = [theDate init]; // 初期化
    
    NSLog(@"DATE : %@", theDate); // DATE : 2014-01-30 15:01:09 +0000

#pragma mark - case2
    
    // こちらの書き方が一般的らしい
    NSDate* theDate2 = [[NSDate alloc] init]; // インスタンスを作成し初期化する
    
    NSLog(@"DATE : %@", theDate2); // DATE : 2014-01-30 15:01:09 +0000
    
#pragma mark - case3
    
    // 30後のクラスのインスタンスを作成する
    NSDate* theDate3 = [[NSDate alloc] initWithTimeIntervalSinceNow: 30];
    
    NSLog(@"DATE : %@", theDate3);
    
#pragma mark - case4
    
    // 2日後のクラスのインスタンスを作成する
    int oneday = 60*60*24;
    NSDate* theDate4 = [[NSDate alloc] initWithTimeIntervalSinceNow:oneday*2];
    
    NSLog(@"DATE : %@", theDate4);
    
#pragma mark - case5
    
    // dateメソッドをNSDateクラスに対して実行すると、現在時刻でインスタンスを取得します
    // allocとか書かなくていいんだな
    NSDate* today = [NSDate date];
    
    NSLog(@"DATE : %@", today);
    
#pragma mark - TextField
    // @property (weak, nonatomic) IBOutlet UITextField *textField1;
    // を使うときは、
    // _textField1
    // と使います
    // 前に、"_" を作るだけです
    // いつからこうなったんだろう？
    
    // プレイスホルダーを表示
    _textField1.placeholder = @"Hello World";
    
    // 文字列を入れる
    // _textField2.text = @"Hi Mr.AAAAAAAA";
    _textField2.text = [[NSDate date] description];
    
    // 枠線をスタイルをラインにする
    _textField2.borderStyle = UITextBorderStyleLine;
    
    // 編集不可能にする
    _textField2.userInteractionEnabled = NO;
    
    
#pragma mark - DATE sample
    
    // 指定の日付のオブジェクトを作成する
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [formatter setLocale:[NSLocale systemLocale]];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate* theDay = [formatter dateFromString:@"2014/01/31 01:15:00"];
    NSLog(@"%@", theDay);
    
    // 当地の標準時で出力する
    NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [formatter1 setLocale:[NSLocale systemLocale]];
    [formatter1 setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate* theDay1 = [formatter dateFromString:@"2014/01/31 01:15:00"];
    
    // ロケールを指定する
    NSLocale* locale = [NSLocale currentLocale];
    NSLog(@"%@", [theDay1 descriptionWithLocale:locale]);
    // Friday, January 31, 2014 at 1:15:00 AM Japan Standard Time

    
    
    // 日付オブジェクトをストリングに変更する
    NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString* dayString = [formatter stringFromDate:[NSDate date]];
    NSLog(@"%@", dayString);
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
