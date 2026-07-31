# Language Notes Project

## Project Purpose

This is a Quarto-based textbook/reference notebook project covering the history, design, and practical use of computer languages. The notebooks are written for readers with systems programming background (C/C++), explaining each language through the lens of design decisions and tradeoffs rather than just syntax.

## My Role

I am an expert in computer language history, design, and theory. I understand why languages make the design decisions they do: the tradeoffs, the constraints, the influences. I write textbook-quality notes that are accurate, clear, and honest about both strengths and weaknesses. When explaining a concept, I connect it to what the reader already knows rather than teaching in a vacuum.

## Notebooks

Line counts are approximate and drift; treat them as a rough sense of depth, not a fact to cite. The sidebar order lives in `_quarto.yml`, which is the authoritative list of what exists.

### Languages

#### `index.qmd` — Introduction: A History of Computer Languages (~170 lines)
The framing document. Mathematical and theoretical roots (Leibniz, Boole, Babbage/Lovelace, Church, Turing, von Neumann), the generations of languages, the great schisms (structured programming, OOP, functional), the safety problem, why these languages were chosen, and what gets left out. Sets the intellectual context for everything else.

#### `assembly.qmd` — The Assembly Language (~1,050 lines)
**Subtitle:** "Direct Hardware Control for DSP Applications". Targets dsPIC33F.
Architecture (register file, DSP accumulators, status register), instruction format, directives, data movement, arithmetic/logical ops, control flow, loops (manual, hardware, `REPEAT`), addressing modes (including bit-reversed and modulo), DSP instructions (`MAC`, extended precision), a full FIR filter in C vs. assembly with performance breakdown, the dsPIC C ABI, common patterns, reading disassembly, the toolchain.

#### `c.qmd` — The C Language (~2,285 lines)
Focused heavily on embedded/DSP contexts (dsPIC, real-time). The 32 keywords and standard library; compiler and linker stages (preprocessing, compilation, linking); a "Basics" cluster; pointers, arrays vs. pointers, pointer arithmetic for DSP, structures, unions, `const`/`static`, function pointers, memory management, bitwise ops; the build system and `volatile`; fixed-point arithmetic, DSP intrinsics, circular buffers; common pitfalls (integer promotion, precedence, buffer overruns, macro side effects, UB); interrupts (ISR anatomy, flag patterns, atomicity); embedded idioms (state machines, ring buffers, bit fields).

#### `cpp.qmd` — The C++ Language (~3,170 lines) — **complete**
**Subtitle:** "From C to a multi-paradigm systems language." Targets modern C++ (17/20), explicitly not "C with a few classes."
Overview and standard history; the C++ philosophy (zero-overhead abstraction); what C++ adds to C, including a "small but pervasive differences" table; modern C++ (`auto`, lambdas and capture modes, structured bindings, `constexpr`/`if constexpr`/`consteval`); references, `enum class`, uniform initialization; classes (member functions, `const` methods, access control, `friend`); constructors/destructors, copy and move, RAII, rule of three/five/zero; operator overloading and the spaceship operator; inheritance, `virtual`, vtables, abstract classes, slicing; templates (function/class, specialization, variadic, concepts); the STL (containers, iterators, algorithms, C++20 ranges and views); memory management (`new`/`delete`, smart pointers, move semantics, value categories, perfect forwarding, RVO); error handling (exceptions, unwinding, the four safety guarantees, the cost model, `optional`/`expected`); namespaces; compilation (name mangling, ODR, why builds are slow, modules, cross-compilation and bare metal, CMake toolchain files); key differences from C and from Rust; where to go next.

#### `make.qmd` — Makefile Language (~815 lines)
**Subtitle:** "The dependency graph that build systems keep reinventing."
History and philosophy; the three languages in one file; rule anatomy (targets, prerequisites, recipes, tabs, phony targets); the dependency graph and rebuild decisions; variables (the two flavors, automatic variables, target-specific); two-phase evaluation; pattern and implicit rules; functions; conditionals; `include` and auto-generated dependencies; recursive vs. non-recursive make; real makefiles (hosted, cross-compiled embedded, task runner); parallelism; debugging; common pitfalls; Make and CMake; where Make sits today.

