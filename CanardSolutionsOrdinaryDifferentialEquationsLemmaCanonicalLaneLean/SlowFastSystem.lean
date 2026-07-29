import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure SlowFastSystemPackage where
  phaseSpaceDim : Nat
  slowDim : Nat
  fastDim : Nat
  epsilon : ℝ
  criticalManifold : Prop
  normalHyperbolicity : Prop
  slowManifoldExists : Prop
  canardPhenomenon : Prop

structure SlowFastSystemEvidence (S : SlowFastSystemPackage) where
  criticalManifoldClosed : S.criticalManifold
  normalHyperbolicityClosed : S.normalHyperbolicity
  slowManifoldExistsClosed : S.slowManifoldExists
  canardPhenomenonClosed : S.canardPhenomenon

def SlowFastSystemClosed (S : SlowFastSystemPackage) : Prop :=
  S.criticalManifold ∧ S.normalHyperbolicity ∧ S.slowManifoldExists ∧ S.canardPhenomenon

theorem slow_fast_system_closed_from_evidence (S : SlowFastSystemPackage) (E : SlowFastSystemEvidence S) :
    SlowFastSystemClosed S := by
  exact And.intro E.criticalManifoldClosed
    (And.intro E.normalHyperbolicityClosed
      (And.intro E.slowManifoldExistsClosed E.canardPhenomenonClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse