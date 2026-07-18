#![no_std]
#![no_main]

use core::arch::asm;

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    let msg = b"Hola Mundo desde Puro Metal!\n";
    unsafe {
        // 1. Llamada al sistema: sys_write (1)
        // Escribe el mensaje en la salida estándar (pantalla)
        asm!(
            "syscall",
            in("rax") 1,                  // Número de syscall (1 = sys_write)
            in("rdi") 1,                  // Argumento 1: File descriptor (1 = stdout)
            in("rsi") msg.as_ptr(),       // Argumento 2: Puntero al inicio del mensaje
            in("rdx") msg.len(),          // Argumento 3: Longitud del mensaje en bytes
            out("rcx") _,                 // Registros que el kernel puede sobrescribir
            out("r11") _,
            clobber_abi("system")
        );

        // 2. Llamada al sistema: sys_exit (60)
        // Cierra el programa limpiamente con código de salida 0
        asm!(
            "syscall",
            in("rax") 60,                 // Número de syscall (60 = sys_exit)
            in("rdi") 0,                  // Argumento 1: Código de salida (0 = éxito)
            options(noreturn)             // Le dice a Rust que este bloque no retorna
        );
    }
}
