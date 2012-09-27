%%{
    machine fastq;
    alphtype char;

    action start_qual { qual_begin = p }
    action end_qual { qual = data[qual_begin ... p] }

    action start_seq { seq_begin = p }
    action end_seq { seq = data[seq_begin ... p] }

    action start_seqname { seqname_begin = p }
    action end_seqname { seqname = data[seqname_begin ... p] }

    action end_block {
        yield seqname, seq, qual
    }

    include "fastq.rl";

    write data;
}%% 

def records(data)
    eof = nil
    %%write init;
    %%write exec;
end

fastq = <<FASTQ
@EAS54_6_R1_2_1_413_324
CCCTTCTTGTCTTCAGCGTTTCTCC
+
;;3;;;;;;;;;;;;7;;;;;;;88
@EAS54_6_R1_2_1_540_792
TTGGCAGGCCAAGGCCGATGGATCA
+
;;;;;;;;;;;7;;;;;-;;;3;83
@EAS54_6_R1_2_1_443_348
GTTGCTTCTGGCGTGGGTGGGGGGG
+EAS54_6_R1_2_1_443_348
;;;;;;;;;;;9;7;;.7;393333
FASTQ

records(fastq) do |header, seq, qual|
    puts header
end
