define hook-quit
    set confirm off
end

target extended-remote :3333

set backtrace limit 32
set print asm-demangle on
set print pretty on
set style sources off

monitor arm semihosting enable
monitor reset halt

# break DefaultHandler
# break HardFault
# break main

load
continue
