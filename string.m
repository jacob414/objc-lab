#import <Foundation/Foundation.h>
#import "cheat.h"

int main(int argc, char *argv[])
{
  POOL;

  NSString *str = [NSString stringWithFormat:@"%@: %@", @"foo", @"bar"];

  puts(str);

  NSString *other = qfmt(@"a str = %@, an int = %d", @"foo", 23);
  puts(other);

  DRAIN;
}
