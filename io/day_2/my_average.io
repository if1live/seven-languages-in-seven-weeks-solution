# 리스트의 슬롯에 myAverage라는 이름의 슬롯을 추가하라.
# 리스트 안에 담긴 순의 평균을 계산하는 슬롯이다.
# 리스트에 아무 수도 담겨 있지 않다면 어떤 일이 일어나야 하는가?
# (보너스 : 만약 리스트에 수가 아닌 값이 담겨 있다면 Io 예외를 발생시켜야 한다)

List myAverage := method(
    if(size == 0, return 0)

    sum := 0
    for(i, 0, size - 1,
        val := at(i)
        if(val type == "Number") then(sum = sum + val) else(Exception raise("Some data is not Number"))
    )
    sum / size
)

data := list(1,2,3,4)
data myAverage println

data := list()
data myAverage println

data := list(0, "one", "two")
data myAverage println
