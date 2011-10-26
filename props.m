#import <Foundation/Foundation.h>

// ----------------------------------------------------------------------------

@interface WProps : NSObject {
  NSString *message;
}

@property(copy) NSString *message;

-(WProps*) msg:(NSString*) ms;
-(void) show;

@end

@implementation WProps

@synthesize message;

-(WProps*) msg:(NSString*) ms {
  self = [super init];
  if (self) {
    [self setMessage:ms];
  }
  return self;
}

-(void) show {
  NSLog(@"%@", message);
}

@end

// ----------------------------------------------------------------------------

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  WProps *props = [[WProps alloc] msg:@"Message"];
  [props show];
  NSLog(@"%@", props.message);
  [props release];

  [pool drain];
  return 0;
}
