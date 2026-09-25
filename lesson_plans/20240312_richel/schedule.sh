#/bin/bash
echo 'espeak -s 120 -p 10 "Start to work"' | at 10:00
echo 'espeak -s 120 -p 10 "time to round off"' | at 10:40
echo 'espeak -s 120 -p 10 "time to have a break"' | at 10:45
echo 'espeak -s 120 -p 10 "back to work"' | at 11:00
echo 'espeak -s 120 -p 10 "time to round off"' | at 11:55
echo 'espeak -s 120 -p 10 "time to have a break"' | at 12:00
echo 'espeak -s 120 -p 10 "Start to work"' | at 13:30
echo 'espeak -s 120 -p 10 "time to stop"' | at 13:45
