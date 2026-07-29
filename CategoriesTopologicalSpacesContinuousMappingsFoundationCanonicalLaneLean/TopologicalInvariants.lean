import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalInvariant (X : Type u) (TX : TopologicalSpaceStructure X) where
  name : String
  property : Prop
  homeomorphismPreserved : ∀ (Y : Type u) (TY : TopologicalSpaceStructure Y) (h : Homeomorphism TX TY), property → (h.forward.continuousPreimage ?_)

structure Connectedness extends TopologicalInvariant where
  connected : Prop
  property := connected

structure Compactness extends TopologicalInvariant where
  compact : Prop
  property := compact

def invarianceClosure (I : TopologicalInvariant) : Prop :=
  I.homeomorphismPreserved

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse