import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure CategoryStructure (Obj : Type u) where
  hom : Obj → Obj → Type v
  identity : ∀ X : Obj, hom X X
  compose : ∀ {X Y Z : Obj}, hom X Y → hom Y Z → hom X Z
  associativity : ∀ {X Y Z W : Obj} (f : hom X Y) (g : hom Y Z) (h : hom Z W), compose (compose f g) h = compose f (compose g h)
  identityLeft : ∀ {X Y : Obj} (f : hom X Y), compose (identity X) f = f
  identityRight : ∀ {X Y : Obj} (f : hom X Y), compose f (identity Y) = f

structure TopologicalCategory (Obj : Type u) where
  category : CategoryStructure Obj
  objectsTopology : TopologicalSpace Obj
  homTopology : ∀ X Y : Obj, TopologicalSpace (category.hom X Y)
  compositionContinuous : ∀ X Y Z : Obj, Continuous (fun (p : (category.hom X Y) × (category.hom Y Z)) => category.compose p.1 p.2)
  identityContinuous : ∀ X : Obj, Continuous (fun (_ : Unit) => category.identity X)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse
