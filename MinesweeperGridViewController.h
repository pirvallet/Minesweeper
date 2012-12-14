//
//  MinesweeperGridViewController.h
//  Minesweeper
//

#import <UIKit/UIKit.h>
#import "MinesweeperDifficulty.h"

@interface MinesweeperGridViewController : UIViewController

@property (nonatomic) int level;
@property (strong) MinesweeperDifficulty *grid;

- (id)initWithLevel:(int)buttonTag;
- (void)buttonClicked:(id)sender;
- (void)buttonDragged:(id)sender;

@end
