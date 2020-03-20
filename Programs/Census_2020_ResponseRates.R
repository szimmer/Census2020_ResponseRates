library(censusapi)
Sys.setenv(CENSUS_KEY=Sys.getenv("CENSUS_API_KEY"))


library(tidyverse)

c2020_rr_vars <- listCensusMetadata(name = "dec/responserate", 
                                 type = "variables",
                                 vintage=2020)

c2020_rr_geo <- listCensusMetadata(name = "dec/responserate", 
                                    type = "geography",
                                    vintage=2020)


# https://2020census.gov/content/dam/2020census/materials/partners/2020-02/response-rate-map-technical-documentation.pdf

c2020_nc_counties <- getCensus(name = "dec/responserate", 
                            vars = c("SUMLEVEL", "GEO_ID", 
                                     "CRRALL", "CRRINT", "DRRINT", "DRRALL",
                                     "RESP_DATE"),
                            region = "county:*", 
                            regionin = "state:37", 
                            vintage = 2020)
