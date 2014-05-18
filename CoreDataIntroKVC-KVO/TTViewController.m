//
//  TTViewController.m
//  CoreDataIntroKVC-KVO
//
//  Created by Sergey Reshetnyak on 5/12/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTStudent.h"
#import "NSDate+RandomDate.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      
//    4. Повесте обсервера на все пропертисы студента и выводите в консоль каждый раз, когда проперти меняется
//    5. Также сделайте метод "сброс", который сбрасывает все пропертисы, а в самом методе не используйте сеттеры, сделайте все через айвары, но сделайте так, чтобы обсервер узнал когда и что меняется. (типо как в уроке)
//    
//    Мастер.
//    
//    забудьте про UI
//    
//    6. Создайте несколько студентов и положите их в массив, но обсервер оставьте только на одном из них
//    7. У студентов сделайте weak проперти "friend". Сделайте цепочку из нескольких студентов, чтобы один был друг второму, второй третьему, тот четвертому, а тот первому :)
//    8. Используя метод setValue: forKeyPath: начните с одного студента (не того, что с обсервером) и переходите на его друга, меняя ему проперти, потом из того же студента на друга его друга и тд (то есть путь для последнего студента получится очень длинный)
//    9. Убедитесь что на каком-то из друзей, когда меняется какой-то проперти, срабатывает ваш обсервер
//    
//    Супермен
//    
//    10. Добавьте побольше студентов
//    11. Используя операторы KVC создайте массив имен всех студентов
//    12. Определите саммый поздний и саммый ранний годы рождения
//    13. Определите сумму всех баллов студентов и средний бал всех студентов
//    
//    вот такое вот задание!
    
    TTStudent *student1 = [[TTStudent alloc]init];
    TTStudent *student2 = [[TTStudent alloc]init];
    TTStudent *student3 = [[TTStudent alloc]init];

    [self addObserverForStudent:student1];
    //[self addObserverForStudent:student2];
    //[self addObserverForStudent:student3];
    
    student1 = [student1 initWithfirstName:@"Aleksandr" lastName:@"Koval" dateOfBirth:[NSDate randomDateInYearOfDate] gender:TTStudentMale grade:6.3f];
    student2 = [student2 initWithfirstName:@"Viktor" lastName:@"Krimskiy" dateOfBirth:[NSDate randomDateInYearOfDate] gender:TTStudentMale grade:8.2f];
    student3 = [student3 initWithfirstName:@"Sergey" lastName:@"Reshetnyak" dateOfBirth:[NSDate randomDateInYearOfDate] gender:TTStudentMale grade:5.3f];
    
    student1.friends = student2;
    student2.friends = student3;
    student3.friends = student1;
    
    
    NSLog(@"%@ has friend %@",[student1 valueForKeyPath:@"firstName"], [student1 valueForKeyPath:@"friends.firstName"]);
    NSLog(@"%@ has friend %@",[student2 valueForKeyPath:@"firstName"], [student1 valueForKeyPath:@"friends.friends.firstName"]);
    NSLog(@"%@ has friend %@",[student3 valueForKeyPath:@"firstName"], [student1 valueForKeyPath:@"friends.friends.friends.firstName"]);
    
    [student1 setValue:@"Georgiy" forKeyPath:@"friends.friends.friends.firstName"];
    
    NSArray *studentArray = @[student1,student2,student3];
    
    
    NSArray *nameArray = [studentArray valueForKeyPath:@"@distinctUnionOfObjects.firstName"];
    
    NSLog(@"max dateOfBirth %@",[studentArray valueForKeyPath:@"@max.dateOfBirth"]);
    NSLog(@"min dateOfBirth %@",[studentArray valueForKeyPath:@"@min.dateOfBirth"]);
    NSLog(@"sum grade %@",[studentArray valueForKeyPath:@"@sum.grade"]);
    NSLog(@"avg grade %@",[studentArray valueForKeyPath:@"@avg.grade"]);
    
    NSLog(@"%@",nameArray);
    
    NSLog(@"_______________reset_______________");
    
    [student1 resetProperty];
    [student2 resetProperty];
    [student3 resetProperty];
    
    
    [self removeObserverForStudents:student1];
    //[self removeObserverForStudents:student2];
    //[self removeObserverForStudents:student3];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

    
    NSLog(@"observeValueForKeyPath%@\n ofObject%@\n change%@\n",keyPath, object,change);
}

- (void) addObserverForStudent:(TTStudent *)student {

    [student addObserver:self
              forKeyPath:@"firstName"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    [student addObserver:self
              forKeyPath:@"lastName"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    [student addObserver:self
              forKeyPath:@"dateOfBirth"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    [student addObserver:self
              forKeyPath:@"gender"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    [student addObserver:self
              forKeyPath:@"grade"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];

}

- (void) removeObserverForStudents:(TTStudent *)student {
    
    [student removeObserver:self forKeyPath:@"firstName"];
    [student removeObserver:self forKeyPath:@"lastName"];
    [student removeObserver:self forKeyPath:@"dateOfBirth"];
    [student removeObserver:self forKeyPath:@"gender"];
    [student removeObserver:self forKeyPath:@"grade"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
