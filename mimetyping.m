#import <Foundation/Foundation.h>

@interface NSString (MIMEAware)
@property (readonly, getter=isText) BOOL textual;
-(BOOL)isText;
@end

@implementation NSString (MIMEAware)
-(BOOL)isText {
  return [self hasPrefix:@"text/"];
}
@end

void my_chk(bool expr, NSString *desc) {
  if (expr) {
    NSLog(@"%@? OK", desc);
  }else {
    NSLog(@"%@? FAILED", desc);
  }
}

int main(int argc, char *argv[]) {
  NSString *rtf1 = @"application/rtf";

  my_chk(!@"application/rtf".textual, @"application/rtf binary");
  my_chk(@"text/plain".textual, @"text/plain textual");

  return 0;
}
