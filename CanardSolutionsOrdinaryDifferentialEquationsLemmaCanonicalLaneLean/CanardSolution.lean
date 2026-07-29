import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.FenichelTheory

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure CanardSolutionPackage {S : SlowFastSystem} (F : FenichelPackage S) where
  canardExists : Prop
  canardTimescale : ℝ
  trajectoryCrossesCritical : Prop
  asymptoticMatching : Prop
  uniqueness : Prop

structure CanardSolutionEvidence {S : SlowFastSystem} {F : FenichelPackage S}
    (C : CanardSolutionPackage F) where
  canardExistsClosed : C.canardExists
  trajectoryCrossesCriticalClosed : C.trajectoryCrossesCritical
  asymptoticMatchingClosed : C.asymptoticMatching
  uniquenessClosed : C.uniqueness

def CanardSolutionClosed {S : SlowFastSystem} {F : FenichelPackage S}
    (C : CanardSolutionPackage F) : Prop :=
  C.canardExists ∧ C.trajectoryCrossesCritical ∧
  C.asymptoticMatching ∧ C.uniqueness

theorem canard_solution_closed_from_evidence {S : SlowFastSystem} {F : FenichelPackage S}
    (C : CanardSolutionPackage F) (E : CanardSolutionEvidence C) :
    CanardSolutionClosed C := by
  exact And.intro E.canardExistsClosed
    (And.intro E.trajectoryCrossesCriticalClosed
      (And.intro E.asymptoticMatchingClosed E.uniquenessClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse