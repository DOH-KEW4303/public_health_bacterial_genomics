version 1.0

task update_submissions {

  input {
  
    String    docker="kwaterman/seqsender:0.1_Beta"
  }

  command <<<
 
    seqsender.py update_submissions
    
    
  >>>

  

  runtime {
    docker:       "kwaterman/seqsender:0.1_Beta"
    memory:       "8 GB"
    cpu:          2
    disks:        "local-disk 100 SSD"
    preemptible:  1
  }
  
  }
