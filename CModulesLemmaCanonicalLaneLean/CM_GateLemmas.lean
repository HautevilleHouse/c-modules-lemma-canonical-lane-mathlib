import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def gateClosed (A : CM_AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : CM_AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse