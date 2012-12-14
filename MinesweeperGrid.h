//
//  MinesweeperGrid.h
//  Minesweeper
//

#import <Foundation/Foundation.h>

@interface MinesweeperGrid : NSObject

@property (strong) NSMutableArray *buttonTags;

@property (nonatomic) NSMutableArray *matrix;
@property (nonatomic) BOOL *mined;

//- (id)initWithGrid:(NSMutableArray *)gridOfButtons andMatrixOfCells:(NSMutableArray *)matrix;
- (NSMutableArray *)defineGridWithNbOfColumns:(int)nbColumns andNbOfRows:(int)nbRows;
- (NSMutableArray *)returnTheMatrixOfCells;
- (NSMutableArray *)returnTheTagsOfButtonsWithMine;

@end
