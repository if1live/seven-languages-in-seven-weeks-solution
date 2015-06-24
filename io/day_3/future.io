futureResult := URL with("http://google.com") @fetch

writeln("This will block until the result is available")

writeln("fetched ", futureResult size, " bytes")
