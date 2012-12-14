//
//  MinesweeperGame.h
//  Minesweeper
//

#import <Foundation/Foundation.h>

@interface MinesweeperGame : NSObject

- (void)createMines:(int)nbColumns nbRows:(int)nbRows andWithMines:(int)nbMines andArray:(NSMutableArray *)array andMatrix:(NSMutableArray *)matrix;
- (void)gameEnding;
- (void)setCellPropertyKnowningRow:(int)row column:(int)column hasAMine:(BOOL)hasMine isSelected:(BOOL)isSelected andMatrix:(NSMutableArray *)matrix; //should be in cell.h
- (void)setNumbers;

@end
