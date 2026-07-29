import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure HomeomorphismPackage (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  forward : X → Y
  backward : Y → X
  forwardContinuous : Continuous forward
  backwardContinuous : Continuous backward
  forwardBackwardInverse : ∀ (x : X), backward (forward x) = x
  backwardForwardInverse : ∀ (y : Y), forward (backward y) = y

structure HomeomorphismEvidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (H : HomeomorphismPackage X Y) where
  forwardContinuousClosed : H.forwardContinuous
  backwardContinuousClosed : H.backwardContinuous
  inverseClosed : (∀ (x : X), H.backward (H.forward x) = x) ∧ (∀ (y : Y), H.forward (H.backward y) = y)

def HomeomorphismClosed {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (H : HomeomorphismPackage X Y) : Prop :=
  H.forwardContinuous ∧ H.backwardContinuous ∧ (∀ (x : X), H.backward (H.forward x) = x) ∧ (∀ (y : Y), H.forward (H.backward y) = y)

theorem homeomorphism_closed_from_evidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (H : HomeomorphismPackage X Y) (E : HomeomorphismEvidence H) : HomeomorphismClosed H :=
  And.intro E.forwardContinuousClosed (And.intro E.backwardContinuousClosed E.inverseClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse