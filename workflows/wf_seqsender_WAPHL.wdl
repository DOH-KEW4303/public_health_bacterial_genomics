version 1.0

import "../tasks/utilities/task_seqsender_submit.wdl" as seqsender


workflow seqsender {

  input {
    File      seq_fasta
    File      default_config
    File      biosample_metadata
    String    unique_name
  }

  call seqsender.seqsender_submit {
    input:
      fasta=seq_fasta,
      config=default_config,
      metadata=biosample_metadata,
      name=unique_name
  }
  
  call seqsender.seqsender_update {
    input:
      report= seqsender_submit.out2
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
