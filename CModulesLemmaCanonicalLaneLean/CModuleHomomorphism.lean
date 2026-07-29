import canonicalLaneMathlib.AdmissibleClass
import CModulesLemmaCanonicalLaneLean.CModuleNotation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Homomorphism Package
Defines homomorphism structures for C-modules, analogous to PerelmanEntropy.
-/

structure CModuleHomomorphism (C1 C2 : CModuleNotation) where
  map : C1.M → C2.M
  linearity : Prop
  respectsCAction : Prop
  injectivity : Prop

structure CModuleHomomorphismEvidence {C1 C2 : CModuleNotation} (H : CModuleHomomorphism C1 C2) where
  linearityClosed : H.linearity
  respectsCActionClosed : H.respectsCAction
  injectivityClosed : H.injectivity

def CModuleHomomorphismClosed {C1 C2 : CModuleNotation} (H : CModuleHomomorphism C1 C2) : Prop :=
  H.linearity ∧ H.respectsCAction ∧ H.injectivity

theorem c_module_homomorphism_closed_from_evidence
    {C1 C2 : CModuleNotation} (H : CModuleHomomorphism C1 C2) (E : CModuleHomomorphismEvidence H) :
    CModuleHomomorphismClosed H := by
  exact And.intro E.linearityClosed
    (And.intro E.respectsCActionClosed E.injectivityClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse