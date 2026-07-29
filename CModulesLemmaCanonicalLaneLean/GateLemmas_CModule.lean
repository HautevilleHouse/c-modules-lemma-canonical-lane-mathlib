import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

def gateClosed (A : CModuleAdmissibleClass) : Prop :=
  A.ringAxioms ∨ A.moduleAxioms

theorem gate_from_admissible_class (A : CModuleAdmissibleClass) :
    gateClosed A := by
  left
  exact A.ringAxioms

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse