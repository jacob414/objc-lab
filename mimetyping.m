#import <Foundation/Foundation.h>

@interface NSString (MIMEAware)
@property (readonly, getter=isText) BOOL textual;
@property (readonly, getter=getEncodingOrUtf8) NSString *encodingOrUtf8;
@property (readonly, getter=getNSEncoding) NSStringEncoding nsEncoding;
@property (readonly, getter=getMimeType) NSString *mimeType;
@end

@implementation NSString (MIMEAware)
-(BOOL)isText {
  return [self hasPrefix:@"text/"];
}

/**
 * See http://www.w3.org/International/O-HTTP-charset
 */
-(NSString*)getEncodingOrUtf8 {
  NSArray *parts = [self componentsSeparatedByString:@"charset="];
  NSString *charset;
  if ([parts count] == 2) {
    charset = [[parts objectAtIndex:1] lowercaseString];
  }
  return charset != nil ? charset : @"utf-8";
}

-(NSString*)getMimeType {
  return [[self componentsSeparatedByString:@"; "] objectAtIndex:0];
}

/**
 * Convert an IANA character set to a `NSStringEncoding`. If
 * `encodingName` is `nil`, return `NSUTF8StringEncoding` as a guess.
 */
-(NSStringEncoding)getNSEncoding {
  NSString *encName = self.encodingOrUtf8;
  CFStringEncoding cfEnc = CFStringConvertIANACharSetNameToEncoding((CFStringRef)encName);
  return CFStringConvertEncodingToNSStringEncoding(cfEnc);
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
  my_chk([@"application/rtf; charset=UTF-8".encodingOrUtf8 isEqual:@"utf-8"],
         @"RTF with encoding");
  my_chk([@"text/html".encodingOrUtf8 isEqual:@"utf-8"],
         @"HTMP without encoding guesses on UTF-8");
  my_chk([@"text/plain".mimeType isEqual:@"text/plain"],
         @"Text plain without encoding");
  my_chk([@"text/plain; charset=UTF-8".mimeType isEqual:@"text/plain"],
         @"Text plain with encoding");
  my_chk(@"text/html".nsEncoding == NSUTF8StringEncoding,
         @"text/html without encoding guesses NSUTF8StringEncoding");
  my_chk(@"text/html; charset=UTF-16".nsEncoding == NSUTF16StringEncoding,
         @"text/html with encoding");
  return 0;
}
