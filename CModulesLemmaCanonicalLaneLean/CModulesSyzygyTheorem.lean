import CModulesLemmaCanonicalLaneLean.CModulesProjectiveResolution

namespace HautevilleHouse
namespace CModulesLemmaCanonicalLaneLean

structure SyzygyTheoremPackage where
  module : CModuleStructure
  syzygyModule : CModuleStructure
  syzygyProperty : Prop

structure SyzygyTheoremEvidence (S : SyzygyTheoremPackage) where
  syzygyPropertyClosed : S.syzygyProperty

def SyzygyTheoremClosed (S : SyzygyTheoremPackage) : Prop :=
  S.syzygyProperty

theorem syzygy_theorem_closed_from_evidence
    (S : SyzygyTheoremPackage) (E : SyzygyTheoremEvidence S) :
    SyzygyTheoremClosed S :=
  E.syzygyPropertyClosed

end CModulesLemmaCanonicalLaneLean
end HautevilleHouse