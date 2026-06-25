// Algebra.Lattice+Bool.swift

public import Algebra_Lattice_Primitives

/// Boolean lattice witness.
///
/// `Bool` forms the two-element bounded lattice: join (∨) is disjunction with
/// bottom `false`, meet (∧) is conjunction with top `true`. It is the lattice
/// underlying the two-element Boolean algebra — `Swift.Bool` itself, with
/// complement supplied by the native `!`. Built from the disjunction and
/// conjunction semilattices.
extension Algebra.Lattice where Element == Bool {
    /// The unique `Bool` bounded lattice: join is disjunction (bottom `false`), meet is conjunction (top `true`).
    @inlinable
    public init() {
        self.init(join: .disjunction, meet: .conjunction)
    }
}
