# Capstone Python bindings, by Nicolas PLANEL <nplanel@gmail.com>

import ctypes, copy
from .m68k_const import *

# define the API
class M68KOpMem(ctypes.Structure):
    _fields_ = (
        ('base_reg', ctypes.c_uint),
        ('index_reg', ctypes.c_uint),
        ('in_base_reg', ctypes.c_uint),
        ('in_disp', ctypes.c_uint),
        ('out_disp', ctypes.c_uint),
        ('disp', ctypes.c_ushort),
        ('scale', ctypes.c_ubyte),
        ('bitfield', ctypes.c_ubyte),
        ('width', ctypes.c_ubyte),
        ('offset', ctypes.c_ubyte),
        ('index_size', ctypes.c_ubyte),
    )

class M68KOpValue(ctypes.Union):
    _fields_ = (
        ('imm', ctypes.c_int64),
        ('dimm', ctypes.c_double),
        ('simm', ctypes.c_float),
        ('reg', ctypes.c_uint),
        ('mem', M68KOpMem),
        ('register_bits', ctypes.c_uint),
    )

class M68KOp(ctypes.Structure):
    _fields_ = (
        ('value', M68KOpValue),
        ('type', ctypes.c_uint),
        ('address_mode', ctypes.c_uint),
    )

    @property
    def imm(self):
        return self.value.imm

    @property
    def dimm(self):
        return self.value.dimm

    @property
    def simm(self):
        return self.value.simm

    @property
    def reg(self):
        return self.value.reg

    @property
    def mem(self):
        return self.value.mem

    @property
    def register_bits(self):
        return self.value.register_bits
    
class M68KOpSize(ctypes.Structure):
    _fields_ = (
        ('type', ctypes.c_uint),
        ('size', ctypes.c_uint),
    )

    def get(a):
        return copy.deepcopy(type, size)
    
class CsM68K(ctypes.Structure):
    M68K_OPERAND_COUNT = 4
    _fields_ = (
        ('operands', M68KOp * M68K_OPERAND_COUNT),
        ('op_size', M68KOpSize),
        ('op_count', ctypes.c_uint8),
    )

def get_arch_info(a):
    return (copy.deepcopy(a.operands[:a.op_count]), a.op_size)

