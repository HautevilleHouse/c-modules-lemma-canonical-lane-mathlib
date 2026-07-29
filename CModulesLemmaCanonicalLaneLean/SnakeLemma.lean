import HautevilleHouse.CModulesLemmaCanonicalLaneLean.ShortExactSequence

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure SnakeLemmaDiagram {A B C A' B' C' : CModuleObject}
    (S : ShortExactSequence A B C) (S' : ShortExactSequence A' B' C') where
  α : A.carrier → A'.carrier
  β : B.carrier → B'.carrier
  γ : C.carrier → C'.carrier
  commutesLeft : ∀ x, g S (f S x) = 0 → g S' (β (f S x)) = 0
  commutesRight : ∀ x, g S' (β (f S x)) = γ (g S x)

structure SnakeLemmaPackage {A B C A' B' C' : CModuleObject}
    {S : ShortExactSequence A B C} {S' : ShortExactSequence A' B' C'}
    (D : SnakeLemmaDiagram S S') where
  kernelSequenceExact : Prop
  cokernelSequenceExact : Prop
  connectingHom : Prop
  longExactSequence : Prop

structure SnakeLemmaEvidence {A B C A' B' C' : CModuleObject}
    {S : ShortExactSequence A B C} {S' : ShortExactSequence A' B' C'}
    {D : SnakeLemmaDiagram S S'} (P : SnakeLemmaPackage D) where
  kernelSequenceExactClosed : P.kernelSequenceExact
  cokernelSequenceExactClosed : P.cokernelSequenceExact
  connectingHomClosed : P.connectingHom
  longExactSequenceClosed : P.longExactSequence

def SnakeLemmaClosed {A B C A' B' C' : CModuleObject}
    {S : ShortExactSequence A B C} {S' : ShortExactSequence A' B' C'}
    {D : SnakeLemmaDiagram S S'} (P : SnakeLemmaPackage D) : Prop :=
  P.kernelSequenceExact ∧ P.cokernelSequenceExact ∧ P.connectingHom ∧ P.longExactSequence

theorem snake_lemma_closed_from_evidence
    {A B C A' B' C' : CModuleObject}
    {S : ShortExactSequence A B C} {S' : ShortExactSequence A' B' C'}
    {D : SnakeLemmaDiagram S S'} (P : SnakeLemmaPackage D) (E : SnakeLemmaEvidence P) :
    SnakeLemmaClosed P := by
  exact And.intro E.kernelSequenceExactClosed
    (And.intro E.cokernelSequenceExactClosed
      (And.intro E.connectingHomClosed E.longExactSequenceClosed))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse