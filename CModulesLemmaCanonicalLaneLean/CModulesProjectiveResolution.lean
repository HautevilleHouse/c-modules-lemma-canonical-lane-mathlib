import CModulesLemmaCanonicalLaneLean.CModulesAdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ProjectiveResolutionPackage where
  projectiveModule : CModuleStructure
  resolutionComplex : Prop
  exactness : Prop
  finiteLength : Prop

structure ProjectiveResolutionEvidence (P : ProjectiveResolutionPackage) where
  resolutionComplexClosed : P.resolutionComplex
  exactnessClosed : P.exactness
  finiteLengthClosed : P.finiteLength

def ProjectiveResolutionClosed (P : ProjectiveResolutionPackage) : Prop :=
  P.resolutionComplex ∧ P.exactness ∧ P.finiteLength

theorem projective_resolution_closed_from_evidence
    (P : ProjectiveResolutionPackage) (E : ProjectiveResolutionEvidence P) :
    ProjectiveResolutionClosed P :=
  And.intro E.resolutionComplexClosed (And.intro E.exactnessClosed E.finiteLengthClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse