#include <stdarg.h>
#import <Foundation/Foundation.h>

@interface Cls : NSObject {}

-(int) takes_block: (int)limit withBlock:(int (^)(int first, ...))block;
@end

@implementation Cls
-(int) takes_block: (int)limit withBlock:(int (^)(int first, ...))block {
  return block(55, @"Hello block, this is your caller");
}
@end

int main(int argc, char *argv[])
{
  Cls *obj = [Cls alloc];
  int result = [obj takes_block:5 withBlock:^(int number, ...) {
      va_list args;
      va_start(args, number);
      NSLog(@"comment: %@", va_arg(args, NSString*));
      va_end(args);
      return number * 23;
    }];
  NSLog(@"Result from takes_block: %d", result);
  return 0;
}
