# 2차원 리스트를 위한 프로토타입을 작성하라.
# dim(x, y) 메소드는 x개의 요소를 갖는 y번째 리스트를 할당해야한다.
# set(x, y, value)는 값을 설정하고
# get(x, y)는 해당 좌표의 값을 리턴한다.
#
# 보너스: 원래 리스트와 새로운 리스트 사이에
# (new_matrix get(y, x)) == matrix get(x, y)라는 등식이 성립하도록
# 전치 transpose 행렬 메소드를 작성하라.

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
