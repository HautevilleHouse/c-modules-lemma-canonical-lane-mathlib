import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure CModuleAdmissibleClass where
  ring : Type u
  module : Type v
  scalarMultiplication : ring → module → module
  ringAxioms : Prop
  moduleAxioms : Prop
  cyclicGenerator : module
  cyclicWitness : ∀ x : module, ∃ r : ring, x = scalarMultiplication r cyclicGenerator

structure CModuleAdmittedObject where
  obj : CModuleAdmissibleClass
  lemmaStatement : Prop
  conclusion : lemmaStatement

def CModuleWitnessClosed (O : CModuleAdmittedObject) : Prop :=
  O.lemmaStatement

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse