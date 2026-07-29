import CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.CanardExplosion

/-!
# Singular Perturbation Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure SingularPerturbationPackage (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F) where
  smallParameter : Prop
  limitSystem : Prop
  geometricSingularPerturbation : Prop
  matchingAsymptotics : Prop

def SingularPerturbationClosed (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F)
    (P : SingularPerturbationPackage A S F C) : Prop :=
  P.smallParameter ∧ P.limitSystem ∧ P.geometricSingularPerturbation ∧ P.matchingAsymptotics

structure SingularPerturbationEvidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F)
    (P : SingularPerturbationPackage A S F C) where
  smallParameterClosed : P.smallParameter
  limitSystemClosed : P.limitSystem
  geometricSingularPerturbationClosed : P.geometricSingularPerturbation
  matchingAsymptoticsClosed : P.matchingAsymptotics

theorem singular_perturbation_closed_from_evidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (C : CanardExplosionPackage A S F)
    (P : SingularPerturbationPackage A S F C)
    (E : SingularPerturbationEvidence A S F C P) : SingularPerturbationClosed A S F C P := by
  exact And.intro E.smallParameterClosed
    (And.intro E.limitSystemClosed
      (And.intro E.geometricSingularPerturbationClosed E.matchingAsymptoticsClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse