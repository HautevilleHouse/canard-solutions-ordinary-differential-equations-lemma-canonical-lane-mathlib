import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.SlowFastPDE

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure FenichelPackage (S : SlowFastSystem) where
  invariantManifoldExists : Prop
  manifoldSmoothness : Prop
  perturbationExpansion : Prop
  flowOnManifold : Prop
  persistenceParameter : ℝ
  persistenceCondition : Prop

structure FenichelEvidence {S : SlowFastSystem} (F : FenichelPackage S) where
  invariantManifoldExistsClosed : F.invariantManifoldExists
  manifoldSmoothnessClosed : F.manifoldSmoothness
  perturbationExpansionClosed : F.perturbationExpansion
  flowOnManifoldClosed : F.flowOnManifold
  persistenceConditionClosed : F.persistenceCondition

def FenichelClosed {S : SlowFastSystem} (F : FenichelPackage S) : Prop :=
  F.invariantManifoldExists ∧ F.manifoldSmoothness ∧
  F.perturbationExpansion ∧ F.flowOnManifold ∧ F.persistenceCondition

theorem fenichel_closed_from_evidence {S : SlowFastSystem} (F : FenichelPackage S)
    (E : FenichelEvidence F) : FenichelClosed F := by
  exact And.intro E.invariantManifoldExistsClosed
    (And.intro E.manifoldSmoothnessClosed
      (And.intro E.perturbationExpansionClosed
        (And.intro E.flowOnManifoldClosed E.persistenceConditionClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse