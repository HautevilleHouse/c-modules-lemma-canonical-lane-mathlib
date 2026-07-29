import CModulesLemmaCanonicalLaneLean.CModulesSyzygyTheorem

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ChangeOfRingsPackage where
  baseRing : Type u
  extensionRing : Type v
  module : CModuleStructure
  inducedModule : CModuleStructure
  baseChangeProperty : Prop

structure ChangeOfRingsEvidence (C : ChangeOfRingsPackage) where
  baseChangePropertyClosed : C.baseChangeProperty

def ChangeOfRingsClosed (C : ChangeOfRingsPackage) : Prop :=
  C.baseChangeProperty

theorem change_of_rings_closed_from_evidence
    (C : ChangeOfRingsPackage) (E : ChangeOfRingsEvidence C) :
    ChangeOfRingsClosed C :=
  E.baseChangePropertyClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse