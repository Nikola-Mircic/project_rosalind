"""
Problem: https://rosalind.info/problems/ba1g/

The number of mismatches between strings p and q is called
the Hamming distance between these strings and is denoted HammingDistance(p, q).

Given: Two DNA strings.

Returns: An integer value representing the Hamming distance.
"""

include("DataSetReader.jl")

function HammingDistance(p::AbstractString, q::AbstractString)
    dis = 0
    for i in 1:length(p)
        if p[i] != q[i]
            dis+=1
        end
    end
    return dis
end