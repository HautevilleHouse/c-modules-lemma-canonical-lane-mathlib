import CModulesLemmaCanonicalLaneLean.CModulesGateLemmas

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def ConstrainedCModulesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_c_modules_endgame (A : AdmissibleClass) :
    ConstrainedCModulesClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse