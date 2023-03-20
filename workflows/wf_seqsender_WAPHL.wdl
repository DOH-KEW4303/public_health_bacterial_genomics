version 1.0

workflow seqsender {

  input {
    File      test_fasta
    File      test_config
    File      test_metadata
    String    unique_name
  }

  call seqsender_submit {
    input:
      fasta=test_fasta,
      config=test_config,
      metadata=test_metadata,
      name=unique_name
  }

  output {
    File    out1=seqsender_submit.out1  
    File    out2=seqsender_submit.out2
    File    out3=seqsender_submit.out3
    File    out4=seqsender_submit.out4
    File    out5=seqsender_submit.out5
    File    out6=seqsender_submit.out6
   
    

  }
}

task seqsender_submit {

  input {
    File      fasta
    File      config
    File      metadata
    String    name
  }

  command <<<
 
    seqsender.py submit --unique_name ~{name} --config ~{config} --fasta ~{fasta} --metadata ~{metadata}
    
    
    
    
   
    
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
