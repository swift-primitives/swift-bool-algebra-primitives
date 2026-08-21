public import Algebra_Lattice_Primitives

extension Algebra.Lattice where Element == Bool {

    @inlinable
    public init() {
        self.init(join: .disjunction, meet: .conjunction)
    }
}
