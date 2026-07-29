import CModulesLemmaCanonicalLaneLean.CModulesAdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CModulesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse