import Bool_Algebra_Primitives
import Testing

@Suite("Bool Algebra")
struct BoolAlgebraTests {
    @Suite struct Monoid {}
    @Suite struct Semiring {}
    @Suite struct Semilattice {}
}

// MARK: - Monoid

extension BoolAlgebraTests.Monoid {
    @Test
    func `conjunction monoid has identity true and combines with AND`() {
        let m = Algebra.Monoid<Bool>.conjunction
        #expect(m.identity == true)
        #expect(m.combining(true, true) == true)
        #expect(m.combining(true, false) == false)
        #expect(m.combining(false, false) == false)
    }

    @Test
    func `disjunction monoid has identity false and combines with OR`() {
        let m = Algebra.Monoid<Bool>.disjunction
        #expect(m.identity == false)
        #expect(m.combining(false, false) == false)
        #expect(m.combining(true, false) == true)
        #expect(m.combining(true, true) == true)
    }
}

// MARK: - Semiring

extension BoolAlgebraTests.Semiring {
    @Test
    func `boolean semiring zero is false and one is true`() {
        let sr = Algebra.Semiring<Bool>.boolean
        #expect(sr.zero == false)
        #expect(sr.one == true)
    }

    @Test
    func `boolean semiring adds with OR and multiplies with AND`() {
        let sr = Algebra.Semiring<Bool>.boolean
        #expect(sr.adding(false, true) == true)
        #expect(sr.adding(false, false) == false)
        #expect(sr.multiplying(true, true) == true)
        #expect(sr.multiplying(true, false) == false)
    }
}

// MARK: - Semilattice

extension BoolAlgebraTests.Semilattice {
    @Test
    func `disjunction semilattice has identity false`() {
        let or = Algebra.Semilattice<Bool>.disjunction
        #expect(or.identity == false)
        #expect(or.combining(true, false) == true)
        #expect(or.combining(false, false) == false)
    }

    @Test
    func `conjunction semilattice has identity true`() {
        let and = Algebra.Semilattice<Bool>.conjunction
        #expect(and.identity == true)
        #expect(and.combining(true, false) == false)
        #expect(and.combining(true, true) == true)
    }

    @Test
    func `disjunction is idempotent`() {
        let or = Algebra.Semilattice<Bool>.disjunction
        #expect(or.combining(true, true) == true)
        #expect(or.combining(false, false) == false)
    }

    @Test
    func `callAsFunction and join alias combining`() {
        let or = Algebra.Semilattice<Bool>.disjunction
        #expect(or(true, false) == or.combining(true, false))
        let and = Algebra.Semilattice<Bool>.conjunction
        #expect(and.join(true, true) == and.combining(true, true))
    }
}
