library(community)

datacommons_refresh("../social_data_commons")
datacommons_map_files("../social_data_commons")

datacommons_view(
  "../social_data_commons", "capital_region",
  formatters = list(region_name = function(x) sub(",.*$", "", x))
)

datacommons_view(
  "../social_data_commons", "community_example", entity_info = NULL, prefer_repo = TRUE
)

init_datacommons("../social_data_commons", serve = TRUE)
