import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure ContinuousMappingPackage (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  mapping : X → Y
  continuity : Continuous mapping
  compositionClosure : Prop
  identityClosure : Prop

structure ContinuousMappingEvidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (M : ContinuousMappingPackage X Y) where
  continuityClosed : M.continuity
  compositionClosureClosed : M.compositionClosure
  identityClosureClosed : M.identityClosure

def ContinuousMappingClosed {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (M : ContinuousMappingPackage X Y) : Prop :=
  M.continuity ∧ M.compositionClosure ∧ M.identityClosure

theorem continuous_mapping_closed_from_evidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (M : ContinuousMappingPackage X Y) (E : ContinuousMappingEvidence M) : ContinuousMappingClosed M :=
  And.intro E.continuityClosed (And.intro E.compositionClosureClosed E.identityClosureClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse