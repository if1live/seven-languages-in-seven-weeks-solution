readMatrix := method(filename,
    mat := list()

    f := File open(filename)
    while(true,
        line := f readLine
        if(line == nil, break)
        row := line split(" ")
        mat append(row)
    )
    f close
    mat
)

mat := readMatrix("matrix.txt")
mat println
