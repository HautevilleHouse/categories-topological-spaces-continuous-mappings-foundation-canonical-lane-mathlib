import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure CompactnessPackage where
  compact : Prop
  locallyCompact : Prop
  sequentiallyCompact : Prop
  countablyCompact : Prop
  paracompact : Prop
  lindelöf : Prop

structure CompactnessEvidence (pkg : CompactnessPackage) where
  compactClosed : pkg.compact
  locallyCompactClosed : pkg.locallyCompact
  sequentiallyCompactClosed : pkg.sequentiallyCompact
  countablyCompactClosed : pkg.countablyCompact
  paracompactClosed : pkg.paracompact
  lindelöfClosed : pkg.lindelöf

def CompactnessClosed (pkg : CompactnessPackage) : Prop :=
  pkg.compact ∧ pkg.locallyCompact ∧ pkg.sequentiallyCompact ∧ pkg.countablyCompact ∧ pkg.paracompact ∧ pkg.lindelöf

theorem compactness_closed_from_evidence (pkg : CompactnessPackage) (E : CompactnessEvidence pkg) : CompactnessClosed pkg := by
  exact And.intro E.compactClosed (And.intro E.locallyCompactClosed (And.intro E.sequentiallyCompactClosed (And.intro E.countablyCompactClosed (And.intro E.paracompactClosed E.lindelöfClosed))))

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse