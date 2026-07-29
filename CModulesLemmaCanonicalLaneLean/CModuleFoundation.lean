import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModule (R : Type u) [Ring R] where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R → carrier → carrier
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  add_comm : ∀ a b : carrier, add a b = add b a
  zero_add : ∀ a : carrier, add zero a = a
  add_zero : ∀ a : carrier, add a zero = a
  add_left_neg : ∀ a : carrier, add (neg a) a = zero
  smul_add : ∀ r : R, ∀ a b : carrier, smul r (add a b) = add (smul r a) (smul r b)
  add_smul : ∀ r s : R, ∀ a : carrier, smul (add r s) a = add (smul r a) (smul s a)
  mul_smul : ∀ r s : R, ∀ a : carrier, smul (mul r s) a = smul r (smul s a)
  one_smul : ∀ a : carrier, smul 1 a = a

structure CModuleEvidence (M : CModule R) where
  add_assoc_closed : ∀ a b c : M.carrier, M.add (M.add a b) c = M.add a (M.add b c)
  add_comm_closed : ∀ a b : M.carrier, M.add a b = M.add b a
  zero_add_closed : ∀ a : M.carrier, M.add M.zero a = a
  add_zero_closed : ∀ a : M.carrier, M.add a M.zero = a
  add_left_neg_closed : ∀ a : M.carrier, M.add (M.neg a) a = M.zero
  smul_add_closed : ∀ r : R, ∀ a b : M.carrier, M.smul r (M.add a b) = M.add (M.smul r a) (M.smul r b)
  add_smul_closed : ∀ r s : R, ∀ a : M.carrier, M.smul (r + s) a = M.add (M.smul r a) (M.smul s a)
  mul_smul_closed : ∀ r s : R, ∀ a : M.carrier, M.smul (r * s) a = M.smul r (M.smul s a)
  one_smul_closed : ∀ a : M.carrier, M.smul 1 a = a

def CModuleClosed (M : CModule R) : Prop :=
  (∀ a b c : M.carrier, M.add (M.add a b) c = M.add a (M.add b c)) ∧
  (∀ a b : M.carrier, M.add a b = M.add b a) ∧
  (∀ a : M.carrier, M.add M.zero a = a) ∧
  (∀ a : M.carrier, M.add a M.zero = a) ∧
  (∀ a : M.carrier, M.add (M.neg a) a = M.zero) ∧
  (∀ r : R, ∀ a b : M.carrier, M.smul r (M.add a b) = M.add (M.smul r a) (M.smul r b)) ∧
  (∀ r s : R, ∀ a : M.carrier, M.smul (r + s) a = M.add (M.smul r a) (M.smul s a)) ∧
  (∀ r s : R, ∀ a : M.carrier, M.smul (r * s) a = M.smul r (M.smul s a)) ∧
  (∀ a : M.carrier, M.smul 1 a = a)

theorem cmodule_closed_from_evidence (M : CModule R) (E : CModuleEvidence M) : CModuleClosed M := by
  exact And.intro E.add_assoc_closed (And.intro E.add_comm_closed (And.intro E.zero_add_closed
    (And.intro E.add_zero_closed (And.intro E.add_left_neg_closed (And.intro E.smul_add_closed
      (And.intro E.add_smul_closed (And.intro E.mul_smul_closed E.one_smul_closed)))))))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse