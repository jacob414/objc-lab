#include <stdarg.h>
#import <Foundation/Foundation.h>

@interface Cls : NSObject {}
-(void)variadic: (NSString*) first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@implementation Cls

-(void) variadic: (NSString*) first, ... {
  NSString *arg;

  NSLog(@"variadic() called for first %@", first);
  va_list args;
  va_start(args, first);
  while(arg = va_arg(args, NSString*)) {
    NSLog(@"  arg: %@", arg);
  }
  va_end(args);
}

@end

// ----------------------------------------------------------------------------

int main(int argc, char *argv[])
{
  Cls *obj = [Cls alloc];
  [obj variadic: @"say", @"one", @"two", nil];
  return 0;
}
