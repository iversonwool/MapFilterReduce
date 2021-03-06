

#import <Foundation/Foundation.h>

#import "NSArray+MapFilterReduce.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *testArray = @[@(1), @(2), @(3), @(4), @(5)];
        
        //MARK: - useage of map
        NSArray *mapResult = testArray.lk_map(^(NSNumber *value, NSUInteger index, NSArray *array) {
            return @(value.integerValue * 2);
        });
        NSLog(@"map result => %@", mapResult);// @[@(2), @(4), @(6), @(8), @(10)]
        
        //MARK: - useage of filter
        NSArray *oddResult = testArray.lk_filter(^BOOL(NSNumber *value, NSUInteger index, NSArray *array) {
            return value.integerValue % 2 != 0;
        });
        NSLog(@"odd result => %@", oddResult);// @[@(1), @(3), @(5)]
        
        //MARK: - useage of reduce
        NSArray *member = @[@"Lily", @"Lucy", @"Jim"];
        NSString *greeting = [member lk_reduce:^id _Nonnull(NSString * _Nonnull accumulator, NSString * _Nonnull currentValue, NSUInteger index, NSArray * _Nonnull array) {
            if (index == 0) {
                return [NSString stringWithFormat:@"%@, %@", accumulator, currentValue];
            }
            else if (index == array.count - 1) {
                return [NSString stringWithFormat:@"%@ and %@!", accumulator, currentValue];
            }
            else return [NSString stringWithFormat:@"%@, %@", accumulator, currentValue];
        } initialValue:@"Hello"];
        NSLog(@"greeting => %@", greeting);// Hello, Lily, Lucy and Jim!
    }
    return 0;
}









