import CModulesLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : CModulesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CModulesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse