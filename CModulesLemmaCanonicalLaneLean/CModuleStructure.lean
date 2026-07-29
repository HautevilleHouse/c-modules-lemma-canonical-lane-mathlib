import HautevilleHouse.CModulesLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModulePackage where
  ring : Type u
  moduleCarrier : Type v
  moduleStruct : Module ring moduleCarrier
  finitelyGenerated : Prop
  finitelyPresented : Prop

structure CModuleEvidence (M : CModulePackage) where
  finitelyGeneratedClosed : M.finitelyGenerated
  finitelyPresentedClosed : M.finitelyPresented

def CModuleClosed (M : CModulePackage) : Prop :=
  M.finitelyGenerated ∧ M.finitelyPresented

theorem cmodule_closed_from_evidence (M : CModulePackage) (E : CModuleEvidence M) :
    CModuleClosed M := by
  exact And.intro E.finitelyGeneratedClosed E.finitelyPresentedClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse