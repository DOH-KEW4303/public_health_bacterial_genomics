version 1.0

task seqsender_submit {

  input {
    File      fasta
    File      config
    File      metadata
    String    name
    String    docker="kwaterman/seqsender:0.1_Beta"
    
  }

  command <<<
 
    seqsender.py submit --unique_name ~{name} --config ~{config} --fasta ~{fasta} --metadata ~{metadata} 
    sleep 20m
    seqsender.py update_submissions
    
  >>>

  output {
    File    out1="output_files/~{name}/accessions.csv"
    File    out2="output_files/~{name}/biosample_sra/~{name}_biosample_submission.xml"
    File    out3="output_files/~{name}/biosample_sra/~{name}_biosample_report.xml"
    File    out4="output_files/~{name}/genbank/submission.xml"
    File    out5="output_files/~{name}/genbank/~{name}_authorset.sbt"
    File    out6="output_files/~{name}/genbank/~{name}_ncbi.fsa"
    File    out7="output_files/~{name}/genbank/~{name}_source.src"
    
    
  }

  

  runtime {
    docker:       "kwaterman/seqsender:0.1_Beta"
    memory:       "8 GB"
    cpu:          2
    disks:        "local-disk 100 SSD"
    preemptible:  1
  }
  
  

  }
