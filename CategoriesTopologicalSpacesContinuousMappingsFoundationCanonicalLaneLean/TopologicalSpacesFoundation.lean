import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalSpaceData (X : Type u) where
  carrier : Set X
  openSets : Set (Set X)
  emptyOpen : Set.mem openSets ∅
  wholeSpaceOpen : Set.mem openSets carrier
  unionClosed : ∀ (U : Set (Set X)), U ⊆ openSets → Set.mem openSets (⋃₀ U)
  finiteIntersectionClosed : ∀ (U : Set (Set X)), Set.Finite U → U ⊆ openSets → Set.mem openSets (⋂₀ U)

theorem topological_space_from_data (X : Type u) (d : TopologicalSpaceData X) : TopologicalSpace X := by
  sorry

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse