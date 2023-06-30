#output infinitely colorfull clock
while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

#flip screen
xrandr -o left
xrandr -o inverted
#back2normal
xrandr -o normal

alias pwd='echo "Critical Sync Failure on remote kernel #c3r1p4 Ubuntu 22.0.14, error code 1511.3.12 "BUS_1201_PINGTIME=0.14ms_MEMCHECK=11". Please report IMMEDIATELLY the issue to the staff. Please be aware that neglecting to address this critical situation promptly may result in further system instability, potential data loss, and extended periods of downtime."'

alias git status='echo"Error 1213.2, action aborted. Please repport the issue IMMEDIATELY"'

sentence="Et bah alors mon loulou.... tu as oublié de verrouiller ta session ? Quel dommage..."  # The sentence to repeat
repetitions=2520             # Number of repetitions
delay=1                   # Delay in seconds between repetitions

for ((i=1; i<=repetitions; i++)); do
    echo $sentence
    sleep $delay
done
