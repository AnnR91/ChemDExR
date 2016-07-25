
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  tags$head(),

  # Application title
  tags$h1(tags$strong("ChemDExR")," - Chemical Data Exploration in R"),
  tags$h4("Tool for data analysis .... "),
  
  tags$br(),
 

  # Uploading files
      fileInput('file', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      ),
  tags$hr(),
  checkboxInput('header', 'Header', TRUE),
  radioButtons('sep', 'Separator',
               c(Comma=',',
                 Semicolon=';',
                 Tab='\t'),
               ','),
  radioButtons('quote', 'Quote',
               c(None='',
                 'Double Quote'='"',
                 'Single Quote'="'"),
                '"'),
  tags$hr(),
  
  mainPanel(
    tableOutput('file')
  )
))


shinyServer(function(input, output) { })
  
  

shinyApp(ui=shinyUI, server=shinyServer)
