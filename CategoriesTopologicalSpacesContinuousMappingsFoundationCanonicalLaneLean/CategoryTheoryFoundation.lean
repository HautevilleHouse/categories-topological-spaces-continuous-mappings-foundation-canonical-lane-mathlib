import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : (X : obj) → hom X X
  comp : {X Y Z : obj} → hom X Y → hom Y Z → hom X Z
  idCompLeft : {X Y : obj} → (f : hom X Y) → comp (id X) f = f
  idCompRight : {X Y : obj} → (f : hom X Y) → comp f (id Y) = f
  assoc : {W X Y Z : obj} → (f : hom W X) → (g : hom X Y) → (h : hom Y Z) → comp (comp f g) h = comp f (comp g h)

structure ContinuousMaps (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  continuous : Continuous toFun

theorem continuous_maps_category (X Y Z : Type u) [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z] (f : ContinuousMaps X Y) (g : ContinuousMaps Y Z) : ContinuousMaps X Z where
  toFun := g.toFun ∘ f.toFun
  continuous := Continuous.comp g.continuous f.continuous

structure Homeomorphism (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  invFun : Y → X
  leftInv : ∀ x, invFun (toFun x) = x
  rightInv : ∀ y, toFun (invFun y) = y
  continuous_toFun : Continuous toFun
  continuous_invFun : Continuous invFun

structure TopologicalSpaceFoundationPackage where
  category : TopologicalCategory
  continuousMapType : Type u → Type u → Type u
  homeomorphismType : Type u → Type u → Type u
  productTopology : Type u → Type u → Type u
  subspaceTopology : Type u → Type u → Type u
  quotientTopology : Type u → Type u → Type u
  exponentialTopology : Type u → Type u → Type u
  categoricalLimits : Prop
  categoricalColimits : Prop

structure TopologicalSpaceFoundationEvidence (P : TopologicalSpaceFoundationPackage) where
  categoricalLimitsClosed : P.categoricalLimits
  categoricalColimitsClosed : P.categoricalColimits

def TopologicalSpaceFoundationClosed (P : TopologicalSpaceFoundationPackage) : Prop :=
  P.categoricalLimits ∧ P.categoricalColimits

theorem topological_space_foundation_closed_from_evidence (P : TopologicalSpaceFoundationPackage) (E : TopologicalSpaceFoundationEvidence P) : TopologicalSpaceFoundationClosed P := by
  exact And.intro E.categoricalLimitsClosed E.categoricalColimitsClosed

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse