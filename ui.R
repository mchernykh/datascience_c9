shinyUI(bootstrapPage(
  
  selectInput(inputId = "depth",
              label = "Choose \"depth\" of your tree!",
              choices = 1:10,
              selected = 4),
  
  sliderInput(inputId = "angle",
              label = "Rotate leaves by slight angle!",
              min = 0, max = 3.1, value = 0.3, step = 0.02),
  
   checkboxInput(inputId = "clwd",
                 label = "Use constant line width if you wish",
                 value = FALSE),
   
  plotOutput(outputId = "main_plot", height = "600px", width = "600px"),
  
 #  Display this only if the clwd is set
   conditionalPanel(condition = "input.clwd == true",
                    sliderInput(inputId = "lwd",
                                label = "Width of lines to draw a tree:",
                                min = 1, max = 5, value = 1, step = 1)
   )
  
))