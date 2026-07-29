import CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.FenichelNormalForm

/-!
# Canard Explosion Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardExplosionPackage (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) where
  criticalParameter : Prop
  explosionPhenomenon : Prop
  canardSolutionExists : Prop
  maximalCanard : Prop

def CanardExplosionClosed (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F) : Prop :=
  C.criticalParameter ∧ C.explosionPhenomenon ∧ C.canardSolutionExists ∧ C.maximalCanard

structure CanardExplosionEvidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F) where
  criticalParameterClosed : C.criticalParameter
  explosionPhenomenonClosed : C.explosionPhenomenon
  canardSolutionExistsClosed : C.canardSolutionExists
  maximalCanardClosed : C.maximalCanard

theorem canard_explosion_closed_from_evidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F)
    (E : CanardExplosionEvidence A S F C) : CanardExplosionClosed A S F C := by
  exact And.intro E.criticalParameterClosed
    (And.intro E.explosionPhenomenonClosed
      (And.intro E.canardSolutionExistsClosed E.maximalCanardClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse