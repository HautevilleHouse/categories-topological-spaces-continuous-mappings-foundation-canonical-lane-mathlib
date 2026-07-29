import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure AdmittedObject where
  foundationPackage : TopologicalSpaceFoundationPackage
  conclusion : TopologicalSpaceFoundationClosed foundationPackage

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TopologicalSpaceFoundationClosed A.object.foundationPackage ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse