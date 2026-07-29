import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalDualityPackage (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  dualMap : (X → Y) → (Y → X)
  bijection : Prop
  continuityPreserving : Prop
  involution : Prop

structure TopologicalDualityEvidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (D : TopologicalDualityPackage X Y) where
  bijectionClosed : D.bijection
  continuityPreservingClosed : D.continuityPreserving
  involutionClosed : D.involution

def TopologicalDualityClosed {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (D : TopologicalDualityPackage X Y) : Prop :=
  D.bijection ∧ D.continuityPreserving ∧ D.involution

theorem topological_duality_closed_from_evidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (D : TopologicalDualityPackage X Y) (E : TopologicalDualityEvidence D) : TopologicalDualityClosed D :=
  And.intro E.bijectionClosed (And.intro E.continuityPreservingClosed E.involutionClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse