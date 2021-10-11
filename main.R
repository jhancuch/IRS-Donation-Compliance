library(rmarkdown)
library(shiny)
library(htmltools)
    
generateLetters <- function(date, year, dat) {
  names(dat)[1] <- "fname"
  
    for (i in 1:nrow(dat)) {

      if (dat[i, 6] == 1 & dat[i, 5] >= 250) {
        rmarkdown::render("donationsOver250Jacket.Rmd", 
                          output_file = paste0(dat[i, 2], "-", dat[i, 1], "-", year, ".pdf"),
                          params = list(
                            date = date,
                            fname = dat[i, 1],
                            lname = dat[i, 2],
                            address1 = dat[i, 3],
                            address2 = dat[i, 4],
                            donation = dat[i, 5])
                          )
        }
      
      else if (dat[i, 6] == 0 & dat[i, 5] >= 250) {
        rmarkdown::render("donationsOver250NoJacket.Rmd", 
                          output_file = paste0(dat[i, 2], "-", dat[i, 1], "-", year, ".pdf"),
                          params = list(
                            date = date,
                            fname = dat[i, 1],
                            lname = dat[i, 2],
                            address1 = dat[i, 3],
                            address2 = dat[i, 4],
                            donation = dat[i, 5])
        )
      }
      
      else if (dat[i, 6] == 1 & dat[i, 5] < 250) {
        
        rmarkdown::render("donationsJustJacket.Rmd", 
                          output_file = paste0(dat[i, 2], "-", dat[i, 1], "-", year, ".pdf"),
                          params = list(
                            date = date,
                            fname = dat[i, 1],
                            lname = dat[i, 2],
                            address1 = dat[i, 3],
                            address2 = dat[i, 4],
                            donation = dat[i, 5])
        )
      }
    }
}
  


