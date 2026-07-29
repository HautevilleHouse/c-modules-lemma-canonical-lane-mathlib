import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleObject where
  carrier : Type u
  ring : Type v
  ringOperations : Ring ring
  moduleStructure : Module ring carrier

structure CModuleAdmittedObject where
  object : CModuleObject
  moduleWitness : Prop
  bridgeCondition : Prop
  conclusion : moduleWitness → bridgeCondition

def CModuleWitnessClosed (O : CModuleAdmittedObject) : Prop :=
  O.moduleWitness

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse