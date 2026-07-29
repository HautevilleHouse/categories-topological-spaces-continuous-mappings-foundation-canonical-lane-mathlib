import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure ContinuousMappingSpace (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  underlyingSet : Set (X → Y)
  compactOpenTopology : TopologicalSpace (X → Y)
  continuousFunctions : Prop
  closureProperties : Prop

structure ContinuousMappingFoundationEvidence (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (M : ContinuousMappingSpace X Y) where
  continuousFunctionsClosed : M.continuousFunctions
  closurePropertiesClosed : M.closureProperties

def ContinuousMappingFoundationClosed (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (M : ContinuousMappingSpace X Y) : Prop :=
  M.continuousFunctions ∧ M.closureProperties

theorem continuous_mapping_foundation_closed_from_evidence (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (M : ContinuousMappingSpace X Y) (E : ContinuousMappingFoundationEvidence X Y M) :
    ContinuousMappingFoundationClosed X Y M := by
  exact And.intro E.continuousFunctionsClosed E.closurePropertiesClosed

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse
