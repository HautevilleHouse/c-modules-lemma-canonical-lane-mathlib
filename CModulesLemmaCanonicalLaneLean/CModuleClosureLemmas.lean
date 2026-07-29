import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleFoundation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CModuleClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse