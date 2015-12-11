var otot = java.util.regex.Pattern.compile("(.)(.).*\\1\\2");
var oto  = java.util.regex.Pattern.compile("(.).\\1");

function one_two_one_two(str) {
    return otot.matcher(str).find();
}

function one_two_one(str) {
    return oto.matcher(str).find();
}

function is_nice(str) {
    return one_two_one_two(str) && one_two_one(str);
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