import CModulesLemmaCanonicalLaneLean.CohomologyVanishing

/-!
# Module Filtration Package
-/

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ModuleFiltrationPackage {A : AdmissibleClass}
    {E : CModulesExtensionPackage A} {V : CohomologyVanishingPackage E} where
  filtrationSteps : Nat
  submoduleChain : Prop
  associatedGraded : Prop
  filtrationConverges : Prop

structure ModuleFiltrationEvidence {A : AdmissibleClass}
    {E : CModulesExtensionPackage A} {V : CohomologyVanishingPackage E}
    (F : ModuleFiltrationPackage) where
  submoduleChainClosed : F.submoduleChain
  associatedGradedClosed : F.associatedGraded
  filtrationConvergesClosed : F.filtrationConverges

def ModuleFiltrationClosed {A : AdmissibleClass}
    {E : CModulesExtensionPackage A} {V : CohomologyVanishingPackage E}
    (F : ModuleFiltrationPackage) : Prop :=
  F.submoduleChain ∧ F.associatedGraded ∧ F.filtrationConverges

theorem module_filtration_closed_from_evidence
    {A : AdmissibleClass} {E : CModulesExtensionPackage A}
    {V : CohomologyVanishingPackage E} (F : ModuleFiltrationPackage)
    (Ev : ModuleFiltrationEvidence F) : ModuleFiltrationClosed F := by
  exact And.intro Ev.submoduleChainClosed
    (And.intro Ev.associatedGradedClosed Ev.filtrationConvergesClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse