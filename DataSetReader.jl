"""
This is a function to read the dataset.

How to use it:
    1) Include this file to your program 
    2) Download dataset from the website
    3) Call this function with the path to the dataset as the parameter
        and store the result of the function in two separate variables

Example:
    include("DataSetReader.jl")

    data1, data2 = ReadDataset("pathToDataset")
"""

function ReadDataset(path::String)
    io = open(path, "r")
    
    file_content = read(io, String)

    dataset = split(file_content, "\n");

    return (dataset[1], dataset[2])
end