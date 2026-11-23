# Laboratorios de Compiladores y Lenguajes — Primer Bimestre (2026-B)

**Escuela Politécnica Nacional (EPN)** — Facultad de Ingeniería de Sistemas (FIS)  
**Asignatura:** Compiladores y Lenguajes (GR1SW)  
**Integrantes:** Victoria Yureisy Torres Quiñonez, Josue Astudillo, Dannae Martinez 

---

## Descripción 

Este repositorio recopila las prácticas de laboratorio correspondientes a la primera fase de un compilador: el **análisis léxico (*scanner*)**, implementadas mediante el generador **Lex/Flex** y compiladas con **GCC** sobre entornos GNU/Linux (Ubuntu).

Cada práctica aborda el diseño de expresiones regulares, la transformación de patrones en Autómatas Finitos Deterministas (AFD) y la gestión de casos límite (prioridad de reglas, coincidencia más larga y recuperación de errores léxicos), acompañadas de sus respectivos casos de prueba (`entrada.txt`, `salida.txt`) y mini informes técnicos en formato PDF.

---

## Resumen de Contenidos

* **`IB/UNO` – `IB/CUATRO`:** Fundamentos de la estructura en tres secciones de Flex (`%{ ... %}`, `%% ... %%`, subrutinas de usuario), flujo de compilación (`lex` + `gcc -lfl`) y reconocimiento de patrones básicos.
* **`IB/CINCO` (`cinco.l`):** Contador de clases de caracteres (letras mayúsculas, minúsculas, dígitos y espacios en blanco).
* **`IB/SEIS` (`seis.l`):** Reconocedor de palabras reservadas (`if`, `else`, `while`, `int`), identificadores y números enteros con emisión de pares *token-lexema*.
* **`IB/SIETE` (`siete.l`):** Identificador de operadores aritméticos y relacionales simples y compuestos.
* **`IB/OCHO` (`ocho.l`):** Normalización léxica mediante conversión de letras mayúsculas a minúsculas (`tolower`) preservando el resto del flujo.
* **`IB/NUEVE` (`nueve.l`):** Contador de frecuencia de dígitos decimales (`0–9`) con salida tabulada.
* **`IB/DIEZ` (`diez.l`):** Validador léxico de direcciones de correo electrónico y rechazo de cadenas mal formadas.
* **Prácticas complementarias (Semana 06):** Procesamiento de listas separadas por comas con detección de errores léxicos completos y delimitación frente al análisis sintáctico.

---

## Video Debate Grupal: Decisiones Reales en el Diseño Léxico

Como complemento práctico a las implementaciones en Flex, el equipo realizó un debate técnico analizando tres problemas reales que enfrenta todo diseñador de compiladores durante la etapa de análisis léxico:

1. **Normalización léxica (Ejercicio 4):** Cuándo conviene unificar mayúsculas y minúsculas (lenguajes *case-insensitive* como SQL o Pascal) y qué riesgos implica hacerlo sin contexto en cadenas literales o lenguajes *case-sensitive* (C, Java).
2. **Conflictos entre palabras reservadas e identificadores (Ejercicio 2):** Cómo Flex resuelve ambigüedades aplicando primero la regla de **coincidencia más larga (*maximal munch*)** y usando el **orden de declaración** únicamente para desempatar longitudes iguales, además del impacto en el tamaño del AFD al escalar el lenguaje.
3. **Recuperación de errores y frontera con el análisis sintáctico (Ejercicio 9):** Por qué el uso de clases de caracteres negadas evita fragmentar errores léxicos (como `3.14` o `2a`) y dónde termina la responsabilidad de Flex (`yylex`) para dar paso a la validación gramatical en YACC/Bison (`yyparse`).

📺 **Ver video completo del debate en Google Drive:**  
[Debate Grupal — Ejercicios de Laboratorio en Flex (Semana 06)](https://drive.google.com/file/d/1lTakdCEcCiOPKDWyz--GO-5MvI8iTSUu/view?usp=drive_link)

---

## Instrucciones de Compilación y Ejecución

Para reproducir cualquiera de los ejercicios en un entorno Linux con `flex` y `gcc` instalados:

```bash
# 1. Generar el código fuente en C desde la especificación léxica
flex archivo.l

# 2. Compilar el analizador léxico enlazando la librería de Flex
gcc lex.yy.c -lfl

# 3. Ejecutar redirigiendo la entrada y salida estándar
./a.out < entrada.txt > salida.txt
