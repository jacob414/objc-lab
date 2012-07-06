#import <Foundation/Foundation.h>

@interface WithCM: NSObject
+(void)say:(NSString*)what;
@end

@implementation WithCM

+(void)say:(NSString*)what {
  NSLog(@"%@", what);
}

@end

int main(int argc, char *argv[]) {
  [WithCM say:@"foo"];
}
