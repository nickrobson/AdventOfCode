<?php

    $ticker = array();

    $ticker_file = fopen("ticker_tape", "r");
    if ($ticker_file) {
        while (($line = fgets($ticker_file)) !== false) {
            $line = trim(preg_replace('/\s+/', ' ', $line));
            $spl = split( ": ", $line, 2  );
            $ticker[$spl[0]] = $spl[1];
        }
        fclose($ticker_file);
    }

    $input_file = fopen("input", "r");
    if ($input_file) {

        while (($line = fgets($input_file)) !== false) {
            $props = array();
            $line = trim(preg_replace('/\s+/', ' ', $line));
            $spl1 = split( ": ", $line, 2  );
            $spl2 = split( ", ", $spl1[1] );
            foreach ($spl2 as $val) {
                $spl3 = split( ": ", $val );
                $props[$spl3[0]] = $spl3[1];
            }
            $okay = true;
            foreach ($props as $key => $value) {
                if ($ticker[$key] != $value) {
                    $okay = false;
                }
            }
            if ($okay) {
                echo $spl1[0] . "\n";
            }
        }

        fclose($input_file);
    }

?>