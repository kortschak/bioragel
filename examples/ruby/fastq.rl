%%{
    machine fastq;

    newline = '\n' | '\r\n';
    qual = [!-~]+ > start_qual % end_qual;
    seq = [^\n]+ > start_seq % end_seq;
    seqname = [^\n]+ > start_seqname % end_seqname;
    required_seqname = seqname ;
    optional_seqname = seqname? ;
    block = '@' required_seqname newline+ seq newline+ 
            '+' optional_seqname newline+
            qual % end_block ;
    main := newline* (block newline+)* block?;
}%% 
