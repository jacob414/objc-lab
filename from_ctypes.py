import ctypes
import ctypes.util

def check(o, name):
    if o:
        print('Found %s' % name)
    else:
        print('Did not find %s' % name)
    return o

objc = check(ctypes.cdll.LoadLibrary(ctypes.util.find_library('objc')), 'objc')

Foundation = check(
    ctypes.cdll.LoadLibrary(ctypes.util.find_library('Foundation')),
    'Foundation')

objc.objc_getClass.restype = ctypes.c_void_p
objc.sel_registerName.restype = ctypes.c_void_p
objc.objc_msgSend.restype = ctypes.c_void_p
objc.objc_msgSend.argtypes = [ctypes.c_void_p, ctypes.c_void_p]

NSString = check(objc.objc_getClass('NSLogv'), 'NSLogv')

swf = check(objc.sel_registerName('stringWithFormat'), 'stringWithFormat')
