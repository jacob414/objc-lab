#import <Foundation/Foundation.h>

@interface Cls: NSObject
{
  NSString *message;
}

-(Cls*) msg: msg;
-(void) show;

@end



@implementation Cls

-(Cls*) msg:(NSString*) msg {
  self = [super init];
  if (self) {
    message = msg;
  }
}

-(void) show {
  NSLog(message);
}

@end




int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];


  Cls *obj = [[Cls alloc] msg: (@"Hello, objects")];
  [obj show];


  [pool drain];
  return 0;
}
