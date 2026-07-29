import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleLemmaProofPackage {R : CommutativeRingPackage} {M : ModuleCategory R} where
  generator : M.objectType
  cyclicCondition : ∀ x : M.objectType, ∃ r : R.carrier, x = M.moduleStructure r generator
  annihilator : Set R.carrier
  annihilatorIsIdeal : Prop
  isomorphismTheorem : Prop

structure CModuleLemmaEvidence {R : CommutativeRingPackage} {M : ModuleCategory R} (P : CModuleLemmaProofPackage R M) where
  cyclicConditionClosed : P.cyclicCondition
  annihilatorIsIdealClosed : P.annihilatorIsIdeal
  isomorphismTheoremClosed : P.isomorphismTheorem

def CModuleLemmaClosed {R : CommutativeRingPackage} {M : ModuleCategory R} (P : CModuleLemmaProofPackage R M) : Prop :=
  P.cyclicCondition ∧ P.annihilatorIsIdeal ∧ P.isomorphismTheorem

theorem c_module_lemma_closed_from_evidence {R : CommutativeRingPackage} {M : ModuleCategory R} (P : CModuleLemmaProofPackage R M) (E : CModuleLemmaEvidence P) :
    CModuleLemmaClosed P := by
  exact And.intro E.cyclicConditionClosed (And.intro E.annihilatorIsIdealClosed E.isomorphismTheoremClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse