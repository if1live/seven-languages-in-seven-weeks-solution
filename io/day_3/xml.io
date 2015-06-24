# XML 프로그램의 기능을 개선해서 들여쓰기를 나타내도록 스페이스를 삽입하게 만들어보라.
#
# XML 프로그램의 기능을 개선해서 속성 attribute을 처리하도록 만들라.
# 만약 첫 번째 인자가(중괄호 문법을 이용하는) 맵이라면,
# 속성을 XML 프로그램에 더하라, 예를 들어 book({"author":"Tate"}...)는
# <book author="Tate">를 출력해야 한다.

XmlBuilder := Object clone
XmlBuilder forward := method(
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence", writeln("  " .. content)))
    writeln("</", call message name, ">"))

XmlBuilder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))
