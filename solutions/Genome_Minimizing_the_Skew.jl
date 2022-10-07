"""
Problem: https://rosalind.info/problems/ba1f/

Define the skew of a DNA string Genome, denoted Skew(Genome), 
as the difference between the total number of occurrences of 'G' and 'C' in Genome
Let Prefixi (Genome) denote the prefix (i.e., initial substring) of Genome of length i.

Find a position in a genome minimizing the skew.

Given: A DNA string Genome.

Returns: All integer(s) i minimizing Skew(Prefixi (Text)) over all values of i (from 0 to |Genome|).
"""

function Skew(dna::AbstractString)
    result = 0 # Difference between the number of 'G' and the number of 'C' in the i-th prefix
    min_result = 0

    prefixes = [] # Array storing lengths of the prefixes with minimal skew

    foreach(enumerate(split(dna, ""))) do (idx,genome)
        if genome == "C"
            result -= 1
        end
        if genome == "G"
            result += 1
        end

        if min_result == result
            append!(prefixes, idx)
        end
        
        if min_result > result
            min_result = result
            prefixes = [idx]
        end
    end

    return prefixes
end