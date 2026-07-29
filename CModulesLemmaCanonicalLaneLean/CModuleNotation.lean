import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

/-!
# C-Module Notation and Basic Definitions
This module defines the basic structures for C-modules, analogously to RiemannianCurvaturePackage.
-/

structure CModuleStructure where
  moduleType : Type u
  groundRing : Type v
  cAction : groundRing → moduleType → moduleType
  ringCompatibility : Prop
  moduleAction : Prop
  cActionIsAlgebraic : Prop

structure CModuleNotation where
  R : Type u
  M : Type v
  cAction : R → M → M
  ringCompatible : Prop
  moduleAction : Prop

def CModuleClosed (C : CModuleNotation) : Prop :=
  C.ringCompatible ∧ C.moduleAction

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse