#import <Foundation/Foundation.h>

#define simple(fmt, msg) NSLog(@fmt, msg)
#define logstr(msg) simple("%s", msg)
#define logint(val) simple("The value is %d", val);

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  logstr("Some simple output..");
  logint(100);
  [pool drain];
}
