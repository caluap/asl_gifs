for i in *.gif; do

ffmpeg -i "$i" -vf "scale=iw/2.5:ih/2.5" "./reduced/$i";

done
