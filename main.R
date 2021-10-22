library(rmarkdown)
library(shiny)
library(htmltools)
    
generateLetters <- function(date, year, tax_year, dat, directory) {
  names(dat)[1] <- "fname"
  
    for (i in 1:nrow(dat)) {

      if (dat[i, 5] == 1) {
        rmarkdown::render("donation-jacket.Rmd", 
                          output_file = paste0(dat[i, 2], "-", dat[i, 1], "-", year, ".pdf"),
                          params = list(
                            send_date = date,
                            ty = tax_year,
                            fname = dat[i, 1],
                            lname = dat[i, 2],
                            donation = dat[i, 3],
                            date = dat[i, 5],
                            directory = directory)
                          )
        }
      
      else {
        rmarkdown::render("donation-no-jacket.Rmd", 
                          output_file = paste0(dat[i, 2], "-", dat[i, 1], "-", year, ".pdf"),
                          params = list(
                            send_date = date,
                            ty = tax_year,
                            fname = dat[i, 1],
                            lname = dat[i, 2],
                            donation = dat[i, 3],
                            date = dat[i, 5],
                            directory = directory)
                          )
      }
    }
}
  


