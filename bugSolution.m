// bugSolution.m

#import "bugSolution.h"

@interface MyClass ()
@property (nonatomic, weak) void (^myBlock)(void);
@end

@implementation MyClass

- (instancetype)init {
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self; // Create a weak reference
        self.myBlock = ^{ 
            // Access self using weakSelf to avoid strong reference cycle
            if (weakSelf) {
                NSLog(@"Block executed");
            }
        };
    }
    return self;
}

- (void)executeBlock {
    if (self.myBlock) {
        self.myBlock();
    }
}

@end