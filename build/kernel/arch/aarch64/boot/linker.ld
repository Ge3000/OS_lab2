
ENTRY(_start)

SECTIONS
{
    .debug 0 : { *(.debug) } .line 0 : { *(.line) } .debug_srcinfo 0 : { *(.debug_srcinfo) } .debug_sfnames 0 : { *(.debug_sfnames) } .debug_aranges 0 : { *(.debug_aranges) } .debug_pubnames 0 : { *(.debug_pubnames) } .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) } .debug_abbrev 0 : { *(.debug_abbrev) } .debug_line 0 : { *(.debug_line) } .debug_frame 0 : { *(.debug_frame) } .debug_str 0 : { *(.debug_str) } .debug_loc 0 : { *(.debug_loc) } .debug_macinfo 0 : { *(.debug_macinfo) } .debug_pubtypes 0 : { *(.debug_pubtypes) } .debug_ranges 0 : { *(.debug_ranges) } .debug_weaknames 0 : { *(.debug_weaknames) } .debug_funcnames 0 : { *(.debug_funcnames) } .debug_typenames 0 : { *(.debug_typenames) } .debug_varnames 0 : { *(.debug_varnames) } .debug_gnu_pubnames 0 : { *(.debug_gnu_pubnames) } .debug_gnu_pubtypes 0 : { *(.debug_gnu_pubtypes) } .debug_types 0 : { *(.debug_types) } .debug_addr 0 : { *(.debug_addr) } .debug_line_str 0 : { *(.debug_line_str) } .debug_loclists 0 : { *(.debug_loclists) } .debug_macro 0 : { *(.debug_macro) } .debug_names 0 : { *(.debug_names) } .debug_rnglists 0 : { *(.debug_rnglists) } .debug_str_offsets 0 : { *(.debug_str_offsets) }
    . = 0x80000;

    img_start = .;
    init : {
        /root/OS-Course-Lab/Lab2/kernel/arch/aarch64/boot/raspi3/init/start.S.obj
/root/OS-Course-Lab/Lab2/kernel/arch/aarch64/boot/raspi3/init/mmu.c.obj
/root/OS-Course-Lab/Lab2/kernel/arch/aarch64/boot/raspi3/init/tools.S.obj
/root/OS-Course-Lab/Lab2/kernel/arch/aarch64/boot/raspi3/init/init_c.c.obj
/root/OS-Course-Lab/Lab2/kernel/arch/aarch64/boot/raspi3/peripherals/uart.c.obj(.text* .data* .rodata* .bss* .extable*)
    }
    . = ALIGN(4K);
    init_end = ABSOLUTE(.);

    .text 0xffffff0000000000 + init_end : AT(init_end) {
    _text_start = .;
        *(.text*)
    }
    . = ALIGN(4K);
    _text_end = .;

    .data : {
        *(.data*)
    }
    . = ALIGN(4K);

    .init.serial : {
        *(.init.serial*)
    }
    . = ALIGN(4K);
    _serial_end = . - 0xffffff0000000000;

    .rodata : {
        *(.rodata*)
        . = ALIGN(4K);

    }
    . = ALIGN(4K);
    _edata = . - 0xffffff0000000000;

    _bss_start = . - 0xffffff0000000000;
    .bss : {
        *(.bss*)
    }
    . = ALIGN(4K);
    _bss_end = . - 0xffffff0000000000;

    _extable_start = .;
    .extable : {
        *(.extable*)
    }
    . = ALIGN(4K);
    _extable_end = .;

    img_end = . - 0xffffff0000000000;

    /DISCARD/ : { *(.comment) *(.gnu*) *(.note*) *(.eh_frame*) }
}
