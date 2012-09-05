#import <Foundation/Foundation.h>

@interface Fwd: NSObject
@end

@implementation Fwd
-(void)dummy:(id)_ { }

- (void)forwardInvocation:(NSInvocation *)invocation {
  NSLog(@"method sign: %@", NSStringFromSelector([invocation selector]));
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
  return [super methodSignatureForSelector:@selector(dummy:)];
}
@end

int main(int argc, char *argv[]) {
  Fwd *fwd = [[Fwd alloc] init];
  [fwd foo:@"bar" bar:@"baz"];
}
