

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MapFilterReduce)

- (NSArray * (^)(id (^)(id, NSUInteger, NSArray *)))lk_map;

- (NSArray * (^)(BOOL (^)(id, NSUInteger, NSArray *)))lk_filter;

- (id)lk_reduce:(id (^)(id, id, NSUInteger, NSArray *))reduceBlock initialValue:(id _Nullable)initialValue;

@end

NS_ASSUME_NONNULL_END
