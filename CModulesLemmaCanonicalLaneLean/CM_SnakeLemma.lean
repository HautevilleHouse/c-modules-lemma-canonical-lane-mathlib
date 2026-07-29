import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure SnakeLemmaPackage where
  topExactSeq : ShortExactSequencePackage
  bottomExactSeq : ShortExactSequencePackage
  verticalMapLeft : topExactSeq.leftModule.m → bottomExactSeq.leftModule.m
  verticalMapMiddle : topExactSeq.middleModule.m → bottomExactSeq.middleModule.m
  verticalMapRight : topExactSeq.rightModule.m → bottomExactSeq.rightModule.m
  squaresCommute : Prop
  connectingMap : bottomExactSeq.leftModule.m → topExactSeq.rightModule.m
  exactnessOfConnection : Prop

structure SnakeLemmaEvidence (S : SnakeLemmaPackage) where
  squaresCommuteClosed : S.squaresCommute
  exactnessOfConnectionClosed : S.exactnessOfConnection
  verticalMapLeftHomomorphic : Prop
  verticalMapMiddleHomomorphic : Prop
  verticalMapRightHomomorphic : Prop

structure SnakeLemmaEvidenceFull (S : SnakeLemmaPackage) (E : SnakeLemmaEvidence S) where
  squaresCommuteClosed : E.squaresCommuteClosed
  exactnessOfConnectionClosed : E.exactnessOfConnectionClosed
  verticalMapsHomomorphic : E.verticalMapLeftHomomorphic ∧ E.verticalMapMiddleHomomorphic ∧ E.verticalMapRightHomomorphic

def SnakeLemmaClosed (S : SnakeLemmaPackage) : Prop :=
  S.squaresCommute ∧ S.exactnessOfConnection

theorem snake_lemma_closed_from_evidence (S : SnakeLemmaPackage) (E : SnakeLemmaEvidence S) : SnakeLemmaClosed S := by
  exact And.intro E.squaresCommuteClosed E.exactnessOfConnectionClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse