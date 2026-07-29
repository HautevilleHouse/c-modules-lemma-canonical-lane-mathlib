import canonicalLaneMathlib.AdmissibleClass
import CModulesLemmaCanonicalLaneLean.CModuleHomomorphism

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Category Package
Defines the category of C-modules, analogous to SingularityModels.
-/

structure CModuleCategory where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : (A : objects) → morphisms A A
  composition : ∀ {A B C : objects}, morphisms A B → morphisms B C → morphisms A C
  associativity : Prop
  identityLaw : Prop

structure CModuleCategoryEvidence (C : CModuleCategory) where
  associativityClosed : C.associativity
  identityLawClosed : C.identityLaw

def CModuleCategoryClosed (C : CModuleCategory) : Prop :=
  C.associativity ∧ C.identityLaw

theorem c_module_category_closed_from_evidence
    (C : CModuleCategory) (E : CModuleCategoryEvidence C) :
    CModuleCategoryClosed C := by
  exact And.intro E.associativityClosed E.identityLawClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse