import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure CategoryOfTopologicalSpacesPackage where
  objects : Type u
  morphisms : Type v
  identity : ∀ (X : objects), morphisms
  composition : ∀ (X Y Z : objects), morphisms → morphisms → morphisms
  morphismContinuity : Prop
  compositionContinuity : Prop
  identityContinuity : Prop

structure CategoryOfTopologicalSpacesEvidence (C : CategoryOfTopologicalSpacesPackage) where
  morphismContinuityClosed : C.morphismContinuity
  compositionContinuityClosed : C.compositionContinuity
  identityContinuityClosed : C.identityContinuity

def CategoryOfTopologicalSpacesClosed (C : CategoryOfTopologicalSpacesPackage) : Prop :=
  C.morphismContinuity ∧ C.compositionContinuity ∧ C.identityContinuity

theorem category_of_topological_spaces_closed_from_evidence (C : CategoryOfTopologicalSpacesPackage) (E : CategoryOfTopologicalSpacesEvidence C) : CategoryOfTopologicalSpacesClosed C :=
  And.intro E.morphismContinuityClosed (And.intro E.compositionContinuityClosed E.identityContinuityClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse