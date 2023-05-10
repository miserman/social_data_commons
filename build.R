library(community)

datacommons_refresh("../social_data_commons", reset_on_fail = TRUE)
datacommons_map_files("../social_data_commons", overwrite = TRUE)

entities_file <- "../social_data_commons/cache/entities.rds"
if (file.exists(entities_file)) {
  entities <- readRDS(entities_file)
} else {
  entities <- vroom::vroom(
    "https://raw.githubusercontent.com/uva-bi-sdad/sdc.geographies/main/geographies_metadata.csv"
  )
  entities <- entities[!duplicated(entities$geoid), c("geoid", "region_name", "region_type")]
  saveRDS(entities, entities_file, compress = "xz")
}

# capital region
datacommons_view(
  "../social_data_commons", "capital_region", metadata = entities,
  formatters = list(region_name = function(x) sub(",.*$", "", x)), overwrite = TRUE
)
entity_info <- jsonlite::read_json("../capital_region/docs/data/entity_info.json")
jsonlite::write_json(
  entity_info[!names(entity_info) %in% c("tract", "block_group")],
  "../capital_region/docs/data/entity_info.json",
  auto_unbox = TRUE
)

# VDH
datacommons_view(
  "../social_data_commons", "community_example", metadata = entities,
  entity_info = NULL, overwrite = TRUE
)

# monitor site
init_datacommons("../social_data_commons", serve = TRUE)
