workflow {
  ch_input_script = Channel.fromPath("quarto_files/torender.qmd")
  ch_input_code = Channel.fromPath("r_code/helpercode.R")
  ch_input_localcode = Channel.fromPath("quarto_files/localhelpercode.R")
  
  
  RENDER_QMD_01( ch_input_script,
                 ch_input_localcode, 
                 ch_input_code)
}

process RENDER_QMD_01 {
  publishDir "results/"
  
  input:
  path(qmd)
  path(localcode)
  path(code)
  
  output:
  path("quarto_files/torender.html")
  
  script:
  """
  quarto render ${qmd}
  """
  
}
