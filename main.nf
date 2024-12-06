workflow {
  ch_input = Channel.fromPath("quarto_files/torender.qmd")
  
  RENDER_QMD_01( ch_input )
}

process RENDER_QMD_01 {
  publishDir "results/"
  
  input:
  path(qmd)
  
  output:
  path("quarto_files/torender.html")
  
  script:
  """
  quarto render ${qmd}
  """
  
}
