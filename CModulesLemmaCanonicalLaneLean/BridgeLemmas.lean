import CModulesLemmaCanonicalLaneLean.CModuleAdmissibility

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse