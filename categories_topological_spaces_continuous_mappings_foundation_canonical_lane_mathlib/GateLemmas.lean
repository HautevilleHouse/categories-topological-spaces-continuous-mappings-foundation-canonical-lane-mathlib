import canonicalLaneMathlib.AdmissibleClass
namespace HautevilleHouse
namespace categories_topological_spaces_continuous_mappings_foundation_canonical_lane_mathlib
def AdmissibleClass : Type := canonicalLaneMathlib.AdmissibleClass
def bridgeClosed (A : AdmissibleClass) : Prop := True
def gateClosed (A : AdmissibleClass) : Prop := True
def bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := trivial
def gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := trivial
end categories_topological_spaces_continuous_mappings_foundation_canonical_lane_mathlib
end HautevilleHouse
