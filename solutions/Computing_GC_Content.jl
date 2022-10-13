"""
Problem: https://rosalind.info/problems/gc/

The GC-content of a DNA string is given by the percentage of symbols in the 
string that are 'C' or 'G'. For example, the GC-content of "AGCTATAG" is 37.5%. 
Note that the reverse complement of any DNA string has the same GC-content.

Given: At most 10 DNA strings in FASTA format (of length at most 1 kbp each).

Return: The ID of the string having the highest GC-content, followed by the GC-content
        of that string. Rosalind allows for a default error of 0.001 in all decimal answers 
        unless otherwise stated; please see the note on absolute error below.
"""

function GCContent(dna::AbstractString)
    n = length(dna)

    count = 0.0

    for i in 1:n
        if dna[i] == 'G' || dna[i] == 'C'
            count += 1.0
        end
    end

    return count/n*100
end

function FindMaxGCContent(input::Array)
    input_len = length(input)
    max_count = 0;
    max_dna_id = "";

    for i in 1:floor(Int, input_len/2)
        count = GCContent(input[2*i])
        if count >= max_count
            max_count = count
            max_dna_id = input[2*i-1]
        end
    end

    println(max_dna_id)
    println(max_count)
end