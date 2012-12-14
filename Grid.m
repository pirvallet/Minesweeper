//
//  MinesweeperGrid.m
//  Minesweeper2
//

#import "MinesweeperGrid.h"
#import "MinesweeperCell.h"
#import "MinesweeperDifficulty.h"

@implementation MinesweeperGrid

//function that defines the grid
- (NSMutableArray *)defineGridWithNbOfColumns:(int)nbColumns andNbOfRows:(int)nbRows {
    NSMutableArray *buttonArray = [[NSMutableArray alloc] init];    //To store the buttons
    self.buttonTags = [[NSMutableArray alloc] init];  //To store the buttons tags
    
    int screenWidth = 320;  //works for an iPhone, up to iPhone 4S
    int screenHeight = 420;
    float buttonWidth = screenWidth / nbColumns;
    float buttonHeight = screenHeight / nbRows;
    int increment = 0;
    
    self.matrix = [[NSMutableArray alloc] initWithCapacity:nbRows]; //To store the properties of a cell (has a mine or not...)
    for (int k=0; k<nbRows; k++) {
        [self.matrix addObject:@""];  //Else the init won't allow us to use the function insertObjectAtIndex:i
    }
    
    for (int i=0; i<nbRows; i++)
    {
        NSMutableArray *matrixRow = [[NSMutableArray alloc] init];

        for (int j=0; j<nbColumns; j++)
        {
            int xpos = j*buttonWidth; //Coordinates of the button in the grid
            int ypos = i*buttonHeight;
                        
            //Creation of a button
            UIButton *btn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(xpos,ypos, buttonWidth, buttonHeight);
            btn.titleLabel.font  = [UIFont systemFontOfSize: 10];
            //btn.titleLabel.textColor = [UIColor blackColor]; FONCTION DU CHIFFRE
            btn.backgroundColor = [UIColor whiteColor];
            //[btn setBackgroundImage:[UIImage imageNamed:@"view_img 2.jpg"] forState:UIControlStateNormal]; VOIR POUR LES MINES ET LES FLAGS
            btn.tag = increment;
            [self.buttonTags addObject:[NSNumber numberWithInt:btn.tag]];
            increment ++;
            
            //Store the button in our array
            [buttonArray addObject:btn];
            
            //Define the corresponding cell (one cell for one button)
            [matrixRow addObject:[[MinesweeperCell alloc] initWithCoordinates:i andColumn:j knowingNbOfRows:nbRows andNbOfColumns:nbColumns]];
        }
        [self.matrix insertObject:matrixRow atIndex:i];
        NSLog(@"insertion ok");
    }
    NSLog(@"All buttons created");

    [self.matrix removeObject:@""]; //We just keep the cell type objects
    NSLog(@"Number of cells in matrix : %i", self.matrix.count);

    return buttonArray;
}

- (NSMutableArray *)returnTheMatrixOfCells {
    return self.matrix;
}

- (NSMutableArray *)returnTheTagsOfButtonsWithMine {
    return self.buttonTags;
}

@end
