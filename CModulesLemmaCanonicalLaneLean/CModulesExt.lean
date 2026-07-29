import CModulesLemmaCanonicalLaneLean.AdmissibleClass

/-!
# C-Modules Extension Package
-/

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModulesExtensionPackage (A : AdmissibleClass) where
  extensionMap : Type u
  moduleAction : Prop
  cocycleCondition : Prop
  functoriality : Prop

structure CModulesExtensionEvidence {A : AdmissibleClass} (E : CModulesExtensionPackage A) where
  moduleActionClosed : E.moduleAction
  cocycleConditionClosed : E.cocycleCondition
  functorialityClosed : E.functoriality

def CModulesExtensionClosed {A : AdmissibleClass} (E : CModulesExtensionPackage A) : Prop :=
  E.moduleAction ∧ E.cocycleCondition ∧ E.functoriality

theorem cm_extension_closed_from_evidence
    {A : AdmissibleClass} (E : CModulesExtensionPackage A)
    (Ev : CModulesExtensionEvidence E) : CModulesExtensionClosed E := by
  exact And.intro Ev.moduleActionClosed
    (And.intro Ev.cocycleConditionClosed Ev.functorialityClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse