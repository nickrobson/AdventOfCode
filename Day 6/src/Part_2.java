import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Part_2 {

	public static final Pattern PATTERN = Pattern.compile("(.*?) ([0-9]+,[0-9]+) through ([0-9]+,[0-9]+)");

	public static void main(String[] args) {
		try {
			Integer[][] states = new Integer[1000][];
			for (int x = 0; x < 1000; x++) {
				states[x] = new Integer[1000];
				for (int y = 0; y < 1000; y++)
					states[x][y] = 0;
			}
			BufferedReader reader = new BufferedReader(new FileReader(new File("input")));
			String line;
			while ((line = reader.readLine()) != null) {
				Matcher matcher = PATTERN.matcher(line);
				matcher.find();
				String instr = matcher.group(1);
				String[] pos1 = matcher.group(2).split(",");
				String[] pos2 = matcher.group(3).split(",");
				int[] min = new int[]{ Integer.parseInt(pos1[0]), Integer.parseInt(pos1[1]) };
				int[] max = new int[]{ Integer.parseInt(pos2[0]), Integer.parseInt(pos2[1]) };
				switch (instr) {
					case "toggle":
						for (int x = min[0]; x <= max[0]; x++)
							for (int y = min[1]; y <= max[1]; y++)
								states[x][y] += 2;
						break;
					case "turn on":
						for (int x = min[0]; x <= max[0]; x++)
							for (int y = min[1]; y <= max[1]; y++)
								states[x][y] += 1;
						break;
					case "turn off":
						for (int x = min[0]; x <= max[0]; x++)
							for (int y = min[1]; y <= max[1]; y++)
								states[x][y] = Math.max(0, states[x][y] - 1);
						break;
				}
			}
			reader.close();
			int brightness = 0;
			for (int x = 0; x < 1000; x++)
				for (int y = 0; y < 1000; y++)
					brightness += states[x][y];
			System.out.format("The total brightness is %d.\n", brightness);
		} catch (NumberFormatException | IOException e) {
			e.printStackTrace();
		}
	}

}
