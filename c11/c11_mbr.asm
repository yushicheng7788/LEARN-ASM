; 代码清单11-1
; 文件名：c11_mbr.asm
; 文件说明：硬盘主引导扇区代码
; 创建日期：2021-11-24 18：05

; 设置堆栈段和堆栈指针
mov ax, cs
mov ss, ax
mov sp, 0x7c00

; 计算GDT所在的逻辑段地址, 右移4位即可
mov ax, [cs:gdt_base+0x7c00]
mov dx, [cs:gdt_base+0x7c00+0x02]
mov bx, 16
div bx
mov ds, ax
mov bx, dx



；---------------------------------------------
gdt_size    dw 0
gdt_base    dd 0x00007e00       ; 主引导扇区代码加载到物理地址0x07c00处，一个扇区是512字节，所以这个位置是合理的