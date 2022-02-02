ggsave_path <- function(filename, plot, path){

    ggplot2::ggsave(filename = filename,
                    plot = plot,
                    path = path)

    return(file.path(path, filename))

}

snapshot_plot <- tibble::tibble(x = 1:5, y = 1:5) %>%
    ggplot2::ggplot(ggplot2::aes(x, y)) +
    ggplot2::geom_point()

test_that("snapshot testing works", {
  expect_snapshot_file(ggsave_path(filename = "snapshot_plot.png",
                                   plot = snapshot_plot,
                                   path = tempdir()),
                       "plot.png")
})
