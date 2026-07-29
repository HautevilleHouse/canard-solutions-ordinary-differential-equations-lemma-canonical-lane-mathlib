import CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Slow Manifold Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure SlowManifoldPackage (A : AdmissibleClass) where
  slowManifoldExists : Prop
  normallyHyperbolic : Prop
  foliationByFastFibers : Prop

def SlowManifoldClosed (A : AdmissibleClass) (S : SlowManifoldPackage A) : Prop :=
  S.slowManifoldExists ∧ S.normallyHyperbolic ∧ S.foliationByFastFibers

structure SlowManifoldEvidence (A : AdmissibleClass) (S : SlowManifoldPackage A) where
  slowManifoldExistsClosed : S.slowManifoldExists
  normallyHyperbolicClosed : S.normallyHyperbolic
  foliationByFastFibersClosed : S.foliationByFastFibers

theorem slow_manifold_closed_from_evidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (E : SlowManifoldEvidence A S) : SlowManifoldClosed A S := by
  exact And.intro E.slowManifoldExistsClosed (And.intro E.normallyHyperbolicClosed E.foliationByFastFibersClosed)

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse