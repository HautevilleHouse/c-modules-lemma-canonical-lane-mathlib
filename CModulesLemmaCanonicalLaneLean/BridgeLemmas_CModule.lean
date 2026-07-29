import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def bridgeClosed (A : CModuleAdmissibleClass) : Prop :=
  CModuleWitnessClosed (CModuleAdmittedObject.mk A A.cyclicWitness)

theorem bridge_from_admissible_class (A : CModuleAdmissibleClass) :
    bridgeClosed A := by
  unfold bridgeClosed
  exact A.cyclicWitness

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse