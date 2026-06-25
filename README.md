# Bool Algebra Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Algebra witnesses for `Bool` — the monoid, semiring, semilattice, and bounded-lattice structures that `Swift.Bool` forms under conjunction (`&&`) and disjunction (`||`).

---

## Quick Start

`Swift.Bool` already carries `&&`, `||`, and `!`. This package names the *algebraic structures* those operators form, so generic code that takes a monoid, semilattice, semiring, or lattice can be handed the `Bool` instance directly — no wrapper type, complement stays the native `!`.

```swift
import Bool_Algebra_Primitives

// The AND monoid: identity `true`, combining `&&`. Fold a sequence of flags
// to "are they all set?" without hand-writing the reduce seed and operator.
let all = Algebra.Monoid<Bool>.conjunction
let permitted = [true, true, false, true]
    .reduce(all.identity, all.callAsFunction)   // false

// The OR monoid mirrors it: identity `false`, combining `||` — "is any set?".
let any = Algebra.Monoid<Bool>.disjunction
let triggered = [false, false, true]
    .reduce(any.identity, any.callAsFunction)   // true
```

`Swift.Bool` IS the two-element Boolean algebra. The bounded lattice exposes join (∨), meet (∧), and the bounds; the same structure also appears as a commutative semiring.

```swift
import Bool_Algebra_Primitives

let lattice = Algebra.Lattice<Bool>()
lattice.join(false, true)   // true   — disjunction (∨)
lattice.meet(true, true)    // true   — conjunction (∧)
lattice.bottom              // false  — ⊥
lattice.top                 // true   — ⊤

// The same structure as a commutative semiring: + = OR, × = AND.
let semiring = Algebra.Semiring<Bool>.Commutative()
semiring.adding(false, true)        // true   (0 = false)
semiring.multiplying(true, false)   // false  (1 = true)
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-bool-algebra-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Bool Algebra Primitives", package: "swift-bool-algebra-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on the `Algebra` monoid / semiring / semilattice / lattice witnesses from `swift-algebra-primitives`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Bool Algebra Primitives` | `Sources/Bool Algebra Primitives/` | Bool's algebra witnesses: `Algebra.Monoid<Bool>` (`.conjunction` / `.disjunction`), `Algebra.Semilattice<Bool>` (`.disjunction` / `.conjunction`), `Algebra.Semiring<Bool>.Commutative()`, and the bounded `Algebra.Lattice<Bool>()`. Re-exports the underlying algebra modules. |
| `Bool Algebra Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
