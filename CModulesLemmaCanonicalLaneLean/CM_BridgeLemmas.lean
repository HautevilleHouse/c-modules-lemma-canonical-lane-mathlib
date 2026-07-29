import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def bridgeClosed (A : CM_AdmissibleClass) : Prop :=
  CM_WitnessClosed A.object

theorem bridge_from_admissible_class (A : CM_AdmissibleClass) : bridgeClosed A := by
  exact CM_bridge_from_admissible_class A

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse