package main

import (
    "fmt"
    "io/ioutil"
    "strconv"
)

func check(err error) {
    if err != nil {
        panic(err)
    }
}

func main() {
    dat, err := ioutil.ReadFile("input")
    fmt.Println(string(dat))
    input := string(dat)
    check(err)
    fmt.Println("Input: " + input)

    str := input
    for x := 0; x < 50; x++ {
        if x % 5 == 0 && x != 0 {
            fmt.Print(" ")
        }
        fmt.Print(".")
        count, n := 0, rune(-1)
        newstr := ""
        for _, m := range str {
            if n != m {
                if count > 0 {
                    newstr += strconv.Itoa(count) + string(n)
                }
                n = m
                count = 0
            }
            count++
        }
        newstr += strconv.Itoa(count) + string(n)
        if x == 39 {
            fmt.Println()
        }
        str = newstr
    }
    fmt.Println("Length: " + strconv.Itoa(len([]rune(str))))
}