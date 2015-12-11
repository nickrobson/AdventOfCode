package xyz.nickr

fun main(args : Array<String>) {
    val file = java.io.File("input")
    val reader = file.bufferedReader()
    var line = reader.readLine()
    var clens = 0
    var alens = 0
    while (line != null) {
     
        clens += line.length
        alens += ('"' + line.replace("\\", "\\\\").replace("\"", "\\\"") + '"').length

        line = reader.readLine()

    }
    println(alens - clens)
}