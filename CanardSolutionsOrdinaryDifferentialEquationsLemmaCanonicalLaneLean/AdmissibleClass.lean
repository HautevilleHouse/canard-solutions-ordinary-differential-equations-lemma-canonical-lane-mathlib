import canard_solutions_ordinary_differential_equations_lemma_canonical_lane_lean.MathlibObjects

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : CanardAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CanardWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse
