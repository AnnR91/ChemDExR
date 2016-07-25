
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("ChemDExR - Chemical Data Exploration in R"),

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
    tableOutput('data')
  )
))


shinyServer(function(input, output) {
  output$data <- renderTable({
    
    inFile <- input$file
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header = input$header,
             sep = input$sep, quote = input$quote)
  })
})


# shinyApp(ui=ui, server=server)
