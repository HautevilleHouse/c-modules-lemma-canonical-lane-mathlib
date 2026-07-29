import CModulesLemmaCanonicalLaneLean.HilbertCModuleStructure

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleOperatorPackage (A : CModuleAdmittedObject) where
  operatorType : Type u
  adjointMap : Prop
  boundedness : Prop
  closedRange : Prop

structure CModuleOperatorEvidence (A : CModuleAdmittedObject) (Op : CModuleOperatorPackage A) where
  adjointMapClosed : Op.adjointMap
  boundednessClosed : Op.boundedness
  closedRangeClosed : Op.closedRange

def CModuleOperatorClosed (A : CModuleAdmittedObject) (Op : CModuleOperatorPackage A) : Prop :=
  Op.adjointMap ∧ Op.boundedness ∧ Op.closedRange

theorem cmodule_operator_closed_from_evidence (A : CModuleAdmittedObject) (Op : CModuleOperatorPackage A)
    (E : CModuleOperatorEvidence A Op) : CModuleOperatorClosed A Op := by
  exact And.intro E.adjointMapClosed (And.intro E.boundednessClosed E.closedRangeClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse