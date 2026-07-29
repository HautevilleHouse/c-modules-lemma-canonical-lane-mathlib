import HautevilleHouse.CModulesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModulesSpace where
  baseRing : Type
  module : Type
  moduleStruct : Module baseRing module

structure CModulesAdmittedObject where
  space : CModulesSpace
  finitelyGenerated : Prop
  projective : Prop
  baseField : Type
  baseFieldAlgebraicallyClosed : Prop
  moduleTorsionFree : Prop
  conclusion : finitelyGenerated ∧ projective

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse