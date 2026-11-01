for file in mei/*.mei; do
    verovio "$file" \
      --breaks none \
      --adjust-page-height \
      --adjust-page-width \
      --page-margin-top 0 \
      --page-margin-bottom 0 \
      --page-margin-left 20 \
      --page-margin-right 20 \
      --spacing-linear 0.0 \
      --spacing-non-linear 0.0 \
    && magick -background white ${file%.mei}.svg ${file%.mei}.png
done
