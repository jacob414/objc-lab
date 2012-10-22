#import <Foundation/Foundation.h>

@interface Parent: NSObject
+(id)make;
-(void)hello;
@end

@implementation Parent
+(id)make {
  return [[self alloc] init];
}

-(void)hello {
  NSLog(@"Parent says hello");
}
@end

@interface Child: Parent
@end

@implementation Child
-(void)hello {
  NSLog(@"Child says hello");
}
@end

int main(int argc, char *argv[])
{
  Parent *p = [Parent make];
  [p hello];
  Child *c = [Child make];
  [c hello];
}
