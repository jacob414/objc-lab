#import <Foundation/Foundation.h>

@interface MyC: NSObject
-(SEL)choose;
-(void)a;
-(void)b;
@end

@implementation MyC


-(SEL)choose {
  return @selector(b);
}

-(void)a {
  NSLog(@"METHOD A");
}

-(void)b {
  NSLog(@"METHOD B");
}

@end

int main(int argc, char *argv[]) {
  MyC *ob = [[MyC alloc] init];
  [ob performSelector:[ob choose]];
}
