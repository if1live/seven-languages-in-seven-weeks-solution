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
