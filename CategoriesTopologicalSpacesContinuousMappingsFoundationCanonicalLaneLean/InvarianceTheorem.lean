import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TopologicalProperty where
  property : Type u -> Prop
  continuousInvariant : Type u -> Type v -> (source -> target) -> Prop

structure InvarianceTheorem where
  property : TopologicalProperty
  space : Type u
  spaceTopology : TopologicalSpace space
  homeomorphism : Homeomorphism
  propertyHolds : property.property space
  invarianceCondition : property.continuousInvariant space homeomorphism.source (homeomorphism.forwardMapping)

structure InvarianceTheoremEvidence (I : InvarianceTheorem) where
  propertyHoldsClosed : I.propertyHolds
  invarianceConditionClosed : I.invarianceCondition
  homeomorphismClosed : HomeomorphismClosed I.homeomorphism

def InvarianceTheoremClosed (I : InvarianceTheorem) : Prop :=
  I.propertyHolds ∧ I.invarianceCondition ∧ HomeomorphismClosed I.homeomorphism

theorem invariance_theorem_closed_from_evidence (I : InvarianceTheorem)
    (E : InvarianceTheoremEvidence I) : InvarianceTheoremClosed I := by
  exact And.intro E.propertyHoldsClosed
    (And.intro E.invarianceConditionClosed E.homeomorphismClosed)

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse