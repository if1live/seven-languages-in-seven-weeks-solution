# Io 프로그램을 파일에서 실행해보라.
# 어떤 이름이 주어졌다고 했을 때 그 이름에 해당하는 슬롯을 실행하라.

"Day 1" println

Device := Object clone


Computer := Device clone
Computer calcPrice := method(12 * 1000)
Computer slotNames println

com := Computer clone
com calcPrice println
