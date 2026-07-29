import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CommutativeRingPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  ringAxioms : Prop
  commutativeMultiplication : Prop
  noZeroDivisors : Prop

structure CommutativeRingEvidence (R : CommutativeRingPackage) where
  ringAxiomsClosed : R.ringAxioms
  commutativeMultiplicationClosed : R.commutativeMultiplication
  noZeroDivisorsClosed : R.noZeroDivisors

def CommutativeRingClosed (R : CommutativeRingPackage) : Prop :=
  R.ringAxioms ∧ R.commutativeMultiplication ∧ R.noZeroDivisors

theorem commutative_ring_closed_from_evidence (R : CommutativeRingPackage) (E : CommutativeRingEvidence R) :
    CommutativeRingClosed R := by
  exact And.intro E.ringAxiomsClosed (And.intro E.commutativeMultiplicationClosed E.noZeroDivisorsClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse