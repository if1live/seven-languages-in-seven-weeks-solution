# XML 프로그램의 기능을 개선해서 들여쓰기를 나타내도록 스페이스를 삽입하게 만들어보라.
#
# XML 프로그램의 기능을 개선해서 속성 attribute을 처리하도록 만들라.
# 만약 첫 번째 인자가(중괄호 문법을 이용하는) 맵이라면,
# 속성을 XML 프로그램에 더하라, 예를 들어 book({"author":"Tate"}...)는
# <book author="Tate">를 출력해야 한다.

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg, r doMessage(arg))
    r
)

Sequence : := method(
    key := self
    value := call message asSimpleString removePrefix(": \"") removeSuffix("\"")
    call sender atPut(key, value)
)

sampleMap := {"a" : "b"}
sampleMap keys println
sampleMap values println


XmlBuilder := Object clone
XmlBuilder depth := 0

XmlBuilder writeIndent := method(for(i, 1, self depth, write("  ")))

XmlBuilder forward := method(
    arguments := call message arguments
    if(arguments at(0) name == "curlyBrackets",
        attributesMessage := arguments removeFirst
        attributes := doMessage(attributesMessage),
        attributes := Map clone)

    self writeIndent
    write("<", call message name)

    if(attributes isEmpty not,
        attributes foreach(k, v, write(" \"" .. k .. "\"=\"" .. v .. "\"")))

    writeln(">")

    self depth = self depth + 1
    arguments foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence",
            self writeIndent
            writeln(content)))
    self depth = self depth - 1

    self writeIndent
    writeln("</", call message name, ">"))


XmlBuilder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))


XmlBuilder books(
    book("Io"),
    book({"author":"Tate"}, "Lua"),
    book({"author":"Tate", "price":"1000"}, "JavaScript"))
