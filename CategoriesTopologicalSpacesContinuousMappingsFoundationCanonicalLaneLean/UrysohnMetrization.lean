import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure UrysohnMetrizationPackage where
  urysohnLemma : Prop
  tiezeExtension : Prop
  metrizationTheorem : Prop
  embeddingIntoProducts : Prop
  completeRegularity : Prop

structure UrysohnMetrizationEvidence (pkg : UrysohnMetrizationPackage) where
  urysohnLemmaClosed : pkg.urysohnLemma
  tiezeExtensionClosed : pkg.tiezeExtension
  metrizationTheoremClosed : pkg.metrizationTheorem
  embeddingIntoProductsClosed : pkg.embeddingIntoProducts
  completeRegularityClosed : pkg.completeRegularity

def UrysohnMetrizationClosed (pkg : UrysohnMetrizationPackage) : Prop :=
  pkg.urysohnLemma ∧ pkg.tiezeExtension ∧ pkg.metrizationTheorem ∧ pkg.embeddingIntoProducts ∧ pkg.completeRegularity

theorem urysohn_metrization_closed_from_evidence (pkg : UrysohnMetrizationPackage) (E : UrysohnMetrizationEvidence pkg) : UrysohnMetrizationClosed pkg := by
  exact And.intro E.urysohnLemmaClosed (And.intro E.tiezeExtensionClosed (And.intro E.metrizationTheoremClosed (And.intro E.embeddingIntoProductsClosed E.completeRegularityClosed)))

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse