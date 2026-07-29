import canonicalLaneMathlib.AdmissibleClass
import CModulesLemmaCanonicalLaneLean.CModuleNotation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Submodule Package
Defines submodule structures for C-modules, analogous to ShortTimeExistence.
-/

structure CModuleSubmodule (C : CModuleNotation) where
  carrier : Set C.M
  closedUnderAddition : Prop
  closedUnderCAction : Prop
  submoduleAxioms : Prop

structure CModuleSubmoduleEvidence {C : CModuleNotation} (S : CModuleSubmodule C) where
  closedUnderAdditionClosed : S.closedUnderAddition
  closedUnderCActionClosed : S.closedUnderCAction
  submoduleAxiomsClosed : S.submoduleAxioms

def CModuleSubmoduleClosed {C : CModuleNotation} (S : CModuleSubmodule C) : Prop :=
  S.closedUnderAddition ∧ S.closedUnderCAction ∧ S.submoduleAxioms

theorem c_module_submodule_closed_from_evidence
    {C : CModuleNotation} (S : CModuleSubmodule C) (E : CModuleSubmoduleEvidence S) :
    CModuleSubmoduleClosed S := by
  exact And.intro E.closedUnderAdditionClosed
    (And.intro E.closedUnderCActionClosed E.submoduleAxiomsClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse