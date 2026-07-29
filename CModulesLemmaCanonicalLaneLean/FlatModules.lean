import HautevilleHouse.CModulesLemmaCanonicalLaneLean.ProjectiveModules

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure FlatModulePackage (M : CModulePackage) where
  tensorExactness : Prop
  torVanishing : Prop
  colimitPreserving : Prop

structure FlatModuleEvidence {M : CModulePackage} (F : FlatModulePackage M) where
  tensorExactnessClosed : F.tensorExactness
  torVanishingClosed : F.torVanishing
  colimitPreservingClosed : F.colimitPreserving

def FlatModuleClosed {M : CModulePackage} (F : FlatModulePackage M) : Prop :=
  F.tensorExactness ∧ F.torVanishing ∧ F.colimitPreserving

theorem flat_module_closed_from_evidence
    {M : CModulePackage} (F : FlatModulePackage M)
    (E : FlatModuleEvidence F) : FlatModuleClosed F := by
  exact And.intro E.tensorExactnessClosed
    (And.intro E.torVanishingClosed E.colimitPreservingClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse