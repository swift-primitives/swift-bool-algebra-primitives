// Algebra.Semiring+Bool.swift

public import Algebra_Semiring_Primitives

/// Boolean OR/AND semiring.
///
/// Bool forms a commutative semiring under:
/// - Addition: OR (disjunction), identity: false
/// - Multiplication: AND (conjunction), identity: true
/// - Distributivity: a AND (b OR c) = (a AND b) OR (a AND c)
/// - Zero annihilation: false AND a = false
extension Algebra.Semiring.Commutative where Element == Bool {
    /// The Boolean OR/AND commutative semiring on `Bool`: addition is OR (zero `false`), multiplication is AND (one `true`).
    @inlinable
    public init() {
        self.init(
            semiring: .init(
                additive: .init(monoid: .init(identity: false, combining: { $0 || $1 })),
                multiplicative: .init(identity: true, combining: { $0 && $1 })
            )
        )
    }
}
