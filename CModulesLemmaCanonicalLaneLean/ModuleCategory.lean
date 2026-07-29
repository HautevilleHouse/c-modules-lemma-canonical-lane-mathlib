import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ModuleCategory {R : CommutativeRingPackage} where
  objectType : Type v
  moduleStructure : R.carrier → objectType → objectType
  moduleAxioms : Prop
  homomorphisms : Type w
  compositionLaw : Prop

structure ModuleCategoryEvidence {R : CommutativeRingPackage} (M : ModuleCategory R) where
  moduleAxiomsClosed : M.moduleAxioms
  compositionLawClosed : M.compositionLaw

def ModuleCategoryClosed {R : CommutativeRingPackage} (M : ModuleCategory R) : Prop :=
  M.moduleAxioms ∧ M.compositionLaw

theorem module_category_closed_from_evidence {R : CommutativeRingPackage} (M : ModuleCategory R) (E : ModuleCategoryEvidence M) :
    ModuleCategoryClosed M := by
  exact And.intro E.moduleAxiomsClosed E.compositionLawClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse