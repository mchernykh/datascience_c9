shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    
    plot(0:10, 0:10, type = "n", main = "Here is your tree!")
    colors <- colorRamp(c("#05B311", "#F2BE2E"))
    
    ang <- input$angle
    rotMatrix <- function(angle) {
      matrix(c(cos(angle), sin(angle), -sin(angle), cos(angle)), 2, 2)
    }
    drawLines <- function (depth, root, direction) {
      if (!depth %in% 1:15) {
        return()
      }
      lwd <- ifelse(input$clwd, input$lwd, depth + 1)
      color <- rgb(colors(depth / as.numeric(input$depth)) / 255)
      lines(c(root[1], root[1] + direction[1]), c(root[2], root[2] + direction[2]), lwd = lwd, col = color)
      
      new_root <- root + direction / 2
      direction <- direction * 2 / 3
      
      new_direction_one <- rotMatrix(ang) %*% direction
      new_direction_two <- rotMatrix(-ang) %*% direction
      new_depth <- depth - 1
      drawLines(new_depth, new_root, new_direction_one)
      drawLines(new_depth, new_root, new_direction_two)      
    }
    
    drawLines(as.numeric(input$depth), c(5, 0), c(0, 7))      
  })
})
