import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModulesAdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModulesLemmaPackage where
  exactSequence : Prop
  diagramCommutes : Prop
  kernelInclusion : Prop
  cokernelProjection : Prop
  exactnessClosed : exactSequence
  diagramCommutesClosed : diagramCommutes
  kernelInclusionClosed : kernelInclusion
  cokernelProjectionClosed : cokernelProjection

structure CModulesLemmaEvidence (P : CModulesLemmaPackage) where
  exactSequenceClosed : P.exactSequence
  diagramCommutesClosed : P.diagramCommutes
  kernelInclusionClosed : P.kernelInclusion
  cokernelProjectionClosed : P.cokernelProjection

def CModulesLemmaClosed (P : CModulesLemmaPackage) : Prop :=
  P.exactSequence ∧ P.diagramCommutes ∧ P.kernelInclusion ∧ P.cokernelProjection

theorem c_modules_lemma_closed_from_evidence (P : CModulesLemmaPackage)
    (E : CModulesLemmaEvidence P) : CModulesLemmaClosed P := by
  exact And.intro E.exactSequenceClosed
    (And.intro E.diagramCommutesClosed
      (And.intro E.kernelInclusionClosed E.cokernelProjectionClosed))

def bridgeClosed (A : CModulesAdmissibleClass) : Prop :=
  CModulesWitnessClosed A

def gateClosed (A : CModulesAdmissibleClass) : Prop :=
  A.lemmaCondition

theorem bridge_from_admissible_class (A : CModulesAdmissibleClass) :
    bridgeClosed A := by
  exact A.lemmaConditionClosed

theorem gate_from_admissible_class (A : CModulesAdmissibleClass) :
    gateClosed A := by
  exact A.lemmaConditionClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse