#define POOL NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]
#define DRAIN [pool drain]

#define init(Cls) [[Cls alloc] init]
#define log(f, m) NSLog(@f, m)
#define puts(m) log("%@", m)
