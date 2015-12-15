using System.IO;
using System.Text.RegularExpressions;

public class Ingredient {

    public int cap { get; }
    public int dur { get; }
    public int fla { get; }
    public int tex { get; }

    public Ingredient(int cap, int dur, int fla, int tex) {
        this.cap = cap;
        this.dur = dur;
        this.fla = fla;
        this.tex = tex;
    }

}

string[] lines = File.ReadAllLines("input");

List<Ingredient> ingr = new List<Ingredient>();

Regex regex = new Regex(@"capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+)");

foreach (string line in lines) {
    MatchCollection matches = regex.Matches(line);
    foreach (Match match in matches) {
        int cap = int.Parse(match.Groups[1].Value);
        int dur = int.Parse(match.Groups[2].Value);
        int fla = int.Parse(match.Groups[3].Value);
        int tex = int.Parse(match.Groups[4].Value);
        Ingredient i = new Ingredient(cap, dur, fla, tex);
        ingr.Add(i);
    }
}

long max = 0;

for (int a = 0; a < 101; a++) {
    for (int b = 0; b < 101 - a; b++) {
        for (int c = 0; c < 101 - a - b; c++) {
            int d = 100 - a - b - c;
            long cap = Math.Max(0, a * ingr[0].cap + b * ingr[1].cap + c * ingr[2].cap + d * ingr[3].cap);
            long dur = Math.Max(0, a * ingr[0].dur + b * ingr[1].dur + c * ingr[2].dur + d * ingr[3].dur);
            long fla = Math.Max(0, a * ingr[0].fla + b * ingr[1].fla + c * ingr[2].fla + d * ingr[3].fla);
            long tex = Math.Max(0, a * ingr[0].tex + b * ingr[1].tex + c * ingr[2].tex + d * ingr[3].tex);
            max = Math.Max(max, cap * dur * fla * tex);
        }
    }
}

Console.WriteLine(max);

