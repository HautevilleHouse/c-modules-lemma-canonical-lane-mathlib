import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModule (A : Type u) (M : Type v) [AddCommGroup A] [Ring A] [AddCommGroup M] where
  smul : A → M → M
  smul_add : ∀ (a : A) (x y : M), smul a (x + y) = smul a x + smul a y
  add_smul : ∀ (a b : A) (x : M), smul (a + b) x = smul a x + smul b x
  mul_smul : ∀ (a b : A) (x : M), smul (a * b) x = smul a (smul b x)
  one_smul : ∀ (x : M), smul 1 x = x

structure CModuleAdmissibleObject where
  baseRing : Type u
  [ring : Ring baseRing]
  moduleCarrier : Type v
  [addCommGroup : AddCommGroup moduleCarrier]
  cmodule : CModule baseRing moduleCarrier
  submoduleChain : List (AddSubgroup moduleCarrier)
  chainAscending : ∀ (i j : ℕ), i ≤ j → submoduleChain.get? i ≤ submoduleChain.get? j
  chainUnion : (⨆ i, submoduleChain.get? i) = ⊤
  conclusion : Submodule.FG (⊤ : Submodule baseRing moduleCarrier)

def CModuleWitnessClosed (O : CModuleAdmissibleObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : CModuleAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse