import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesLemmaCanonicalLaneLean.CModuleFoundation

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure HomFunctor (M N : CModule R) where
  carrier : Set (CModuleHomomorphism M N)
  zero : CModuleHomomorphism M N
  add : CModuleHomomorphism M N → CModuleHomomorphism M N → CModuleHomomorphism M N
  smul : R → CModuleHomomorphism M N → CModuleHomomorphism M N
  add_assoc : ∀ f g h : CModuleHomomorphism M N, add (add f g) h = add f (add g h)
  add_comm : ∀ f g : CModuleHomomorphism M N, add f g = add g f
  zero_add : ∀ f : CModuleHomomorphism M N, add zero f = f
  add_zero : ∀ f : CModuleHomomorphism M N, add f zero = f
  add_left_neg : ∀ f : CModuleHomomorphism M N, add (smul (-1 : R) f) f = zero
  smul_add : ∀ r : R, ∀ f g : CModuleHomomorphism M N, smul r (add f g) = add (smul r f) (smul r g)
  add_smul : ∀ r s : R, ∀ f : CModuleHomomorphism M N, smul (r + s) f = add (smul r f) (smul s f)
  mul_smul : ∀ r s : R, ∀ f : CModuleHomomorphism M N, smul (r * s) f = smul r (smul s f)
  one_smul : ∀ f : CModuleHomomorphism M N, smul 1 f = f

structure HomFunctorEvidence (M N : CModule R) (H : HomFunctor M N) where
  add_assoc_closed : ∀ f g h : CModuleHomomorphism M N, H.add (H.add f g) h = H.add f (H.add g h)
  add_comm_closed : ∀ f g : CModuleHomomorphism M N, H.add f g = H.add g f
  zero_add_closed : ∀ f : CModuleHomomorphism M N, H.add H.zero f = f
  add_zero_closed : ∀ f : CModuleHomomorphism M N, H.add f H.zero = f
  add_left_neg_closed : ∀ f : CModuleHomomorphism M N, H.add (H.smul (-1 : R) f) f = H.zero
  smul_add_closed : ∀ r : R, ∀ f g : CModuleHomomorphism M N, H.smul r (H.add f g) = H.add (H.smul r f) (H.smul r g)
  add_smul_closed : ∀ r s : R, ∀ f : CModuleHomomorphism M N, H.smul (r + s) f = H.add (H.smul r f) (H.smul s f)
  mul_smul_closed : ∀ r s : R, ∀ f : CModuleHomomorphism M N, H.smul (r * s) f = H.smul r (H.smul s f)
  one_smul_closed : ∀ f : CModuleHomomorphism M N, H.smul 1 f = f

def HomFunctorClosed (M N : CModule R) (H : HomFunctor M N) : Prop :=
  (∀ f g h : CModuleHomomorphism M N, H.add (H.add f g) h = H.add f (H.add g h)) ∧
  (∀ f g : CModuleHomomorphism M N, H.add f g = H.add g f) ∧
  (∀ f : CModuleHomomorphism M N, H.add H.zero f = f) ∧
  (∀ f : CModuleHomomorphism M N, H.add f H.zero = f) ∧
  (∀ f : CModuleHomomorphism M N, H.add (H.smul (-1 : R) f) f = H.zero) ∧
  (∀ r : R, ∀ f g : CModuleHomomorphism M N, H.smul r (H.add f g) = H.add (H.smul r f) (H.smul r g)) ∧
  (∀ r s : R, ∀ f : CModuleHomomorphism M N, H.smul (r + s) f = H.add (H.smul r f) (H.smul s f)) ∧
  (∀ r s : R, ∀ f : CModuleHomomorphism M N, H.smul (r * s) f = H.smul r (H.smul s f)) ∧
  (∀ f : CModuleHomomorphism M N, H.smul 1 f = f)

theorem hom_functor_closed_from_evidence (M N : CModule R) (H : HomFunctor M N) (E : HomFunctorEvidence M N H) : HomFunctorClosed M N H := by
  exact And.intro E.add_assoc_closed (And.intro E.add_comm_closed (And.intro E.zero_add_closed
    (And.intro E.add_zero_closed (And.intro E.add_left_neg_closed (And.intro E.smul_add_closed
      (And.intro E.add_smul_closed (And.intro E.mul_smul_closed E.one_smul_closed)))))))

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse