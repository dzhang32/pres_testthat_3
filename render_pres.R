
# Load libraries ----------------------------------------------------------

library(tidyverse)
library(here)

# Main --------------------------------------------------------------------

rmd_paths <-
    list.files(
        here::here(),
        pattern = "\\.Rmd$",
        full.names = TRUE,
        recursive = TRUE
    )

for(i in seq_along(rmd_paths)) {

    html_name <- rmd_paths %>%
        stringr::str_remove(".*/") %>%
        stringr::str_replace("\\.Rmd$", ".html")

    rmarkdown::render(
        input = rmd_paths[i],
        output_file = here::here("docs", html_name)
        )

}

