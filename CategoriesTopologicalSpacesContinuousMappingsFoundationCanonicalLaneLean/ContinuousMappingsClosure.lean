import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure ContinuousMapping where
  source : Type u
  target : Type v
  sourceTopology : TopologicalSpace source
  targetTopology : TopologicalSpace target
  mapping : source -> target
  continuityCondition : Prop

structure ContinuousMappingEvidence (f : ContinuousMapping) where
  continuityConditionClosed : f.continuityCondition

def ContinuousMappingClosed (f : ContinuousMapping) : Prop :=
  f.continuityCondition

theorem continuous_mapping_closed_from_evidence (f : ContinuousMapping)
    (E : ContinuousMappingEvidence f) : ContinuousMappingClosed f := by
  exact E.continuityConditionClosed

structure ContinuousMappingCategory where
  objects : Type u
  morphisms : Type v
  sourceMap : morphisms -> objects
  targetMap : morphisms -> objects
  composition : morphisms -> morphisms -> morphisms
  identity : objects -> morphisms
  compositionAssociative : Prop
  identityLeftUnit : Prop
  identityRightUnit : Prop
  morphismsAreContinuous : morphisms -> ContinuousMapping

structure ContinuousMappingCategoryEvidence (C : ContinuousMappingCategory) where
  compositionAssociativeClosed : C.compositionAssociative
  identityLeftUnitClosed : C.identityLeftUnit
  identityRightUnitClosed : C.identityRightUnit

def ContinuousMappingCategoryClosed (C : ContinuousMappingCategory) : Prop :=
  C.compositionAssociative ∧ C.identityLeftUnit ∧ C.identityRightUnit

theorem continuous_mapping_category_closed_from_evidence
    (C : ContinuousMappingCategory) (E : ContinuousMappingCategoryEvidence C) :
    ContinuousMappingCategoryClosed C := by
  exact And.intro E.compositionAssociativeClosed
    (And.intro E.identityLeftUnitClosed E.identityRightUnitClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse