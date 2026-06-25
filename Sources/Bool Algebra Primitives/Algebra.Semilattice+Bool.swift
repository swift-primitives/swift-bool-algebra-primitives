// Algebra.Semilattice+Bool.swift

public import Algebra_Semilattice_Primitives

/// Boolean semilattice witnesses.
///
/// `Bool` forms two distinct bounded semilattices: disjunction (∨) with
/// identity `false` (the OR semilattice), and conjunction (∧) with identity
/// `true` (the AND semilattice). Both are associative, commutative, and
/// idempotent — `b ∨ b == b` and `b ∧ b == b` for every `Bool`.
extension Algebra.Semilattice where Element == Bool {
    /// OR (disjunction) semilattice: identity is `false`, combining is `||`.
    ///
    /// `false` is the bottom of the induced order, below the top `true`.
    @inlinable
    public static var disjunction: Self {
        .init(identity: false, combining: { $0 || $1 })
    }

    /// AND (conjunction) semilattice: identity is `true`, combining is `&&`.
    ///
    /// `true` is the top of the induced order — the dual orientation to disjunction.
    @inlinable
    public static var conjunction: Self {
        .init(identity: true, combining: { $0 && $1 })
    }
}
