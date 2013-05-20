#import <Foundation/Foundation.h>

@interface Foo: NSObject {}
-(void)bar:(NSString*)param;
@end

@implementation Foo
-(void)bar:(NSString*)param {
  NSString *message =
    [NSString stringWithFormat:@"[Foo bar:] called with parameter '%@'", param];
  NSLog(message);
  return message;
}
@end

int main(int argc, char *argv[]) {

  // Straight call
  Foo *foo = [[Foo alloc] init];
  [foo bar:@"straight call"];

  // Canonical invocation
  SEL sel = @selector(bar:);

  NSInvocation *inv = [NSInvocation invocationWithMethodSignature:
                                  [foo methodSignatureForSelector:sel]];
  [inv setTarget:foo];
  [inv setSelector:sel];
  NSString *p = @"via NSInvocation";
  [inv setArgument:&p atIndex:2];

  [inv invoke];

  // TODO: via helper function

  // TODO: helper function that also returns a value
}
