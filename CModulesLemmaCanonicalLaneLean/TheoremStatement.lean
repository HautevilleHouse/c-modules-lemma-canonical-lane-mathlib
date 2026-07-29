import HautevilleHouse.CModulesLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  cModuleConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceRepository : String := "c-modules-lemma-canonical-lane"
def sourceDescription : String := "C Modules Lemma"
def sourceTheoremBoundary : String := "no classical claim"

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository
  theoremName := sourceRepository
  theoremObject := sourceDescription
  classicalBoundary := sourceTheoremBoundary
  cModuleConstrainedStatement := "c-module-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count"
  certificateLane := "cmodule_constrained"
  carriedRemainder := "classical source boundary carried by formalization"
}

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse
