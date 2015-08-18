//
//  ShareViewController.m
//  ShareW
//
//  Created by rick m on 8/13/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ShareViewController.h"
#import "CoreDataStack.h"
#import "NoteEntry.h"
@import MobileCoreServices;

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    NSExtensionItem *content = self.extensionContext.inputItems[0];
    
    NSItemProvider *provider = content.attachments.firstObject;
    
    if ([provider hasItemConformingToTypeIdentifier:(NSString *)kUTTypePlainText]) {
        
        
        [provider loadItemForTypeIdentifier:(NSString *)kUTTypePlainText options:nil completionHandler:^(NSString *item, NSError *error) {
            
            if (item) {
                CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
                NoteEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"NoteEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
                entry.body = item;
                entry.date = [[NSDate date] timeIntervalSince1970];
                entry.title = item;
                [coreDataStack saveContext];

            }
        }];
    }
    
    
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {

    
    return @[];
}

@end
