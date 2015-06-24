# 행렬을 파일에 적어놓고,
# 파일로부터 행렬을 읽어 들이는 프로그램을 작성하라.

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
