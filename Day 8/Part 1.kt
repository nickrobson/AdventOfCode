package xyz.nickr

val pattern = java.util.regex.Pattern.compile("\\\\x([0-9A-Fa-f]{2})")

fun main(args : Array<String>) {
    val file = java.io.File("input")
    val reader = file.bufferedReader()
    var line = reader.readLine()
    var clens = 0
    var alens = 0
    while (line != null) {

        val len = line.length
        var repl = line.substring(1, len-1)
            repl = repl.replace("\\\"", "\"")
            repl = repl.replace("\\\\", "\\")

        val matcher = pattern.matcher(repl)
        var offset  = 0

        while (matcher.find()) {
            var ch = java.lang.Integer.parseInt(matcher.group(1), 16).toChar()
            repl = repl.substring(0, matcher.start() - offset) + ch +
                   repl.substring(matcher.end() - offset)
            offset += matcher.group(1).length + 1
        }
        
        clens += len
        alens += repl.length

        line = reader.readLine()

    }
    println(clens - alens)
}