library(community)

datacommons_refresh("../social_data_commons", reset_on_fail = TRUE)
datacommons_map_files("../social_data_commons", overwrite = TRUE)

entities_file <- "../social_data_commons/cache/entities.rds"
if (file.exists(entities_file)) {
  entities <- readRDS(entities_file)
} else {
  file <- tempfile(fileext = ".csv.xz")
  download.file(paste0(
    "https://raw.githubusercontent.com/uva-bi-sdad/sdc.geographies/main/",
    "docs/distribution/geographies_metadata.csv.xz"
  ), file)
  entities <- vroom::vroom(file)
  entities <- entities[!duplicated(entities$geoid), c("geoid", "region_name", "region_type")]
  saveRDS(entities, entities_file, compress = "xz")
}

# capital region
datacommons_view(
  "../social_data_commons", "capital_region", metadata = entities,
  entity_info = NULL, overwrite = TRUE
)

# VDH
datacommons_view(
  "../social_data_commons", "community_example", metadata = entities,
  entity_info = NULL, overwrite = TRUE
)

# monitor site
init_datacommons("../social_data_commons", serve = TRUE)
