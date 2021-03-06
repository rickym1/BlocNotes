//
//  AddNoteViewController.h
//  BlocNotes
//
//  Created by rick m on 8/10/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteEntry;

@interface NoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *addNoteTextView;
@property (weak, nonatomic) IBOutlet UITextField *addTitleTextView;


@property (nonatomic, strong) NoteEntry *entry;

@end
