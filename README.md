# MapFilterReduce
Inspired by the method (map filter and reduce) of Array of JavaScript and chaining of Masonry.


最近在看Masonry的源码，惊叹于其中的链式调用，于是模仿着用OC实现JavaScript数组的三个经典方法map，filter和reduce，其实Swift中这3个方法已有内置的实现，自己只是写来玩玩。


```
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
```