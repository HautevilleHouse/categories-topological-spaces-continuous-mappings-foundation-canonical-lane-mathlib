import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure DualityPair where
  leftObject : Type u
  rightObject : Type v
  leftTopology : TopologicalSpace leftObject
  rightTopology : TopologicalSpace rightObject
  pairing : (leftObject -> rightObject -> Prop)
  nondegenerate : Prop
  continuousInEachArgument : Prop

structure DualityTheorem where
  dualObject : Type u
  dualTopology : TopologicalSpace dualObject
  naturalIsomorphism : DualityPair
  isomorphismConditions : Prop

structure DualityTheoremEvidence (D : DualityTheorem) where
  nondegenerateClosed : D.naturalIsomorphism.nondegenerate
  continuousInEachArgumentClosed : D.naturalIsomorphism.continuousInEachArgument
  isomorphismConditionsClosed : D.isomorphismConditions

def DualityTheoremClosed (D : DualityTheorem) : Prop :=
  D.naturalIsomorphism.nondegenerate ∧ D.naturalIsomorphism.continuousInEachArgument ∧
  D.isomorphismConditions

theorem duality_theorem_closed_from_evidence (D : DualityTheorem)
    (E : DualityTheoremEvidence D) : DualityTheoremClosed D := by
  exact And.intro E.nondegenerateClosed
    (And.intro E.continuousInEachArgumentClosed E.isomorphismConditionsClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse