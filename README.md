# data commons

Consists of the repositories listed in (commons.json)[commons.json].

You can clone this repository and run these commands to establish and work from local data:
```R
# remotes::install_github("uva-bi-sdad/community")
library(community)

# clone and/or pull repositories and distributions:
datacommons_refresh(".")

# map files:
datacommons_map_files(".")

# refresh a view (rebuild a view's site data):
datacommons_view(".", "view_name")

# run the monitor site locally:
init_datacommons(".", serve = TRUE)
```

