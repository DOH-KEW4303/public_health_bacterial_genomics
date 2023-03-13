task split_by_clade {
  input {
    File biosample_metadata
    String unique_name
    String docker = "quay.io/broadinstitute/py3-bio:0.1.2"
    Int threads = 6
  }
  command <<<
    # date and version control
    date | tee DATE
    python3<<CODE

    import pandas as pd

    '''Takes biosample_metadata.csv as input and returns tsv file required for seqsender uploads'''
    input = "~{biosample_metadata}"
    output = "~{unique_name}_output.txt"


    df =pd.read_csv(input, sep='\t', header=0)

    seqs=df[df.columns[0]].tolist()
    df = df.replace("-",0)

    done_list=[]
    seq_list =[]
    for i in seqs:
      snp_dist=df[i].tolist()
      res = [idx for idx, val in enumerate(snp_dist) if int(val) <= cluster_dist]

      ids=[]
      for j in res:
        val=df.iloc[j].loc[df.columns[0]]
        ids.append(val)

      if res not in done_list:
        done_list.append(res)
        seq_list.append(ids)

    with open(output, 'w') as fp:
        for li in seq_list:
            for item in li:
                fp.write("%s\t" % item)
            fp.write("\n")
        print('Done')

    CODE
  >>>
  output {
    String date = read_string("DATE")
    File clade_list_file = "~{cluster_name}_output.txt"
    Array[Array[String]] clade_list = read_tsv("~{cluster_name}_output.txt")
  }
  runtime {
    docker: "quay.io/broadinstitute/py3-bio:0.1.2"
    memory: "16 GB"
    cpu: 4
    disks: "local-disk 100 SSD"
    preemptible: 0
    maxRetries: 3
  }
