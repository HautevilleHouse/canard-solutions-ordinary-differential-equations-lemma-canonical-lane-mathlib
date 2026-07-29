import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure SlowFastSystem where
  fastVariable : Type u
  slowVariable : Type v
  perturbationParameter : ℝ
  fastEquation : fastVariable → slowVariable → ℝ → fastVariable
  slowEquation : fastVariable → slowVariable → ℝ → slowVariable
  regularity : Prop
  fastEquationSmooth : Prop
  slowEquationSmooth : Prop
  criticalManifold : Set (fastVariable × slowVariable)
  normalHyperbolicity : Prop
  transversalIntersection : Prop

structure SlowFastEvidence (S : SlowFastSystem) where
  regularityClosed : S.regularity
  fastEquationSmoothClosed : S.fastEquationSmooth
  slowEquationSmoothClosed : S.slowEquationSmooth
  normalHyperbolicityClosed : S.normalHyperbolicity
  transversalIntersectionClosed : S.transversalIntersection

def SlowFastClosed (S : SlowFastSystem) : Prop :=
  S.regularity ∧ S.fastEquationSmooth ∧ S.slowEquationSmooth ∧
  S.normalHyperbolicity ∧ S.transversalIntersection

theorem slow_fast_closed_from_evidence (S : SlowFastSystem) (E : SlowFastEvidence S) :
    SlowFastClosed S := by
  exact And.intro E.regularityClosed
    (And.intro E.fastEquationSmoothClosed
      (And.intro E.slowEquationSmoothClosed
        (And.intro E.normalHyperbolicityClosed E.transversalIntersectionClosed)))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse