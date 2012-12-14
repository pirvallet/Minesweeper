//
//  MinesweeperGame.m
//  Minesweeper
//

#import "MinesweeperGame.h"
#import "MinesweeperGrid.h"
#import "MinesweeperCell.h"

@implementation MinesweeperGame

//Put the mines at random in the field of buttons
- (void)createMines:(int)nbColumns nbRows:(int)nbRows andWithMines:(int)nbMines andArray:(NSMutableArray *)array andMatrix:(NSMutableArray *)matrix {
    int minesTag[nbMines];
    
    for (int k=0; k<nbMines; k++) {
        int random = [array[(arc4random()%nbColumns*nbRows)] intValue];
        minesTag[k] = random;
        
        [self setCellPropertyKnowningRow:random column:nbColumns hasAMine:TRUE isSelected:FALSE andMatrix:matrix];

        [array removeObject:[NSNumber numberWithInt:random]];
    }
    for (int i=0; i<nbMines; i++) {
        NSLog(@"Mine en case %i", minesTag[i]);
    }
    
}

//Defines that you win when all the mines are marked -> count is still to be implemented
- (void)gameEnding:(int)count {
    if (count == 0) {
        UILabel *endinglabel = [[UILabel alloc] init];
        [endinglabel setFrame:CGRectMake(30, 50, 20, 10)];  //Still got to see if that fits properly in the screen
        
        endinglabel.text = @"You Win !!"; //A newGame button or a UIAlertView would be good
    }
}

- (void)setCellPropertyKnowningRow:(int)row column:(int)column hasAMine:(BOOL)hasMine isSelected:(BOOL)isSelected andMatrix:(NSMutableArray *)matrix {
    MinesweeperCell *cell = [[matrix objectAtIndex:row/column] objectAtIndex:row-(row/column)*column];
    cell.hasAMine = hasMine;
    cell.isMarked = isSelected;

}

@end
