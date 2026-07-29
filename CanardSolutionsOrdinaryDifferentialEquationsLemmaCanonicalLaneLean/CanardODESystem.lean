import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardODESystem where
  slowDimension : ℕ
  fastDimension : ℕ
  slowEquation : ℝ → ℝ → ℝ
  fastEquation : ℝ → ℝ → ℝ
  smallParameter : ℝ
  slowManifoldExists : Prop
  canardSolutionExists : Prop

structure CanardODESystemEvidence (S : CanardODESystem) where
  slowManifoldExistsClosed : S.slowManifoldExists
  canardSolutionExistsClosed : S.canardSolutionExists

def CanardODESystemClosed (S : CanardODESystem) : Prop :=
  S.slowManifoldExists ∧ S.canardSolutionExists

theorem canard_ode_system_closed_from_evidence (S : CanardODESystem) (E : CanardODESystemEvidence S) :
    CanardODESystemClosed S := by
  exact And.intro E.slowManifoldExistsClosed E.canardSolutionExistsClosed

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse
