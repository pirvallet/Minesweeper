//
//  MinesweeperCell.h
//  Minesweeper
//

#import <Foundation/Foundation.h>

@interface MinesweeperCell : NSObject

@property (strong) NSMutableArray *neighbors;
@property (nonatomic) int number;
@property (nonatomic) BOOL hasAMine;
@property (nonatomic) BOOL isMarked;

- (id)initWithCoordinates:(int)row andColumn:(int)column knowingNbOfRows:(int)nbRows andNbOfColumns:(int)nbColumns;
- (NSMutableArray *)getTheNeighborsOfACell:(int)row column:(int)column knowingNbOfRows:(int)nbRows andNbOfColumns:(int)nbColumns andTheMatrixOfCells:(NSMutableArray *)matrix;
- (NSMutableArray *)selectRows:(int)row knowingNbOfRows:(int)nbRows;
- (NSMutableArray *)selectColumns:(int)column knowingNbOfColumns:(int)nbColumns;

@end
