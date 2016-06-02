//
//  ViewController.m
//  WordSearch
//
//  Created by DetroitLabs on 6/2/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *wordBoxTextView;
@property (weak, nonatomic) IBOutlet UITextField *wordToSearchTextField;
@property (weak, nonatomic) IBOutlet UILabel *pointCountLabel;
@property (weak, nonatomic) IBOutlet UITableView *wordsFoundTableView;

@end

NSString *wordBoxAsOneWord;
int pointCount;
NSMutableArray *wordsFound;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pointCount = 0;
    wordsFound = [[NSMutableArray alloc]init];
    [self randomlyGeneratedWordSearchBox];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)randomlyGeneratedWordSearchBox {
    _wordBox = [NSMutableArray arrayWithObjects:@"skjfhaskjfhk", @"uewuewrhnq", @"annskslallopa", @"apple", @"jobs", @"yysahhhanns", @"oiuhaifhahsfnajsn", @"qrwyeirkflcnx", @"uasnsajfihasjncjauabasususnwquqwyqwp", @"usau", @"yw", @"asuncj", @"aucnasubuia", @"uchiauwhiuqwui",  @"lions", @"gorilla", @"uau", @"askfjioajco", @"asfjl", @"fdjaiixms", @"oiuhaifhahsfnajsn", @"usau", @"yw", @"asuncj", @"aucnasubuia", @"uchiauwhiuqwui", @"uau", @"askfjioajco", @"asfjl", @"fdjaiixms", @"oiuhaifhahsfnajsn",@"hello", @"time", @"usau", @"yw", @"asuncj", @"aucnasubuia", @"uau", @"askfjioajco", @"asfjl", @"fdjaiixms", @"usau", @"yw", @"asuncj", @"aucnasubuia", @"uchiauwhiuqwui", @"uau", @"askfjioajco", @"asfjl", @"fdjaiixms", @"oiuhaifhahsfnajsn", @"usau", @"yw", @"asuncj", @"aucnasubuia", @"uchiauwhiuqwui", @"uau", @"askfjioajco", @"asfjl", @"fdjaiixms", @"oiuhaifhahsfnajsn", @"yellow", @"iOS", @"swift", @"xcode", @"techtown", @"mexico", @"dog", @"cat", @"purple", @"blue", @"green", @"syrup", @"bread", @"lunch", @"food", @"sports", @"detroit", @"zoo", @"giraffe", @"bear", @"tiger", nil];
    
    for (int i = 0; i < _wordBox.count; i++) {
        int randomInt = arc4random() % [_wordBox count];
        [_wordBox exchangeObjectAtIndex:i withObjectAtIndex:randomInt];
    }
    
    wordBoxAsOneWord = [_wordBox componentsJoinedByString:@""];
    
    _wordBoxTextView.text = wordBoxAsOneWord;
}

-(void)increasePointCount {
    pointCount++;
    _pointCountLabel.text = [NSString stringWithFormat:@"%i", pointCount];
}

-(void)addFoundWordToListOfFoundWords:(NSString *)word {
    [wordsFound addObject:word];
    [_wordsFoundTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return wordsFound.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [wordsFound objectAtIndex:indexPath.row];
    
    return cell;

}

- (IBAction)searchButtonPressed:(id)sender {
    NSString *wordToSearch = _wordToSearchTextField.text;
    
    if ([wordBoxAsOneWord containsString:wordToSearch]) {
        [self increasePointCount];
        [self addFoundWordToListOfFoundWords:wordToSearch];
    } else {
        NSLog(@"Sorry");
    }
    
}

@end
