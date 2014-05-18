//
//  TTStudent.h
//  CoreDataIntroKVC-KVO
//
//  Created by Sergey Reshetnyak on 5/17/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TTStudentMale,
    TTStudentFemale
} TTStudentGender;

@interface TTStudent : NSObject

@property (strong,nonatomic) NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (strong,nonatomic) NSDate *dateOfBirth;
@property (assign,nonatomic) TTStudentGender gender;
@property (assign,nonatomic) CGFloat grade;
@property (weak,nonatomic)  TTStudent *friends;

- (id)initWithfirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth gender:(TTStudentGender)gender grade:(CGFloat)grade;

- (void)resetProperty;

@end