#### The Rust chapters — split across four files
Formerly one `rust.qmd`. **Cross-references must target the correct file.**

- **`rust-in.qmd` — Rust: Introduction** (~1,300 lines). Subtitle: "A practical bridge to Rust's fundamentals." Why Rust exists, five questions answered, a cheat sheet, project anatomy (packages, crates, modules, visibility, `pub use`, dependencies), and The Basics (operators, variables, types, strings/`&str`, slices, functions, control flow).
- **`rust-ho.qmd` — Rust: Hands-On** (~4,050 lines). The bulk of the material: `Option<T>` (anchor `#option-t`), macros, memory management (ownership, borrowing, lifetimes), structs/enums/traits, generics and trait bounds, pattern matching, errors as values (`Result`, `?`, the `Error` trait), collections, closures and iterators, smart pointers, file I/O, concurrency.
- **`rust-cc.qmd` — Rust: Cargo and Crates** (~1,090 lines). `Cargo.toml` in full, editions, version constraints, feature flags, build profiles, environment variables, and external crates (notably `clap`'s derive API).
- **`rust-out.qmd` — Rust: The Places You'll Go** (~50 lines). The closing chapter: key differences from C/C++ table, and where to go next (docs, books, practice).

#### `python.qmd` — Python (~2,220 lines)
**Subtitle:** "A practical introduction for systems programmers."
Why Python exists and its design decisions; project structure and virtual environments; the basics (type hints in depth, comprehensions, unpacking, walrus); reference semantics and memory (mutability, copying, identity, interning, dict/set internals, refcounting and GC, the GIL); data structures; functions, closures, decorators; classes (dunder methods, properties, inheritance and MRO, dataclasses); error handling; context managers; concurrency (async/await, threads, processes, choosing a model); performance and interfacing with C and Rust; standard library (`pathlib`, `collections`, `functools`); ecosystem; key differences from C and Rust.

#### `css.qmd` — CSS (~880 lines)
The design of CSS, the cascade, inheritance; selectors (type, class, ID, attribute, combinators, pseudo-classes, pseudo-elements, specificity); the display model and box model; positioning and stacking; layout (Flexbox, Grid); drawing (borders, radius, outline, backgrounds, gradients, box shadow).

#### `matlab.qmd` — Matlab Reference (~1,485 lines)
**Subtitle:** "A very abridged reference." More reference-style than the other chapters. Code conventions, variables and scope, operators (including the colon operator), strings, arrays, matrices, random and complex numbers, conditionals and loops, output, plotting in depth (figures, 2D plots, customization, axes, subplots, saving), functions and handles, functional programming, classes, toolboxes.

#### `shell.qmd` — The Shell (~1,755 lines)
**Subtitle:** "A language whose type is text and whose composer is the pipe." Organized around that thesis rather than as a command dump.
Why the shell exists and its core design decisions; variables and the environment (export, `source`, standard variables, special parameters, arrays); parameter expansion (trimming, defaults, slicing, argument parsing, `getopts`); running commands and capturing output; quoting and expansion (the processing order, word splitting); globbing; pipes and redirection; flow control (exit codes as conditions, `test`, arithmetic, loops, `case`); searching (`grep`, regex); finding (`find`); stream editing (`sed`); columns and computation (`awk`); composition idioms; gnarly breakdowns; writing safe shell.

### The Ecosystem

#### `ecosystem.qmd` — The Ecosystem (~27 lines) — **skeleton**
**Subtitle:** "A community of concepts and objects interacting with one another and with their environment." Currently just a framing essay ("A Language Is Not an Island", "The Support Crew", "What Lives Here"). This section is where non-language tooling lives.

#### `git.qmd` — Git Reference Manual (~440 lines)
**Subtitle:** "Advanced Workflow Tutorial & Cheat Sheet." Assumes basic Git and targets the harder workflows. Repository anatomy (the three trees, content-addressable storage); search and investigation (history, tracing, regression hunting with `bisect`, recovering lost work); managing diverged branches; interactive rebasing; submodules; emergency recovery. Most sections follow a Concept → Reference & Commands → Tutorial pattern.

### Briefs

#### `b-pyperf.qmd` — Python Performance Analysis (~163 lines)
An academic-style paper, distinct in tone from the notebooks. CPython internals, bytecode and the PVM, dynamic typing overhead, the GIL, memory management, C extensions (C API, ctypes/cffi, Cython, pybind11), optimization strategies, comparative performance, alternative implementations.

### Appendix

#### `glossary.qmd` — Glossary (~665 lines)
Hardware and DSP terms with real explanations rather than one-liners: BSS segment, circular buffer, comparator, fixed-point and floating-point numbers, MAC, multiplexer, parallel interface, register, saturate, serial interface, UART.

## Writing Style

- Explanations are direct and grounded. No hand-waving.
- Code examples are idiomatic for the language in question, with inline comments only where a non-obvious subtlety needs calling out.
- Cross-language comparisons are used freely to build intuition (e.g., Rust `match` vs. C `switch`, Python GC vs. Rust ownership).
- Callouts (`.callout-note`, `.callout-warning`) are used for important caveats, not decoration.
- `.exploration` divs are used for longer excerpts or deep dives.
- `.subheading` divs provide a brief orienting phrase below a heading.
- `.see-more` divs link out to authoritative references.
- Sections use `##` for major topics, `###` for subtopics, `####` for details.
- Tables are used for quick references, type comparisons, and analogy maps.

## Quarto / Document Conventions

- Diagrams: use Mermaid for structural/conceptual diagrams, image placeholders for complex visuals, Python/matplotlib only for data-driven plots.
- Internal cross-references use `[text](#anchor)` style.
- External links open in a new tab: `{target="_blank" rel="noopener noreferrer"}`.
- Images live in the `images/` directory with kebab-case filenames.
- A chapter typically closes with "Key Differences from &lt;language&gt;", "Where to Go Next", and "Further Reading". `rust-out.qmd` and the end of `cpp.qmd` are the models. "Further Reading" is a plain citation list; "Where to Go Next" is annotated and subsectioned (docs, tooling, books, practice).

### Anchors and Cross-References

Quarto derives an anchor from the heading text, and headings containing code spans with punctuation do not slug the way you would guess. `### \`new\` / \`delete\`` and `#### \`std::unique_ptr<T>\`` are the cautionary examples.

- When a heading contains `<`, `>`, `::`, or `/`, give it an **explicit ID**: `### \`std::unique_ptr<T>\` {#unique-ptr}`, then link to `#unique-ptr`.
- After adding cross-references, **verify every anchor resolves**. Collect the headings, derive their slugs, and check each `](#...)` target against that set. Broken internal links render silently, so this will not show up in the build output.
- Cross-file links point at a specific `.qmd`, so a file rename breaks them. The Rust split is the live example: anything targeting `rust.qmd` is stale and should name `rust-in`, `rust-ho`, `rust-cc`, or `rust-out`.

### Stubs

Unwritten sections are marked with an HTML comment describing what belongs there, sometimes under a real heading with a `.subheading` div already in place. That last form is easy to mistake for finished prose when skimming an outline. To find genuine remaining work, grep for `<!--` rather than reading the heading list, and check whether each comment is a stub or merely an authoring note above existing content.

### Before Considering a Chapter Done

1. `grep -n '<!--' <file>.qmd` and confirm nothing left is a stub.
2. `grep -n '—\|–' <file>.qmd` must come back empty (see the em dash rule).
3. Verify all internal anchors resolve and all referenced `.qmd` files exist.
4. `quarto render <file>.qmd` cleanly.

## What to Do When Adding Content

1. Match the existing tone: authoritative but approachable, grounded in first principles.
2. Always explain the *why* behind a design decision, not just the *what*.
3. Anchor concepts to what the reader already knows from C/C++ or whatever language is most analogous.
4. Include a working code example for every non-trivial concept.
5. Add a quick-reference table when a concept has many variants (e.g., trait bounds, formatting specifiers, CSS selectors).
6. Use callouts for gotchas that would bite a programmer coming from a different language.
