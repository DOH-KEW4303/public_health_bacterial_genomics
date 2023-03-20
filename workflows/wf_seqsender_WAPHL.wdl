version 1.0

import "../tasks/utilities/task_seqsend_file_prep.wdl" as seqsender

workflow seqsender {

  input {
    File      test_fasta
    File      test_config
    File      test_metadata
    String    unique_name
  }

  call seqsender.seqsender_submit {
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
