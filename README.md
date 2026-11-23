# Laboratorios de Compiladores y Lenguajes — Primer Bimestre (2026-B)

**Escuela Politécnica Nacional (EPN)** — Facultad de Ingeniería de Sistemas (FIS)  
**Asignatura:** Compiladores y Lenguajes (GR1SW)  
**Integrantes:** Victoria Yureisy Torres Quiñonez, Josue Astudillo, Dannae Martinez 

---

## Descripción

Este repositorio recopila las **13 prácticas de laboratorio** correspondientes a la primera fase de un compilador: el **análisis léxico (*scanner*)**, implementadas mediante el generador **Lex/Flex** y compiladas con **GCC** sobre entornos GNU/Linux (Ubuntu).

A lo largo de estas prácticas se aborda el diseño de expresiones regulares, la transformación de patrones en Autómatas Finitos Deterministas (AFD), la conversión entre sistemas numéricos y la gestión de casos límite (prioridad de reglas, coincidencia más larga y recuperación de errores léxicos), acompañadas de sus casos de prueba (`entrada.txt`, `salida.txt`) y mini informes técnicos en formato PDF.

---

## Resumen de Contenidos (13 Prácticas)

### Semana 04 — Fundamentos y estructura de Lex/Flex (4 ejercicios)
* **`IB/UNO` (`uno.l`):** Estructura mínima de un programa en Flex (`%%`), comportamiento por defecto de eco y flujo básico de compilación (`lex` + `gcc -lfl`).
* **`IB/DOS` (`dos.l`):** Reconocimiento de comandos y palabras clave básicas (`inicio`, `pare`).
* **`IB/TRES` (`tres.l`):** Contador de líneas y caracteres mediante variables acumuladoras en C y lectura hasta fin de archivo (EOF).
* **`IB/CUATRO` (`cuatro.l`):** Reconocimiento de números enteros, identificadores y números reales en notación científica/exponencial.

### Semana 06 — Implementación de analizadores léxicos (9 ejercicios)
* **`IB/CINCO` (`cinco.l` — Ej. 1):** Contador independiente de clases de caracteres (letras mayúsculas, letras minúsculas, dígitos y espacios en blanco).
* **`IB/SEIS` (`seis.l` — Ej. 2):** Reconocedor de palabras reservadas (`if`, `else`, `while`, `int`), identificadores y números enteros con emisión de pares *token-lexema*.
* **`IB/SIETE` (`siete.l` — Ej. 3):** Identificador de operadores aritméticos (`+`, `-`, `*`, `/`) y relacionales simples y compuestos (`<`, `<=`, `>`, `>=`, `==`, `!=`).
* **`IB/OCHO` (`ocho.l` — Ej. 4):** Normalización léxica mediante conversión de letras mayúsculas a minúsculas (`tolower`) conservando intacto el resto del flujo.
* **`IB/NUEVE` (`nueve.l` — Ej. 5):** Contador de frecuencia de aparición de cada dígito decimal (`0–9`) con presentación de resultados en tabla.
* **`IB/DIEZ` (`diez.l` — Ej. 6):** Detector de patrones simples de correo electrónico (ej. `nombre@dominio.com`) como tokens válidos y rechazo de formatos inválidos.
* **`IB/ONCE` (`once.l` — Ej. 7):** Reconocedor de números binarios (secuencias de `0` y `1`) con conversión a su valor decimal equivalente.
* **`IB/DOCE` (`doce.l` — Ej. 8):** Reconocedor de números hexadecimales con prefijo (`0x` / `0X`, ej. `0x1A3F`) y conversión a su valor decimal.
* **`IB/TRECE` (`trece.l` — Ej. 9):** Procesador de listas de elementos separados por comas (identificadores o números enteros) con reporte de errores léxicos completos sin detener el análisis.

---

## Video Debate Grupal: Decisiones Reales en el Diseño Léxico

Como complemento práctico a las implementaciones en Flex, el equipo realizó un debate técnico analizando tres problemas reales que enfrenta todo diseñador de compiladores durante la etapa de análisis léxico:

1. **Normalización léxica (Ejercicio 4 / `ocho.l`):** Cuándo conviene unificar mayúsculas y minúsculas (lenguajes *case-insensitive* como SQL o Pascal) y qué riesgos implica hacerlo sin contexto en cadenas literales o lenguajes *case-sensitive* (C, Java).
2. **Conflictos entre palabras reservadas e identificadores (Ejercicio 2 / `seis.l`):** Cómo Flex resuelve ambigüedades aplicando primero la regla de **coincidencia más larga (*maximal munch*)** y usando el **orden de declaración** únicamente para desempatar longitudes iguales, además del impacto en el tamaño del AFD al escalar el lenguaje.
3. **Recuperación de errores y frontera con el análisis sintáctico (Ejercicio 9 / `trece.l`):** Por qué el uso de clases de caracteres negadas evita fragmentar errores léxicos (como `3.14` o `2a`) y dónde termina la responsabilidad de Flex (`yylex`) para dar paso a la validación gramatical en YACC/Bison (`yyparse`).

📺 **Ver video completo del debate en Google Drive:**  
[Debate Grupal — Ejercicios de Laboratorio en Flex (Semana 06)](https://drive.google.com/file/d/1lTakdCEcCiOPKDWyz--GO-5MvI8iTSUu/view?usp=drive_link)

---

## Instrucciones de Compilación y Ejecución

Para reproducir cualquiera de las 13 prácticas en un entorno Linux con `flex` y `gcc` instalados:

```bash
# 1. Generar el código fuente en C desde la especificación léxica
flex archivo.l

# 2. Compilar el analizador léxico enlazando la librería de Flex
gcc lex.yy.c -lfl

# 3. Ejecutar redirigiendo la entrada y salida estándar
./a.out < entrada.txt > salida.txt
