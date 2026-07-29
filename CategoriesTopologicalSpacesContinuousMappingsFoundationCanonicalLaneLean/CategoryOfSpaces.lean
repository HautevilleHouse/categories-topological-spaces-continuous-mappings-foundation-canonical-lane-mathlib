import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure CategoryOfSpacesPackage where
  objects : Type (u+1)
  morphisms : objects → objects → Type (u+1)
  composition : ∀ {A B C}, morphisms A B → morphisms B C → morphisms A C
  identity : ∀ A, morphisms A A
  associativity : ∀ {A B C D} (f : morphisms A B) (g : morphisms B C) (h : morphisms C D), composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {A B} (f : morphisms A B), composition (identity A) f = f
  identityRight : ∀ {A B} (f : morphisms A B), composition f (identity B) = f
  topologicalStructure : Prop
  continuousMorphisms : Prop

structure CategoryOfSpacesEvidence (pkg : CategoryOfSpacesPackage) where
  topologicalStructureClosed : pkg.topologicalStructure
  continuousMorphismsClosed : pkg.continuousMorphisms

def CategoryOfSpacesClosed (pkg : CategoryOfSpacesPackage) : Prop :=
  pkg.topologicalStructure ∧ pkg.continuousMorphisms

theorem category_of_spaces_closed_from_evidence (pkg : CategoryOfSpacesPackage) (E : CategoryOfSpacesEvidence pkg) : CategoryOfSpacesClosed pkg := by
  exact And.intro E.topologicalStructureClosed E.continuousMorphismsClosed

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse