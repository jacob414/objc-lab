from ctypes import cdll

lib = cdll.LoadLibrary("shared.so")

lib.try_logging()
