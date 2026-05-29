// Algebra.Semilattice+Bool.swift

public import Algebra_Semilattice_Primitives

/// Boolean semilattice witnesses.
///
/// `Bool` forms two distinct bounded semilattices: disjunction (∨) with
/// identity `false` (the OR semilattice), and conjunction (∧) with identity
/// `true` (the AND semilattice). Both are associative, commutative, and
/// idempotent — `b ∨ b == b` and `b ∧ b == b` for any Bool.
extension Algebra.Semilattice where Element == Bool {
    /// OR (disjunction) semilattice: identity is `false`, combining is `||`.
    /// Bottom (`false`) is below top (`true`) in the induced order.
    @inlinable
    public static var disjunction: Self {
        .init(identity: false, combining: { $0 || $1 })
    }

    /// AND (conjunction) semilattice: identity is `true`, combining is `&&`.
    /// Bottom (`true`) is above bottom-of-OR — note the dual orientation.
    @inlinable
    public static var conjunction: Self {
        .init(identity: true, combining: { $0 && $1 })
    }
}
