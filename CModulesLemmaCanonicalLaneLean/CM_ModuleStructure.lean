import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure ModuleStructurePackage where
  coefficientRing : Type u
  coefficientRingIsCommutative : Prop
  m : Type v
  mIsAbelianGroup : Prop
  moduleAction : coefficientRing → m → m
  moduleActionDistributive : Prop
  moduleActionAssociative : Prop
  moduleActionIdentity : Prop

structure ModuleStructureEvidence (M : ModuleStructurePackage) where
  coefficientRingIsCommutativeClosed : M.coefficientRingIsCommutative
  mIsAbelianGroupClosed : M.mIsAbelianGroup
  moduleActionDistributiveClosed : M.moduleActionDistributive
  moduleActionAssociativeClosed : M.moduleActionAssociative
  moduleActionIdentityClosed : M.moduleActionIdentity

def ModuleStructureClosed (M : ModuleStructurePackage) : Prop :=
  M.coefficientRingIsCommutative ∧ M.mIsAbelianGroup ∧
  M.moduleActionDistributive ∧ M.moduleActionAssociative ∧
  M.moduleActionIdentity

theorem module_structure_closed_from_evidence (M : ModuleStructurePackage) (E : ModuleStructureEvidence M) : ModuleStructureClosed M := by
  exact And.intro E.coefficientRingIsCommutativeClosed
    (And.intro E.mIsAbelianGroupClosed
      (And.intro E.moduleActionDistributiveClosed
        (And.intro E.moduleActionAssociativeClosed
          E.moduleActionIdentityClosed)))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse