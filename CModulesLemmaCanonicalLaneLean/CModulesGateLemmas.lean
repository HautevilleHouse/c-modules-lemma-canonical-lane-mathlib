import CModulesLemmaCanonicalLaneLean.CModulesBridgeLemmas

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse