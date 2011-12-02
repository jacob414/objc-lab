#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  NSURL *url = [NSURL URLWithString:@"http://example.com/~/files/report.aspx"];

  NSString *path = [[url path] lowercaseString];

  if ([path rangeOfString:@"/~/files"].location != NSNotFound) {
    NSLog(@"%@", @"Is a file");
  } else {
    NSLog(@"%@", @"Isn't a file");
  }

  NSURL *tel = [NSURL URLWithString:@"tel:+46708628545"];

  NSLog(@"Phone number is %@", [tel resourceSpecifier]);

  [pool drain];
}
