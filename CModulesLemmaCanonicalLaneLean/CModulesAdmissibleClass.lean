import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleStructure where
  ring : Type u
  module : Type v
  scalarMul : ring → module → module
  moduleLaw : Prop
  ringLaw : Prop
  scalarMulLaw : Prop

structure CModulesAdmittedObject where
  structure : CModuleStructure
  projectiveProperty : Prop
  finitelyGenerated : Prop
  conclusion : projectiveProperty

structure CModulesEndgameState where
  object : CModulesAdmittedObject

def CModulesWitnessClosed (O : CModulesAdmittedObject) : Prop :=
  O.conclusion

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse