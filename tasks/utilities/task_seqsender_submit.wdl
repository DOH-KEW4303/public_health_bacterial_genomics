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
 
    seqsender.py submit --unique_name ~{name} --config ~{config} --fasta ~{fasta} --metadata ~{metadata} --test
    
    
  >>>

  output {
    File    out1="output_files/~{name}/accessions.csv"
    File    out2="output_files/~{name}/biosample_sra/~{name}_biosample_submission.xml"
    File    out3="output_files/~{name}/genbank/submission.xml"
    File    out4="output_files/~{name}/genbank/~{name}_authorset.sbt"
    File    out5="output_files/~{name}/genbank/~{name}_ncbi.fsa"
    File    out6="output_files/~{name}/genbank/~{name}_source.src"
    
    
  }

  

  runtime {
    docker:       "kwaterman/seqsender:0.1_Beta"
    memory:       "8 GB"
    cpu:          2
    disks:        "local-disk 100 SSD"
    preemptible:  1
  }
  
  }
  
  task seqsender_update {

  input {
    File      report
    String    docker="kwaterman/seqsender:0.1_Beta"
  }

  command <<<

    seqsender.py update_submissions


  >>>



  runtime {
    docker:       "~{docker}"
    memory:       "8 GB"
    cpu:          2
    disks:        "local-disk 100 SSD"
    preemptible:  1
  }

  }
