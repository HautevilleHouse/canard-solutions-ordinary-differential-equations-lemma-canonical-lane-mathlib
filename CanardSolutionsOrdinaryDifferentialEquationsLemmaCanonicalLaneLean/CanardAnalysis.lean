import CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.SlowFastSystem

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardAnalysisPackage {S : SlowFastSystem} where
  canardExistence : Prop
  canardUniqueness : Prop
  canardStability : Prop
  multiplicity : ℕ

structure CanardAnalysisEvidence {S : SlowFastSystem} (C : CanardAnalysisPackage S) where
  canardExistenceClosed : C.canardExistence
  canardUniquenessClosed : C.canardUniqueness
  canardStabilityClosed : C.canardStability
  multiplicityNonzero : C.multiplicity ≠ 0

def CanardAnalysisClosed {S : SlowFastSystem} (C : CanardAnalysisPackage S) : Prop :=
  C.canardExistence ∧ C.canardUniqueness ∧ C.canardStability ∧ C.multiplicity ≠ 0

theorem canard_analysis_closed_from_evidence
    {S : SlowFastSystem} (C : CanardAnalysisPackage S) (E : CanardAnalysisEvidence C) :
    CanardAnalysisClosed C := by
  exact And.intro E.canardExistenceClosed
    (And.intro E.canardUniquenessClosed
      (And.intro E.canardStabilityClosed E.multiplicityNonzero))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse