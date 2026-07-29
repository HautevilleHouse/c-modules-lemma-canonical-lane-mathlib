import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleStructure

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ProjectiveModulePackage (M : CModulePackage) where
  liftingProperty : Prop
  directSummand : Prop
  freeModulePresentation : Prop

structure ProjectiveModuleEvidence {M : CModulePackage} (P : ProjectiveModulePackage M) where
  liftingPropertyClosed : P.liftingProperty
  directSummandClosed : P.directSummand
  freeModulePresentationClosed : P.freeModulePresentation

def ProjectiveModuleClosed {M : CModulePackage} (P : ProjectiveModulePackage M) : Prop :=
  P.liftingProperty ∧ P.directSummand ∧ P.freeModulePresentation

theorem projective_module_closed_from_evidence
    {M : CModulePackage} (P : ProjectiveModulePackage M)
    (E : ProjectiveModuleEvidence P) : ProjectiveModuleClosed P := by
  exact And.intro E.liftingPropertyClosed
    (And.intro E.directSummandClosed E.freeModulePresentationClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse