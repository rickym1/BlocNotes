//
//  AddNoteViewController.m
//  BlocNotes
//
//  Created by rick m on 8/10/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "NoteViewController.h"
#import "NoteEntry.h"
#import "CoreDataStack.h"


@interface NoteViewController ()

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.entry != nil) {
        self.addNoteTextView.text = self.entry.body;
        self.addTitleTextView.text = self.entry.title;
    }
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
    entry.title = self.addTitleTextView.text;
    [coreDataStack saveContext];
    
}

- (void) updateNoteEntry {
    
    self.entry.body = self.addNoteTextView.text;
    self.entry.title = self.addTitleTextView.text;
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    [coreDataStack saveContext];
    
}

- (IBAction)saveNotePressed:(id)sender {
    if (self.entry != nil) {
        [self updateNoteEntry];
    } else {
        [self insertNoteEntry];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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
