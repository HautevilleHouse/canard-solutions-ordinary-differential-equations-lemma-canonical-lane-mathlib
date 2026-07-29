import CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean.SlowManifold

/-!
# Fenichel Normal Form Package
-/

namespace HautevilleHouse
namespace CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean

structure FenichelNormalFormPackage (A : AdmissibleClass) (S : SlowManifoldPackage A) where
  coordinateTransformation : Prop
  slowFastCoordinates : Prop
  fastSubsystem : Prop
  slowSubsystem : Prop

def FenichelNormalFormClosed (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) : Prop :=
  F.coordinateTransformation ∧ F.slowFastCoordinates ∧ F.fastSubsystem ∧ F.slowSubsystem

structure FenichelNormalFormEvidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) where
  coordinateTransformationClosed : F.coordinateTransformation
  slowFastCoordinatesClosed : F.slowFastCoordinates
  fastSubsystemClosed : F.fastSubsystem
  slowSubsystemClosed : F.slowSubsystem

theorem fenichel_normal_form_closed_from_evidence (A : AdmissibleClass) (S : SlowManifoldPackage A)
    (F : FenichelNormalFormPackage A S) (E : FenichelNormalFormEvidence A S F) :
    FenichelNormalFormClosed A S F := by
  exact And.intro E.coordinateTransformationClosed
    (And.intro E.slowFastCoordinatesClosed (And.intro E.fastSubsystemClosed E.slowSubsystemClosed))

end CanardSolutionsOrdinaryDifferentialEquationsLemmaCanonicalLaneLean
end HautevilleHouse