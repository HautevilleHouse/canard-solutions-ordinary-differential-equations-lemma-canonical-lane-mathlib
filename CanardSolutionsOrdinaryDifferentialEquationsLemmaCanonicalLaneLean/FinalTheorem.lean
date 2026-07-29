import canard_solutions_ordinary_differential_equations_lemma_canonical_lane_lean.GateLemmas

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

def ConstrainedCanardSolutionsODELemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_canard_solutions_ode_lemma_endgame (A : AdmissibleClass) :
    ConstrainedCanardSolutionsODELemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse
