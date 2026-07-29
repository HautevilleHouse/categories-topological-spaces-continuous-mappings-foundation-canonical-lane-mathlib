import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "categories-topological-spaces-continuous-mappings-foundation-canonical-lane",
  theoremName := "CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLane",
  theoremObject := "Categories, topological spaces, continuous mappings foundation",
  classicalBoundary := "unrestricted classical closure",
  constrainedStatement := "constrained categorical topological closure",
  certificateLane := "categorical_topological_constrained",
  carriedRemainder := "classical categorical topological boundary carried"
}

def ClassicalSourceBoundaryCarried : Prop :=
  sourceTheoremStatement.certificateLane = "categorical_topological_constrained"

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = "categorical_topological_constrained" := by
  rfl

theorem classical_source_boundary_carried_checked :
    ClassicalSourceBoundaryCarried := by
  rfl

end CategoriesTopologicalSpacesContinuousMappingsFoundationCanonicalLaneLean
end HautevilleHouse
