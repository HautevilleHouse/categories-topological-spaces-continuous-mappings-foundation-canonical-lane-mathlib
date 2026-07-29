import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalSpaceFoundation (X : Type u) where
  topology : TopologicalSpace X
  opens : Set (Set X)
  openUnion : ∀ (U : Set (Set X)), (∀ u ∈ U, u ∈ opens) → (⋃₀ U) ∈ opens
  openIntersection : ∀ (U V : Set X), U ∈ opens → V ∈ opens → (U ∩ V) ∈ opens
  containsEmpty : (∅ : Set X) ∈ opens
  containsWhole : Set.univ ∈ opens

structure ContinuousMapping (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  mapping : X → Y
  continuousPreimage : ∀ V : Set Y, IsOpen V → IsOpen (mapping⁻¹' V)

def TopologicalSpaceFoundationClosed (X : Type u) (F : TopologicalSpaceFoundation X) : Prop :=
  F.openUnion ∧ F.openIntersection ∧ F.containsEmpty ∧ F.containsWhole

theorem topological_space_foundation_closed (X : Type u) (F : TopologicalSpaceFoundation X) :
    TopologicalSpaceFoundationClosed X F := by
  exact And.intro F.openUnion (And.intro F.openIntersection (And.intro F.containsEmpty F.containsWhole))

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse
