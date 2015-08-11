//
//  NoteEntry.h
//  
//
//  Created by rick m on 8/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NoteEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;

@end
