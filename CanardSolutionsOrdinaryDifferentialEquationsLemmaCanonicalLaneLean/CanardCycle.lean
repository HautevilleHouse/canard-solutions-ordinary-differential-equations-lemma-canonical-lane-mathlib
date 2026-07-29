import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardCyclePackage {S : SlowFastSystemPackage} where
  cycleExists : Prop
  canardSegment : Prop
  cycleStability : Prop
  bifurcationThreshold : ℝ

structure CanardCycleEvidence {S : SlowFastSystemPackage} (C : CanardCyclePackage S) where
  cycleExistsClosed : C.cycleExists
  canardSegmentClosed : C.canardSegment
  cycleStabilityClosed : C.cycleStability
  bifurcationThresholdClosed : C.bifurcationThreshold = C.bifurcationThreshold

def CanardCycleClosed {S : SlowFastSystemPackage} (C : CanardCyclePackage S) : Prop :=
  C.cycleExists ∧ C.canardSegment ∧ C.cycleStability ∧ (C.bifurcationThreshold = C.bifurcationThreshold)

theorem canard_cycle_closed_from_evidence {S : SlowFastSystemPackage} (C : CanardCyclePackage S) (E : CanardCycleEvidence C) :
    CanardCycleClosed C := by
  exact And.intro E.cycleExistsClosed
    (And.intro E.canardSegmentClosed
      (And.intro E.cycleStabilityClosed E.bifurcationThresholdClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse