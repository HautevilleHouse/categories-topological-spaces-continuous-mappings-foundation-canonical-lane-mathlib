import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure SeparationAxiomsPackage where
  T0 : Prop
  T1 : Prop
  T2 : Prop
  regular : Prop
  normal : Prop
  completelyRegular : Prop
  tychonoff : Prop

structure SeparationAxiomsEvidence (pkg : SeparationAxiomsPackage) where
  T0Closed : pkg.T0
  T1Closed : pkg.T1
  T2Closed : pkg.T2
  regularClosed : pkg.regular
  normalClosed : pkg.normal
  completelyRegularClosed : pkg.completelyRegular
  tychonoffClosed : pkg.tychonoff

def SeparationAxiomsClosed (pkg : SeparationAxiomsPackage) : Prop :=
  pkg.T0 ∧ pkg.T1 ∧ pkg.T2 ∧ pkg.regular ∧ pkg.normal ∧ pkg.completelyRegular ∧ pkg.tychonoff

theorem separation_axioms_closed_from_evidence (pkg : SeparationAxiomsPackage) (E : SeparationAxiomsEvidence pkg) : SeparationAxiomsClosed pkg := by
  exact And.intro E.T0Closed (And.intro E.T1Closed (And.intro E.T2Closed (And.intro E.regularClosed (And.intro E.normalClosed (And.intro E.completelyRegularClosed E.tychonoffClosed)))))

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse