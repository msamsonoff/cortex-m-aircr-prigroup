#![no_main]
#![no_std]

use cortex_m::asm;
use cortex_m_rt::entry;
use cortex_m_semihosting::hprintln;
use panic_semihosting as _;
use stm32h7 as _;

const SCB_AIRCR_VECTKEY: u32 = 0x05FA << 16;
const SCB_AIRCR_PRIGROUP_MASK: u32 = 0x7 << 8;
const SCB_AIRCR_PRIGROUP: u32 = 0x03 << 8;

#[entry]
fn main() -> ! {
    let p = cortex_m::Peripherals::take().unwrap();
    let scb = p.SCB;

    hprintln!("[a] aircr: 0x{:08x}", scb.aircr.read()).unwrap();

    asm::dsb();
    unsafe {
        scb.aircr.modify(
            |r| {
                SCB_AIRCR_VECTKEY | (r & SCB_AIRCR_PRIGROUP_MASK) | SCB_AIRCR_PRIGROUP
            }
        )
    }
    asm::dsb();

    hprintln!("[b] aircr: 0x{:08x}", scb.aircr.read()).unwrap();
    hprintln!("sys_reset").unwrap();

    cortex_m::peripheral::SCB::sys_reset();
}
