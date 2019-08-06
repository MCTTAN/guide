library(leaflet)

ui <- fluidPage(leafletOutput("map"))

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(-100.00, 45.00, zoom = 17)
  })
}

shinyApp(ui, server)
