import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.CanardODESystem

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure FastFlowPackage (S : CanardODESystem) where
  fastTimeScale : ℝ → ℝ
  fastFlowDefined : Prop
  fastManifoldExistence : Prop
  fastFlowContraction : Prop

structure FastFlowEvidence (S : CanardODESystem) (F : FastFlowPackage S) where
  fastFlowDefinedClosed : F.fastFlowDefined
  fastManifoldExistenceClosed : F.fastManifoldExistence
  fastFlowContractionClosed : F.fastFlowContraction

def FastFlowClosed (S : CanardODESystem) (F : FastFlowPackage S) : Prop :=
  F.fastFlowDefined ∧ F.fastManifoldExistence ∧ F.fastFlowContraction

theorem fast_flow_closed_from_evidence (S : CanardODESystem) (F : FastFlowPackage S)
    (E : FastFlowEvidence S F) : FastFlowClosed S F := by
  exact And.intro E.fastFlowDefinedClosed
    (And.intro E.fastManifoldExistenceClosed E.fastFlowContractionClosed)

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse
