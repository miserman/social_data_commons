library(community)

datacommons_refresh("../social_data_commons")
datacommons_map_files("../social_data_commons", use_manifest = FALSE)

datacommons_view(
  "../social_data_commons", "capital_region",
  formatters = list(region_name = function(x) sub(",.*$", "", x)),
  prefer_repo = TRUE, use_manifest = FALSE
)

datacommons_view(
  "../social_data_commons", "community_example", entity_info = NULL,
  prefer_repo = TRUE, use_manifest = FALSE
)

init_datacommons("../social_data_commons", serve = TRUE)
