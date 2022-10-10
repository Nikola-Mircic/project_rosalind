"""
Problem: https://rosalind.info/problems/ba1h/

We say that a k-mer Pattern appears as a substring of Text with at most d mismatches if 
there is some k-mer substring Pattern' of Text having d or fewer mismatches with Pattern.

Find all approximate occurrences of a pattern in a string.

Given: Strings Pattern and Text along with an integer d.

Return: All starting positions where Pattern appears as a substring of Text with at most d mismatches.
"""

include("../DataSetReader.jl")

function ApproxPattern(pattern::AbstractString, text::AbstractString, d::Number)  
    result = [] # An array to store starting points

    dism_count = 0 # A variable to count number of dismatches

    p_len = length(pattern) # The length of the pattern
    t_len = length(text) # The length of the text

    for i in 1:(t_len-p_len)
        dism_count = 0
        # Check for dismatches on interval [i, i+j]
        for j in 1:p_len
            if pattern[j] != text[i+j-1]
                dism_count += 1
            end
        end

        # If dism_count is less than d, push position of that pattern to the final array
        if dism_count <= d
            append!(result, i-1)
        end
    end 

    return result
end