import java.security.MessageDigest;

class Part1 {

    static md5(s) {
        MessageDigest digest = MessageDigest.getInstance("MD5")
        digest.update(s.bytes)
        new BigInteger(1, digest.digest()).toString(16).padLeft(32, '0')
    }

    static main(args) {
        def input = "yzbqklnj"
        def n = 1
        while(true) {
            if (md5(input + n).startsWith("000000")) {
                println n
                break;
            }
            n++
        }
    }

}