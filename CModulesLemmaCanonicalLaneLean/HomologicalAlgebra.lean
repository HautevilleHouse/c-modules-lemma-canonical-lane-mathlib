import HautevilleHouse.CModulesLemmaCanonicalLaneLean.FlatModules

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure HomologicalAlgebraPackage where
  extGroupComputed : Prop
  torGroupComputed : Prop
  spectralSequence : Prop

structure HomologicalAlgebraEvidence (H : HomologicalAlgebraPackage) where
  extGroupComputedClosed : H.extGroupComputed
  torGroupComputedClosed : H.torGroupComputed
  spectralSequenceClosed : H.spectralSequence

def HomologicalAlgebraClosed (H : HomologicalAlgebraPackage) : Prop :=
  H.extGroupComputed ∧ H.torGroupComputed ∧ H.spectralSequence

theorem homological_algebra_closed_from_evidence
    (H : HomologicalAlgebraPackage) (E : HomologicalAlgebraEvidence H) :
    HomologicalAlgebraClosed H := by
  exact And.intro E.extGroupComputedClosed
    (And.intro E.torGroupComputedClosed E.spectralSequenceClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse