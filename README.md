# cortex-m-aircr-prigroup

This is a small test program to answer these age old questions:

* What is the reset value of the Cortex-M `AIRCR` `PRIGROUP` field? (The SVD says it is `0b000`.)

* Does it actually reset to that value when you reset the processor with `AIRCR` `SYSRESETREQ`? (It does.)

See [rust-embedded/cortex-m](https://github.com/rust-embedded/cortex-m) [issue 338](https://github.com/rust-embedded/cortex-m/issues/338).
