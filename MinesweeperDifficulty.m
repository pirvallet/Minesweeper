//
//  MinesweeperDifficulty.m
//  Minesweeper
//

#import "MinesweeperDifficulty.h"
#import "MinesweeperGrid.h"

@implementation MinesweeperDifficulty

//Designated initializer
- (id)initWithLevelDifficulty:(int)difficultyButtonTag {
    self = [super init];
    if (self) {
        self.difficultyButtonTag = difficultyButtonTag;
        [self defineDifficulty];
        
        MinesweeperGrid *buttons = [[MinesweeperGrid alloc] init];
        self.buttonGrid = [buttons defineGridWithNbOfColumns:self.nbOfColumns andNbOfRows:self.nbOfRows];
        self.matrix = [buttons returnTheMatrixOfCells];
        self.arrayOfTags = [buttons returnTheTagsOfButtonsWithMine];
    }
    return self;
}

//Defines the difficulty depending on the button we click (see DifficultyViewController)
- (void)defineDifficulty {
    if (self.difficultyButtonTag == 0) {
        self.nbOfColumns = 5;
        self.nbOfRows = 7;
        self.nbOfMines = 8;
    }
    else if (self.difficultyButtonTag == 1) {
        self.nbOfColumns = 8;
        self.nbOfRows = 10;
        self.nbOfMines = 40;
    }
    else if (self.difficultyButtonTag == 2) {
        self.nbOfColumns = 14;
        self.nbOfRows = 16;
        self.nbOfMines = 99;
    }
    else {
        //Do nothing -> maybe we could put an error message...
    }
}

@end
