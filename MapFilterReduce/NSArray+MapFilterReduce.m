

#import "NSArray+MapFilterReduce.h"

@implementation NSArray (MapFilterReduce)

- (NSArray * _Nonnull (^)(id  _Nonnull (^ _Nonnull)(id _Nonnull, NSUInteger, NSArray * _Nonnull)))lk_map {
    
    return ^(id (^mapBlock)(id, NSUInteger, NSArray *)) {
        
        NSMutableArray *result = @[].mutableCopy;
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [result addObject:mapBlock(obj, idx, self)];
        }];
        return result.copy;
    };
}

- (NSArray * _Nonnull (^)(BOOL (^ _Nonnull)(id _Nonnull, NSUInteger, NSArray * _Nonnull)))lk_filter {
    
    return ^(BOOL (^filterBlock)(id, NSUInteger, NSArray *)) {
        
        NSMutableArray *result = @[].mutableCopy;
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (filterBlock(obj, idx, self)) {
                [result addObject:obj];
            }
        }];
        return result.copy;
    };
}

- (id)lk_reduce:(id  _Nonnull (^)(id _Nonnull, id _Nonnull, NSUInteger, NSArray * _Nonnull))reduceBlock initialValue:(id)initialValue {
    
    __block id accumulator;
    if (initialValue) {
        accumulator = initialValue;
    } else {
        accumulator = self.firstObject;
    }
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        accumulator = reduceBlock(accumulator, obj, idx, self);
    }];
    return accumulator;
}

@end
