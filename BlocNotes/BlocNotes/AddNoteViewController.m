//
//  AddNoteViewController.m
//  BlocNotes
//
//  Created by rick m on 8/10/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "AddNoteViewController.h"
#import "NoteEntry.h"
#import "CoreDataStack.h"


@interface AddNoteViewController ()
@property (weak, nonatomic) IBOutlet UITextView *addNoteTextView;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)insertNoteEntry {
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    NoteEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"NoteEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.addNoteTextView.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
    
}

- (IBAction)saveNotePressed:(id)sender {
    [self insertNoteEntry];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
