import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure OpenSetCovers where
  indexSet : Type u
  openSets : indexSet -> Set (Type v)
  unionCoversSpace : Prop
  locallyFinite : Prop

structure OpenSetCategory where
  object : Type u
  topology : TopologicalSpace object
  openSets : Set (Set object)
  openSetAxioms : Prop
  continuousMaps : Set (object -> object)
  identityMaps : Prop
  compositionClosed : Prop

structure OpenSetCategoryEvidence (O : OpenSetCategory) where
  openSetAxiomsClosed : O.openSetAxioms
  identityMapsClosed : O.identityMaps
  compositionClosedClosed : O.compositionClosed

def OpenSetCategoryClosed (O : OpenSetCategory) : Prop :=
  O.openSetAxioms ∧ O.identityMaps ∧ O.compositionClosed

theorem open_set_category_closed_from_evidence (O : OpenSetCategory)
    (E : OpenSetCategoryEvidence O) : OpenSetCategoryClosed O := by
  exact And.intro E.openSetAxiomsClosed (And.intro E.identityMapsClosed E.compositionClosedClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse