#import <Foundation/Foundation.h>

@interface NSString (MIMEAware)
@property (readonly, getter=isText) BOOL textual;
@property (readonly, getter=getEncoding) NSString *encoding;
-(BOOL)isText;
@end

@implementation NSString (MIMEAware)
-(BOOL)isText {
  return [self hasPrefix:@"text/"];
}

-(NSString*)getEncoding {
 return nil;
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
  my_chk([@"application/rtf; charset=UTF-8".encoding isEqual:@"utf-8"],
         @"RTF with encoding");

  return 0;
}
