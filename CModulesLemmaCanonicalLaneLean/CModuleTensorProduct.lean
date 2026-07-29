import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleFoundation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleTensorProduct (M N : CModule R) where
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
  add_smul : ∀ r s : R, ∀ a : carrier, smul (r + s) a = add (smul r a) (smul s a)
  mul_smul : ∀ r s : R, ∀ a : carrier, smul (r * s) a = smul r (smul s a)
  one_smul : ∀ a : carrier, smul 1 a = a
  tensor_map : (M.carrier × N.carrier) → carrier
  tensor_linear : ∀ r : R, ∀ m m' : M.carrier, ∀ n n' : N.carrier,
    tensor_map (M.add m m', n) = add (tensor_map (m, n)) (tensor_map (m', n)) ∧
    tensor_map (m, N.add n n') = add (tensor_map (m, n)) (tensor_map (m, n')) ∧
    tensor_map (M.smul r m, n) = smul r (tensor_map (m, n)) ∧
    tensor_map (m, N.smul r n) = smul r (tensor_map (m, n))

structure TensorProductEvidence (M N : CModule R) (T : CModuleTensorProduct M N) where
  add_assoc_closed : ∀ a b c : T.carrier, T.add (T.add a b) c = T.add a (T.add b c)
  add_comm_closed : ∀ a b : T.carrier, T.add a b = T.add b a
  zero_add_closed : ∀ a : T.carrier, T.add T.zero a = a
  add_zero_closed : ∀ a : T.carrier, T.add a T.zero = a
  add_left_neg_closed : ∀ a : T.carrier, T.add (T.neg a) a = T.zero
  smul_add_closed : ∀ r : R, ∀ a b : T.carrier, T.smul r (T.add a b) = T.add (T.smul r a) (T.smul r b)
  add_smul_closed : ∀ r s : R, ∀ a : T.carrier, T.smul (r + s) a = T.add (T.smul r a) (T.smul s a)
  mul_smul_closed : ∀ r s : R, ∀ a : T.carrier, T.smul (r * s) a = T.smul r (T.smul s a)
  one_smul_closed : ∀ a : T.carrier, T.smul 1 a = a
  tensor_linear_closed : ∀ r : R, ∀ m m' : M.carrier, ∀ n n' : N.carrier,
    T.tensor_map (M.add m m', n) = T.add (T.tensor_map (m, n)) (T.tensor_map (m', n)) ∧
    T.tensor_map (m, N.add n n') = T.add (T.tensor_map (m, n)) (T.tensor_map (m, n')) ∧
    T.tensor_map (M.smul r m, n) = T.smul r (T.tensor_map (m, n)) ∧
    T.tensor_map (m, N.smul r n) = T.smul r (T.tensor_map (m, n))

def TensorProductClosed (M N : CModule R) (T : CModuleTensorProduct M N) : Prop :=
  (∀ a b c : T.carrier, T.add (T.add a b) c = T.add a (T.add b c)) ∧
  (∀ a b : T.carrier, T.add a b = T.add b a) ∧
  (∀ a : T.carrier, T.add T.zero a = a) ∧
  (∀ a : T.carrier, T.add a T.zero = a) ∧
  (∀ a : T.carrier, T.add (T.neg a) a = T.zero) ∧
  (∀ r : R, ∀ a b : T.carrier, T.smul r (T.add a b) = T.add (T.smul r a) (T.smul r b)) ∧
  (∀ r s : R, ∀ a : T.carrier, T.smul (r + s) a = T.add (T.smul r a) (T.smul s a)) ∧
  (∀ r s : R, ∀ a : T.carrier, T.smul (r * s) a = T.smul r (T.smul s a)) ∧
  (∀ a : T.carrier, T.smul 1 a = a) ∧
  (∀ r : R, ∀ m m' : M.carrier, ∀ n n' : N.carrier,
    T.tensor_map (M.add m m', n) = T.add (T.tensor_map (m, n)) (T.tensor_map (m', n)) ∧
    T.tensor_map (m, N.add n n') = T.add (T.tensor_map (m, n)) (T.tensor_map (m, n')) ∧
    T.tensor_map (M.smul r m, n) = T.smul r (T.tensor_map (m, n)) ∧
    T.tensor_map (m, N.smul r n) = T.smul r (T.tensor_map (m, n)))

theorem tensor_product_closed_from_evidence (M N : CModule R) (T : CModuleTensorProduct M N) (E : TensorProductEvidence M N T) : TensorProductClosed M N T := by
  refine And.intro E.add_assoc_closed (And.intro E.add_comm_closed (And.intro E.zero_add_closed
    (And.intro E.add_zero_closed (And.intro E.add_left_neg_closed (And.intro E.smul_add_closed
      (And.intro E.add_smul_closed (And.intro E.mul_smul_closed (And.intro E.one_smul_closed E.tensor_linear_closed))))))))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse