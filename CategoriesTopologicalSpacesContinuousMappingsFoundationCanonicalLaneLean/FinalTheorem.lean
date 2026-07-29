import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean.ContinuousMappingsBridge

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

def ConstrainedTopologicalSpaceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_topological_space_endgame (A : AdmissibleClass) : ConstrainedTopologicalSpaceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse