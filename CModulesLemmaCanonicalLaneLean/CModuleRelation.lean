import canonicalLaneMathlib.AdmissibleClass
import CModulesLemmaCanonicalLaneLean.CModuleNotation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Relation Definitions
Defines relation structures for C-modules, analogous to RicciFlowPDE.
-/

structure CModuleRelation (C : CModuleNotation) where
  relationType : Type u
  source : C.M → C.M → Prop
  target : C.M → Prop
  preservesStructure : Prop
  respectsCAction : Prop

structure CModuleRelationEvidence {C : CModuleNotation} (R : CModuleRelation C) where
  preservesStructureClosed : R.preservesStructure
  respectsCActionClosed : R.respectsCAction

def CModuleRelationClosed {C : CModuleNotation} (R : CModuleRelation C) : Prop :=
  R.preservesStructure ∧ R.respectsCAction

theorem c_module_relation_closed_from_evidence
    {C : CModuleNotation} (R : CModuleRelation C) (E : CModuleRelationEvidence R) :
    CModuleRelationClosed R := by
  exact And.intro E.preservesStructureClosed E.respectsCActionClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse