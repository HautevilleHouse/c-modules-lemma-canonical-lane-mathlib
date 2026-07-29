import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleFoundation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleAlgebra (S : CModuleSystem) where
  algebraStructure : Type u
  algebraRing : Ring algebraStructure
  algebraModule : Module S.baseRing algebraStructure
  algebraFinitelyGenerated : Prop
  algebraProjective : Prop
  algebraClosed : algebraFinitelyGenerated ∧ algebraProjective

structure CModuleAlgebraEvidence (S : CModuleSystem) (A : CModuleAlgebra S) where
  algebraFinitelyGeneratedClosed : A.algebraFinitelyGenerated
  algebraProjectiveClosed : A.algebraProjective

def CModuleAlgebraClosed (S : CModuleSystem) (A : CModuleAlgebra S) : Prop :=
  A.algebraFinitelyGenerated ∧ A.algebraProjective

theorem c_module_algebra_closed_from_evidence (S : CModuleSystem) (A : CModuleAlgebra S) (E : CModuleAlgebraEvidence S A) :
    CModuleAlgebraClosed S A := by
  exact And.intro E.algebraFinitelyGeneratedClosed E.algebraProjectiveClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse