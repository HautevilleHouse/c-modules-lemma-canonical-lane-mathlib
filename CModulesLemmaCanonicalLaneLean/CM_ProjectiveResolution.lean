import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ProjectiveResolutionPackage where
  targetModule : ModuleStructurePackage
  resolutionModules : List ModuleStructurePackage
  resolutionMaps : List (∀ (i : Nat), resolutionModules.get? i → resolutionModules.get? (i+1))
  eachModuleProjective : Prop
  exactSequence : Prop
  augmentationMap : targetModule.m → (resolutionModules.get? 0).m
  augmentationExact : Prop

structure ProjectiveResolutionEvidence (P : ProjectiveResolutionPackage) where
  eachModuleProjectiveClosed : P.eachModuleProjective
  exactSequenceClosed : P.exactSequence
  augmentationExactClosed : P.augmentationExact

def ProjectiveResolutionClosed (P : ProjectiveResolutionPackage) : Prop :=
  P.eachModuleProjective ∧ P.exactSequence ∧ P.augmentationExact

theorem projective_resolution_closed_from_evidence (P : ProjectiveResolutionPackage) (E : ProjectiveResolutionEvidence P) : ProjectiveResolutionClosed P := by
  exact And.intro E.eachModuleProjectiveClosed (And.intro E.exactSequenceClosed E.augmentationExactClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse