import CModulesLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def ConstrainedCModuleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cmodule_endgame (A : AdmissibleClass) :
    ConstrainedCModuleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse