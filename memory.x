/*
RM0433, pp. 129-130
https://www.st.com/resource/en/reference_manual/dm00314099-stm32h742-stm32h743753-and-stm32h750-value-line-advanced-armbased-32bit-mcus-stmicroelectronics.pdf
*/

MEMORY
{
    ITCM        : ORIGIN = 0x00000000, LENGTH =  64K
    FLASH_1     : ORIGIN = 0x08000000, LENGTH =   1M
    FLASH_2     : ORIGIN = 0x08100000, LENGTH =   1M
    DTCM        : ORIGIN = 0x20000000, LENGTH = 128K
    SRAM_AXI    : ORIGIN = 0x24000000, LENGTH = 512K
    SRAM_1      : ORIGIN = 0x30000000, LENGTH = 128K
    SRAM_2      : ORIGIN = 0x30020000, LENGTH = 128K
    SRAM_3      : ORIGIN = 0x30040000, LENGTH =  32K
    SRAM_4      : ORIGIN = 0x38000000, LENGTH =  64K
    SRAM_BACKUP : ORIGIN = 0x38800000, LENGTH =   4K
    QSPI        : ORIGIN = 0x90000000, LENGTH = 128M
    SDRAM       : ORIGIN = 0xC0000000, LENGTH =  32M
}

REGION_ALIAS("FLASH", FLASH_1);
REGION_ALIAS("RAM", DTCM);

/*
_stack_start = ORIGIN(RAM) + LENGTH(RAM);
*/
