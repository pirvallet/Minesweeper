//
//  MinesweeperDifficulty.h
//  Minesweeper
//

#import <Foundation/Foundation.h>

@interface MinesweeperDifficulty : NSObject

@property (nonatomic) int difficultyButtonTag;

@property (nonatomic) int nbOfColumns;
@property (nonatomic) int nbOfRows;
@property (nonatomic) int nbOfMines;

@property (strong) NSMutableArray *buttonGrid;
@property (strong) NSMutableArray *matrix;
@property (strong) NSMutableArray *arrayOfTags;

- (id)initWithLevelDifficulty:(int)difficultyButtonTag;
- (void)defineDifficulty;

@end
