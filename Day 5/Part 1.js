var notvowels = java.util.regex.Pattern.compile("[^aeiouAEIOU]+");
var blacklist = java.util.regex.Pattern.compile("ab|cd|pq|xy");
var repeat    = java.util.regex.Pattern.compile("(.)\\1");

function has_three_vowels(str) {
    return notvowels.matcher(str).replaceAll('').length() >= 3;
}

function has_repeat(str) {
    return repeat.matcher(str).find();
}

function has_no_blacklist(str) {
    return !blacklist.matcher(str).find();
}

function is_nice(str) {
    return has_three_vowels(str) && has_repeat(str) && has_no_blacklist(str);
}

function find_nice() {
    var line;
    var count = 0;
    var file = new java.io.File("input");
    var reader = new java.io.BufferedReader(new java.io.FileReader(file));
    while ((line = reader.readLine()) != null)
        if (is_nice(line))
            count++;
    print("There are " + count + " nice strings.");
}

find_nice()