onclick ="location.href='http://google.com';"
# same window

onclick ="window.open('http://google.com', '_blank')"

shiny::fluidRow(
  shinydashboard::box(title = "Intro Page", "Some description...", 
      shiny::actionButton(inputId='ab1', label="Learn More", 
                          icon = icon("th"), 
                          onclick ="window.open('http://google.com', '_blank')")
  )
)
# new window
