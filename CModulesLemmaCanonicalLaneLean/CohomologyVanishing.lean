import CModulesLemmaCanonicalLaneLean.CModulesExt

/-!
# Cohomology Vanishing Package
-/

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CohomologyVanishingPackage {A : AdmissibleClass}
    (E : CModulesExtensionPackage A) where
  firstCohomologyVanishes : Prop
  obstructionClassTrivial : Prop
  vanishingImpliesExtension : Prop

structure CohomologyVanishingEvidence {A : AdmissibleClass}
    {E : CModulesExtensionPackage A} (V : CohomologyVanishingPackage E) where
  firstCohomologyVanishesClosed : V.firstCohomologyVanishes
  obstructionClassTrivialClosed : V.obstructionClassTrivial
  vanishingImpliesExtensionClosed : V.vanishingImpliesExtension

def CohomologyVanishingClosed {A : AdmissibleClass}
    {E : CModulesExtensionPackage A} (V : CohomologyVanishingPackage E) : Prop :=
  V.firstCohomologyVanishes ∧ V.obstructionClassTrivial ∧ V.vanishingImpliesExtension

theorem cohomology_vanishing_closed_from_evidence
    {A : AdmissibleClass} {E : CModulesExtensionPackage A}
    (V : CohomologyVanishingPackage E) (Ev : CohomologyVanishingEvidence V) :
    CohomologyVanishingClosed V := by
  exact And.intro Ev.firstCohomologyVanishesClosed
    (And.intro Ev.obstructionClassTrivialClosed Ev.vanishingImpliesExtensionClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse