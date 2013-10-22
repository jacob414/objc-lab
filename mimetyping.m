#import <Foundation/Foundation.h>

@interface NSString (MIMEAware)
@property (readonly, getter=isText) BOOL textual;
@property (readonly, getter=getEncoding) NSString *encoding;
@property (readonly, getter=getMimeType) NSString *mimeType;
-(BOOL)isText;
@end

@implementation NSString (MIMEAware)
-(BOOL)isText {
  return [self hasPrefix:@"text/"];
}

/**
 * See http://www.w3.org/International/O-HTTP-charset
 */
-(NSString*)getEncoding {
  return
    [[[self componentsSeparatedByString:@"charset="]
       objectAtIndex:1] lowercaseString];
}

-(NSString*)getMimeType {
  return [[self componentsSeparatedByString:@"; "] objectAtIndex:0];
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
  my_chk([@"text/plain".mimeType isEqual:@"text/plain"],
         @"Text plain without encoding");
  my_chk([@"text/plain; charset=UTF-8".mimeType isEqual:@"text/plain"],
         @"Text plain with encoding");
  return 0;
}
