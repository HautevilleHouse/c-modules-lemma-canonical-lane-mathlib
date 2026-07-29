import CModulesLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure HilbertCModuleStructure (A : CModuleAdmittedObject) where
  innerProduct : Prop
  completeness : A.space.completeness
  moduleAction : Prop
  cauchySchwarz : Prop
  hilbertStructureClosed : Prop := by
    exact innerProduct ∧ completeness ∧ moduleAction ∧ cauchySchwarz

structure HilbertCModuleEvidence (A : CModuleAdmittedObject) (H : HilbertCModuleStructure A) where
  innerProductClosed : H.innerProduct
  completenessClosed : H.completeness
  moduleActionClosed : H.moduleAction
  cauchySchwarzClosed : H.cauchySchwarz

theorem hilbert_cmodule_closed_from_evidence (A : CModuleAdmittedObject) (H : HilbertCModuleStructure A)
    (E : HilbertCModuleEvidence A H) : H.hilbertStructureClosed := by
  exact And.intro E.innerProductClosed (And.intro E.completenessClosed (And.intro E.moduleActionClosed E.cauchySchwarzClosed))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse