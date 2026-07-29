import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleAdmissibleObject

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

open canonicalLaneMathlib

structure CModuleEndgameState where
  object : CModuleAdmittedObject

def cModuleProjection : Projection CModuleEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem cModule_projection_idempotent (x : CModuleEndgameState) :
    cModuleProjection.toFun (cModuleProjection.toFun x) = cModuleProjection.toFun x := by
  exact cModuleProjection.idempotent x

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse