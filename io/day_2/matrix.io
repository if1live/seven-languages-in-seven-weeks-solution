Matrix := Object clone

Matrix dim := method(x, y,
    data := list()
    for(j, 1, y,
        row := list()
        for(i, 1, x, row append(nil))
        data append(row)
    )

    self data := data
)
Matrix set := method(x, y, value, self data at(y) atPut(x, value))
Matrix get := method(x, y, self data at(y) at(x))
Matrix x := method(self data at(0) size)
Matrix y := method(self data size)

Matrix transpose := method(
    transposeMat := Matrix clone
    transposeMat dim(self y, self x)
    for(j, 0, y-1, for(i, 0, x-1, transposeMat set(j, i, self get(i, j))))
    transposeMat
)

mat := Matrix clone
mat dim(2, 3)
mat set(1, 2, "hello")
mat set(1, 1, "world")

mat data println

mat get(1, 2) println
mat get(1, 1) println

transpose := mat transpose
transpose data println

(mat get(1, 2) == transpose get(2, 1)) println
