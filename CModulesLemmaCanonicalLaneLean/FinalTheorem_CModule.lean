import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def ConstrainedCModuleLemmaClosure (A : CModuleAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_c_module_lemma_endgame (A : CModuleAdmissibleClass) :
    ConstrainedCModuleLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse