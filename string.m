#import <Foundation/Foundation.h>
#import "cheat.h"

int main(int argc, char *argv[])
{
  POOL;

  NSString *str = [NSString stringWithFormat:@"%@: %@", @"foo", @"bar"];

  puts(str);

  DRAIN;
}
