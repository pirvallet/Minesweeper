//
//  MinesweeperGridViewController.m
//  Minesweeper
//

#import "MinesweeperGridViewController.h"
#import "MinesweeperGrid.h"
#import "MinesweeperDifficulty.h"
#import "MinesweeperCell.h"
#import "MinesweeperGame.h"

@interface MinesweeperGridViewController ()

@end

@implementation MinesweeperGridViewController

//Designated initializer
- (id)initWithLevel:(int)buttonTag {
    self = [super init];
    if (self) {
        self.level = buttonTag;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view.

  //We create the game and then the grid with its matrix
    MinesweeperGame *game = [[MinesweeperGame alloc] init];
    
    self.grid = [[MinesweeperDifficulty alloc] initWithLevelDifficulty:self.level];

    [game createMines:self.grid.nbOfColumns nbRows:self.grid.nbOfRows andWithMines:self.grid.nbOfMines andArray:self.grid.arrayOfTags andMatrix:self.grid.matrix];
    
    //Add the buttons on the view and control what to do with them
    for(UIButton *button in self.grid.buttonGrid) {
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(buttonDragged:) forControlEvents:UIControlEventTouchDragInside];
        
        //add the button to the view
        [self.view addSubview:button];
    }
}

#pragma mark - Button Managment

- (void)buttonClicked:(id)sender {
    UIButton *button = (UIButton *)sender;
    button.enabled = NO;
    //[button removeFromSuperview];
    NSLog(@"%i", button.tag);
    
    //There will be a function for all that...
    int row = button.tag/self.grid.nbOfColumns;
    int column = button.tag-(button.tag/self.grid.nbOfColumns)*self.grid.nbOfColumns;
    NSLog(@"row %i and column %i", row, column);
    NSLog(@"number of cells in self.matrix %i", self.grid.matrix.count);
    MinesweeperCell *cell = [[self.grid.matrix objectAtIndex:row] objectAtIndex:column];
    cell.neighbors = [cell getTheNeighborsOfACell:row column:column knowingNbOfRows:self.grid.nbOfRows andNbOfColumns:self.grid.nbOfColumns andTheMatrixOfCells:self.grid.matrix];
    NSLog(@"%i", cell.neighbors.count);
    
    int k=0;
    for (MinesweeperCell *cells in cell.neighbors) {
        
        if (cells.hasAMine == TRUE) {
            k++;
            //[button setBackgroundImage:[UIImage imageNamed:@"Default.png"] forState:UIControlStateNormal];
        }
    }
    NSLog(@"%i", k);
    NSString *numberToDisplay = [[NSString alloc] initWithFormat:@"%i",k];
    [button setTitle:numberToDisplay forState:UIControlStateNormal];
}

//This action is not good -> find something else to replace the right mouse button click
- (void)buttonDragged:(id)sender {
    UIButton *button = (UIButton *)sender;
    [button setBackgroundImage:[UIImage imageNamed:@"Default@2x.png"] forState:UIControlStateNormal];
}

@end
