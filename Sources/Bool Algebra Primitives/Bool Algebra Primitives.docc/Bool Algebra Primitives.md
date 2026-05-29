# ``Bool_Algebra_Primitives``

@Metadata {
    @DisplayName("Bool Algebra Primitives")
    @TitleHeading("Swift Primitives")
}

Bool's algebraic structure: monoid, semiring, and semilattice witnesses for `Bool`.

## Overview

This package is the integration bridge between `Swift.Bool` (the recipient domain)
and `swift-algebra-primitives` (the structure provider — `Algebra.Monoid`,
`Algebra.Semiring`, `Algebra.Semilattice`). It collects the scattered
`Algebra.X<Bool>` witnesses so the algebra substrate stays pure while `Bool` gains
its canonical algebraic structure.

## Topics

### Monoid Witnesses

- ``Algebra/Monoid/conjunction``
- ``Algebra/Monoid/disjunction``

### Semiring Witness

- ``Algebra/Semiring/boolean``

### Semilattice Witnesses

- ``Algebra/Semilattice/disjunction``
- ``Algebra/Semilattice/conjunction``
