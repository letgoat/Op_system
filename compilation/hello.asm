section .data
    msg db 'Hello, World!', 0xA   ; 要输出的字符串，0xA 是换行符（LF）
    len equ $ - msg               ; 计算字符串的长度

section .text
    global _start                 ; 链接器需要这个标签

_start:
    ; 系统调用：sys_write
    mov eax, 4                    ; 系统调用号 (sys_write)
    mov ebx, 1                    ; 文件描述符 (stdout)
    mov ecx, msg                  ; 要输出的字符串的地址
    mov edx, len                  ; 字符串的长度
    int 0x80                      ; 调用内核

    ; 系统调用：sys_exit
    mov eax, 1                    ; 系统调用号 (sys_exit)
    mov ebx, 0                    ; 退出状态码
    int 0x80                      ; 调用内核