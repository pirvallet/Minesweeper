//
//  MinesweeperCell.m
//  Minesweeper
//

#import "MinesweeperCell.h"

@implementation MinesweeperCell

//Designated initialiser
- (id)initWithCoordinates:(int)row andColumn:(int)column knowingNbOfRows:(int)nbRows andNbOfColumns:(int)nbColumns {
    self = [super init];
    if (self) {
        self.isMarked = FALSE;  //has a flag or not
        self.hasAMine = FALSE;  //has a mine or not
    }
    return self;
}

- (NSMutableArray *)getTheNeighborsOfACell:(int)row column:(int)column knowingNbOfRows:(int)nbRows andNbOfColumns:(int)nbColumns andTheMatrixOfCells:(NSMutableArray *)matrix {
    
    NSMutableArray *arrayOfCells = [[NSMutableArray alloc] init];
    
    for (int i=[[[self selectRows:row knowingNbOfRows:nbRows] objectAtIndex:0] intValue]; i<[[[self selectRows:row knowingNbOfRows:nbRows] objectAtIndex:0] intValue] + [self selectRows:row knowingNbOfRows:nbRows].count; i++) {
        for (int j=[[[self selectColumns:column knowingNbOfColumns:nbColumns] objectAtIndex:0] intValue]; j<[[[self selectColumns:column knowingNbOfColumns:nbColumns] objectAtIndex:0] intValue] + [self selectColumns:column knowingNbOfColumns:nbColumns].count; j++) {
            
            [arrayOfCells addObject:[[matrix objectAtIndex:i] objectAtIndex:j]];
        }
    }
    //[arrayOfCells removeObject:[[arrayOfCells objectAtIndex:row] objectAtIndex:column]];
    return arrayOfCells;
}

//The two functions bellow allow us to avoid the border issues (some cells don't have 8 neighbors)
- (NSMutableArray *)selectRows:(int)row knowingNbOfRows:(int)nbRows {
    NSMutableArray *rows = [[NSMutableArray alloc] init];
    
    if (row == 0) {
        [rows addObject:[NSNumber numberWithInt:0]];
        [rows addObject:[NSNumber numberWithInt:1]];
        
        return rows;
    }
    else if (row == nbRows - 1) {
        [rows addObject:[NSNumber numberWithInt:nbRows - 2]];
        [rows addObject:[NSNumber numberWithInt:nbRows - 1]];
        
        return rows;
    }
    else {
        [rows addObject:[NSNumber numberWithInt:row - 1]];
        [rows addObject:[NSNumber numberWithInt:row]];
        [rows addObject:[NSNumber numberWithInt:row + 1]];
        
        return rows;
    }
}

- (NSMutableArray *)selectColumns:(int)column knowingNbOfColumns:(int)nbColumns {
    NSMutableArray *columns = [[NSMutableArray alloc] init];
    
    if (column == 0) {
        [columns addObject:[NSNumber numberWithInt:0]];
        [columns addObject:[NSNumber numberWithInt:1]];
        
        return columns;
    }
    else if (column == nbColumns - 1) {
        [columns addObject:[NSNumber numberWithInt:nbColumns - 2]];
        [columns addObject:[NSNumber numberWithInt:nbColumns - 1]];
        
        return columns;
    }
    else {
        [columns addObject:[NSNumber numberWithInt:column - 1]];
        [columns addObject:[NSNumber numberWithInt:column]];
        [columns addObject:[NSNumber numberWithInt:column + 1]];
        
        return columns;
    }
}

@end
