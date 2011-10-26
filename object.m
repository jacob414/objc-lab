#import <Foundation/Foundation.h>

// ----------------------------------------------------------------------------

@interface Cls: NSObject
{
  NSString *message;
}

-(Cls*) msg:(NSString*) msg;
-(void) show;

@end

// ----------------------------------------------------------------------------

@implementation Cls

-(Cls*) msg:(NSString*) msg {
  self = [super init];
  if (self) {
    message = msg;
  }

  return self;
}

-(void) show {
  NSLog(message);
}

@end

// ----------------------------------------------------------------------------

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  Cls *obj = [[Cls alloc] msg: @"foo"];
  [obj show];

  [obj release];
  [pool drain];
  return 0;
}
