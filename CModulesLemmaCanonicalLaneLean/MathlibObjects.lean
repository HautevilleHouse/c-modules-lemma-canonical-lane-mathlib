import CModulesLemmaCanonicalLaneLean.TheoremStatement
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleSpace where
  carrier : Type u
  inner : carrier → carrier → ℂ
  norm : carrier → ℝ
  completeness : Prop

structure CModuleAdmittedObject where
  space : CModuleSpace
  isHilbertCModule : Prop
  moduleOverCStarAlgebra : Prop
  conclusion : isHilbertCModule ∧ moduleOverCStarAlgebra

structure CModuleEndgameState where
  object : CModuleAdmittedObject

def CModuleWitnessClosed (O : CModuleAdmittedObject) : Prop :=
  O.isHilbertCModule ∧ O.moduleOverCStarAlgebra

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse