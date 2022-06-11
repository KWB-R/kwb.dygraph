### How to build an R package from scratch
remotes::install_github("kwb-r/kwb.pkgbuild")

usethis::create_package(".")
fs::file_delete(path = "DESCRIPTION")


author <- list(name = "Hauke Sonnenberg",
               orcid = "0000-0001-9134-2871",
               url = "https://github.com/hsonne")

pkg <- list(name = "kwb.dygraph",
            title = "Additional Functions to Be Used with dygraph-Objects",
            desc  = paste("Additional functions to be used with dygraph-objects",
  "e.g. shading of areas or drawing of lines representing time periods within",
  "events (given by begin and end times)."))


kwb.pkgbuild::use_pkg(author,
                      pkg,
                      version = "0.1.0",
                      stage = "experimental")


usethis::use_vignette("tutorial")

### R functions
if(FALSE) {
  ## add your dependencies (-> updates: DESCRIPTION)
  pkg_dependencies <- c('dygraphs', "kwb.event", "kwb.utils")

  sapply(pkg_dependencies, usethis::use_package)

  desc::desc_add_remotes("github::kwb-r/kwb.event",normalize = TRUE)
  desc::desc_add_remotes("github::kwb-r/kwb.utils",normalize = TRUE)


}

kwb.pkgbuild::create_empty_branch_ghpages(pkg$name)
