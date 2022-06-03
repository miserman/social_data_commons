library(community)

datacommons_refresh("../social_data_commons", rescan_only = TRUE)
datacommons_map_files("../social_data_commons")

datacommons_view(
  "../social_data_commons", "capital_region",
  measure_info = list(
    "_references" = jsonlite::read_json("../social_data_commons/views/capital_region/references.json")
  ),
  formatters = list(region_name = function(x) sub(",.*$", "", x))
)

datacommons_view(
  "../social_data_commons", "community_example", entity_info = NULL, prefer_repo = TRUE,
  measure_info = list(
    "_references" = jsonlite::read_json("../social_data_commons/views/community_example/references.json")
  )
)

init_datacommons("../social_data_commons", serve = TRUE)
