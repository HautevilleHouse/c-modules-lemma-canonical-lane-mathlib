import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleAdmissibleObject

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ShortExactSequence (A : CModuleObject) (B : CModuleObject) (C : CModuleObject) where
  f : A.carrier → B.carrier
  g : B.carrier → C.carrier
  exactAtB : Function.Injective f ∧ Function.Surjective g ∧ ∀ x, g (f x) = 0
  exactAtC : Function.Injective g

structure ShortExactSequencePackage {A B C : CModuleObject} (S : ShortExactSequence A B C) where
  kernelSubmodule : Prop
  quotientModule : Prop
  isomorphismTheorem : Prop

structure ShortExactSequenceEvidence {A B C : CModuleObject} {S : ShortExactSequence A B C}
    (P : ShortExactSequencePackage S) where
  kernelSubmoduleClosed : P.kernelSubmodule
  quotientModuleClosed : P.quotientModule
  isomorphismTheoremClosed : P.isomorphismTheorem

def ShortExactSequenceClosed {A B C : CModuleObject} {S : ShortExactSequence A B C}
    (P : ShortExactSequencePackage S) : Prop :=
  P.kernelSubmodule ∧ P.quotientModule ∧ P.isomorphismTheorem

theorem short_exact_sequence_closed_from_evidence
    {A B C : CModuleObject} {S : ShortExactSequence A B C}
    (P : ShortExactSequencePackage S) (E : ShortExactSequenceEvidence P) :
    ShortExactSequenceClosed P := by
  exact And.intro E.kernelSubmoduleClosed (And.intro E.quotientModuleClosed E.isomorphismTheoremClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse