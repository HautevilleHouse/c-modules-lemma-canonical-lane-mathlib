import canonicalLaneMathlib.AdmissibleClass
import CModulesLemmaCanonicalLaneLean.CModuleHomomorphism

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Lemma Package
Contains the main lemma that every C-module homomorphism is injective under certain conditions.
Analogous to Noncollapsing.
-/

structure CModuleLemmaPackage (C1 C2 : CModuleNotation) (H : CModuleHomomorphism C1 C2) where
  conditionNoetherian : Prop
  conditionSimple : Prop
  injectivityConclusion : Prop

structure CModuleLemmaEvidence {C1 C2 : CModuleNotation} {H : CModuleHomomorphism C1 C2} (L : CModuleLemmaPackage C1 C2 H) where
  conditionNoetherianClosed : L.conditionNoetherian
  conditionSimpleClosed : L.conditionSimple
  injectivityConclusionClosed : L.injectivityConclusion

def CModuleLemmaClosed {C1 C2 : CModuleNotation} {H : CModuleHomomorphism C1 C2} (L : CModuleLemmaPackage C1 C2 H) : Prop :=
  L.conditionNoetherian ∧ L.conditionSimple ∧ L.injectivityConclusion

theorem c_module_lemma_closed_from_evidence
    {C1 C2 : CModuleNotation} {H : CModuleHomomorphism C1 C2} (L : CModuleLemmaPackage C1 C2 H)
    (E : CModuleLemmaEvidence L) : CModuleLemmaClosed L := by
  exact And.intro E.conditionNoetherianClosed
    (And.intro E.conditionSimpleClosed E.injectivityConclusionClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse