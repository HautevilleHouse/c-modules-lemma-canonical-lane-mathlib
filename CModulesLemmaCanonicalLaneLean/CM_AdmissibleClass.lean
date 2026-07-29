import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CM_AdmittedObject where
  modulePackage : ModuleStructurePackage
  moduleClosed : ModuleStructureClosed modulePackage
  latticePackage : SubmoduleLatticePackage
  latticeClosed : SubmoduleLatticeClosed latticePackage
  exactSequencePackage : ShortExactSequencePackage
  exactClosed : ShortExactSequenceClosed exactSequencePackage

structure CM_AdmissibleClass extends AdmissibleClass where
  object : CM_AdmittedObject
  projectiveResolution : ProjectiveResolutionPackage
  snakeLemma : SnakeLemmaPackage
  resolutionClosed : ProjectiveResolutionClosed projectiveResolution
  snakeClosed : SnakeLemmaClosed snakeLemma

def CM_WitnessClosed (O : CM_AdmittedObject) : Prop :=
  O.moduleClosed ∧ O.latticeClosed ∧ O.exactClosed

theorem CM_bridge_from_admissible_class (A : CM_AdmissibleClass) : CM_WitnessClosed A.object := by
  exact And.intro A.object.moduleClosed (And.intro A.object.latticeClosed A.object.exactClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse