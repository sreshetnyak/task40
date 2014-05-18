//
//  TTStudent.m
//  CoreDataIntroKVC-KVO
//
//  Created by Sergey Reshetnyak on 5/17/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTStudent.h"

@implementation TTStudent

- (id)initWithfirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth gender:(TTStudentGender)gender grade:(CGFloat)grade {

    self = [super init];
    if (self) {
        
        self.firstName = firstName;
        self.lastName = lastName;
        self.dateOfBirth = dateOfBirth;
        self.gender = gender;
        self.grade = grade;
    }
    
    return self;

}

- (void)resetProperty {

    [self willChangeValueForKey:@"firstName"];
    _firstName = nil;
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = nil;
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = nil;
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = nanf(NULL);
    [self didChangeValueForKey:@"gender"];
    
    [self willChangeValueForKey:@"grade"];
    _grade = 0;
    [self didChangeValueForKey:@"grade"];
}


@end
