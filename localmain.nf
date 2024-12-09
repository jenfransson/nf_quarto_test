workflow {
  ch_input_script = file("quarto_files/localtorender.qmd")
  ch_input_localcode = file("quarto_files/localhelpercode.R")
  
  
  RENDER_QMD_01( ch_input_script,
                 ch_input_localcode)
}

process RENDER_QMD_01 {
  publishDir "quarto_files/",
    mode: "copy"
  
  input:
  path(qmd)
  path(localcode)
  
  output:
  path("localtorender.html")
  
  script:
  """
  quarto render ${qmd}
  """
  
}
