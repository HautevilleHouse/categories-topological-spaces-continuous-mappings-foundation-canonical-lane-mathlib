import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure Category where
  objects : Type u
  morphisms : Type v
  source : morphisms -> objects
  target : morphisms -> objects
  identity : objects -> morphisms
  composition : morphisms -> morphisms -> morphisms
  compositionAssociative : Prop
  identityLeftUnit : Prop
  identityRightUnit : Prop

structure Functor (C D : Category) where
  objectMap : C.objects -> D.objects
  morphismMap : C.morphisms -> D.morphisms
  preservesSourceTarget : Prop
  preservesIdentity : Prop
  preservesComposition : Prop

structure NaturalTransformation {C D : Category} (F G : Functor C D) where
  components : (x : C.objects) -> D.morphisms
  naturalityCondition : Prop

structure CategoricalFoundation where
  category : Category
  continuousMappingsCategory : Category
  embeddingFunctor : Functor category continuousMappingsCategory
  embeddingFullFaithful : Prop

structure CategoricalFoundationEvidence (F : CategoricalFoundation) where
  embeddingFullFaithfulClosed : F.embeddingFullFaithful
  categoryAxiomsClosed : F.category.compositionAssociative ∧ F.category.identityLeftUnit ∧ F.category.identityRightUnit

def CategoricalFoundationClosed (F : CategoricalFoundation) : Prop :=
  F.embeddingFullFaithful ∧ F.category.compositionAssociative ∧
  F.category.identityLeftUnit ∧ F.category.identityRightUnit

theorem categorical_foundation_closed_from_evidence
    (F : CategoricalFoundation) (E : CategoricalFoundationEvidence F) :
    CategoricalFoundationClosed F := by
  exact And.intro E.embeddingFullFaithfulClosed
    (And.intro (by exact E.categoryAxiomsClosed.1)
      (And.intro (by exact E.categoryAxiomsClosed.2.1) (by exact E.categoryAxiomsClosed.2.2)))

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse