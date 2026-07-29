import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean.CategoryTheoryFoundation

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TopologicalSpaceFoundationClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse