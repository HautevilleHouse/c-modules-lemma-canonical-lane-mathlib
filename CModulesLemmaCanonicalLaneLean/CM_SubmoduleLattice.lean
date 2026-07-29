import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure SubmoduleLatticePackage where
  parentModule : ModuleStructurePackage
  submoduleFamily : Set (Set (parentModule.m → parentModule.m))
  intersectionClosed : Prop
  sumClosed : Prop
  completeLatticeStructure : Prop

structure SubmoduleLatticeEvidence (S : SubmoduleLatticePackage) where
  intersectionClosedClosed : S.intersectionClosed
  sumClosedClosed : S.sumClosed
  completeLatticeStructureClosed : S.completeLatticeStructure

def SubmoduleLatticeClosed (S : SubmoduleLatticePackage) : Prop :=
  S.intersectionClosed ∧ S.sumClosed ∧ S.completeLatticeStructure

theorem submodule_lattice_closed_from_evidence (S : SubmoduleLatticePackage) (E : SubmoduleLatticeEvidence S) : SubmoduleLatticeClosed S := by
  exact And.intro E.intersectionClosedClosed (And.intro E.sumClosedClosed E.completeLatticeStructureClosed)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse