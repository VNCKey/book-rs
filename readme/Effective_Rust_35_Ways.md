# Resumen: Effective Rust (David Drysdale, 2024)

Este documento sintetiza los "35 consejos específicos" para mejorar el código en Rust, organizados por áreas temáticas. Este libro es el equivalente en Rust al clásico "Effective C++", enfocándose en decisiones de diseño y mejores prácticas.

---

## 🛠️ Capítulo 1: Tipos (Types)

1.  **Usa el sistema de tipos para expresar conceptos:** Evita "stringly-typed" APIs. Crea tipos específicos para evitar ambigüedades.
2.  **Usa `Option` y `Result` en lugar de valores mágicos o errores:** Domina la propagación de errores con `?`.
3.  **Prefiere `match` sobre `if let` o `unwrap`:** Asegura que cubres todos los casos (exhaustividad).
4.  **Usa tipos compuestos (`Structs` y `Enums`) para modelar datos:** Aprovecha los enums con datos internos.
5.  **Entiende los tipos de casting:** Diferencia entre `as` y los traits `From`/`Into` y `TryFrom`/`TryInto`.
6.  **Usa Newtypes para encapsulamiento y seguridad:** Protege tipos simples envolviéndolos en structs para evitar confusiones de unidades o IDs.

---

## 🏗️ Capítulo 2: Traits (Rasgos)

7.  **Usa los traits de la biblioteca estándar:** Implementa `Debug`, `Clone`, `Default`, `PartialEq`, etc.
8.  **Diferencia entre tipos genéricos y objetos de trait:** Cuándo usar monomorfización (`T: Trait`) vs despacho dinámico (`dyn Trait`).
9.  **Usa traits para definir comportamiento compartido:** No solo para interfaces, sino para extender tipos existentes.
10. **Entiende cuándo usar `impl Trait`:** Útil para retornar iteradores o cierres complejos sin exponer el tipo real.

---

## 🧠 Capítulo 3: Conceptos Fundamentales (Concepts)

11. **Domina el Ownership y Borrowing:** La base de la seguridad en Rust.
12. **Entiende los Lifetimes:** Aprende a leer las anotaciones y cuándo el compilador las infiere (elisión).
13. **Usa Smart Pointers con propósito:** `Box` para heap, `Rc`/`Arc` para propiedad compartida, `RefCell` para mutabilidad interior.
14. **Usa `Iteradores` de forma efectiva:** Prefiere el estilo declarativo sobre los bucles manuales para evitar errores de índice.

---

## 🎨 Capítulo 4: Diseño (Design)

15. **Diseña interfaces fáciles de usar y difíciles de usar mal:** Aplica los principios de "Type-Driven Design".
16. **Usa el patrón Builder para objetos complejos:** Maneja múltiples parámetros opcionales de forma limpia.
17. **Aprovecha la visibilidad (`pub`, `pub(crate)`) para ocultar detalles:** Mantén tu API pública pequeña.
18. **Prefiere la composición sobre la herencia:** Rust no tiene herencia de clases; usa traits y wrappers.

---

## ⚡ Capítulo 5: Herramientas y Ecosistema

19. **Usa Cargo de forma experta:** Entiende el `Cargo.lock`, las versiones SemVer y las workspaces.
20. **Documenta tu código con `rustdoc`:** Escribe ejemplos que funcionen como tests.
21. **Usa Clippy para mantener la calidad:** No ignores sus advertencias; son lecciones de Rust.
22. **Escribe tests efectivos:** Unitarios, de integración y de documentación.

---

## 🚀 Capítulo 6: Avanzado y Optimización

23. **Entiende Unsafe Rust:** Cuándo es necesario y cómo encapsularlo de forma segura.
24. **Aprovecha el FFI para hablar con C:** Crucial para librerías de sistema.
25. **Usa Macros con moderación:** Son potentes pero dificultan la lectura y depuración.
26. **Optimiza basándote en perfiles realistas:** No hagas optimización prematura.
27. **Domina Async Rust:** Entiende los costos del runtime y los bloqueos.

---

## 💡 Conclusiones del Autor
"Effective Rust" no se trata de conocer la sintaxis, sino de adoptar la mentalidad del lenguaje. La clave es dejar que el compilador trabaje por ti, usando el sistema de tipos para atrapar errores antes de que el código se ejecute.
