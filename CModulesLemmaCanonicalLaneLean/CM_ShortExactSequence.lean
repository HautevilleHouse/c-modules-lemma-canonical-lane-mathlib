import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ShortExactSequencePackage where
  leftModule : ModuleStructurePackage
  middleModule : ModuleStructurePackage
  rightModule : ModuleStructurePackage
  injection : leftModule.m → middleModule.m
  surjection : middleModule.m → rightModule.m
  exactnessAtMiddle : Prop
  exactnessAtLeft : Prop
  exactnessAtRight : Prop

structure ShortExactSequenceEvidence (S : ShortExactSequencePackage) where
  exactnessAtMiddleClosed : S.exactnessAtMiddle
  exactnessAtLeftClosed : S.exactnessAtLeft
  exactnessAtRightClosed : S.exactnessAtRight

def ShortExactSequenceClosed (S : ShortExactSequencePackage) : Prop :=
  S.exactnessAtMiddle ∧ S.exactnessAtLeft ∧ S.exactnessAtRight

theorem short_exact_sequence_closed_from_evidence (S : ShortExactSequencePackage) (E : ShortExactSequenceEvidence S) : ShortExactSequenceClosed S := by
  exact And.intro E.exactnessAtMiddleClosed (And.intro E.exactnessAtLeftClosed E.exactnessAtRightClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse