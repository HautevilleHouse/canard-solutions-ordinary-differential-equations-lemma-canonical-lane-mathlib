import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.SlowManifold

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardCyclesPackage {A : AdmissibleClass} (P : SlowManifoldPackage A) where
  canardTrajectory : Type u
  canardCondition : Prop
  cycleExistence : Prop
  canardExplosion : Prop

structure CanardCyclesEvidence {A : AdmissibleClass} {P : SlowManifoldPackage A} (C : CanardCyclesPackage P) where
  canardConditionClosed : C.canardCondition
  cycleExistenceClosed : C.cycleExistence
  canardExplosionClosed : C.canardExplosion

def CanardCyclesClosed {A : AdmissibleClass} {P : SlowManifoldPackage A} (C : CanardCyclesPackage P) : Prop :=
  C.canardCondition ∧ C.cycleExistence ∧ C.canardExplosion

theorem canard_cycles_closed_from_evidence {A : AdmissibleClass} {P : SlowManifoldPackage A} (C : CanardCyclesPackage P) (E : CanardCyclesEvidence C) :
    CanardCyclesClosed C := by
  exact And.intro E.canardConditionClosed (And.intro E.cycleExistenceClosed E.canardExplosionClosed)

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse
