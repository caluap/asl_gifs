# https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/


for i in *.mp4; do

# creates pallete
ffmpeg -i "$i" -filter_complex "[0:v] palettegen" "${i%.*}.png";

# creates low-res version
ffmpeg -i "$i" -filter_complex "[0:v] fps=12,scale=480:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "gifs/${i%.*}.gif";

rm "${i%.*}.png";

done
