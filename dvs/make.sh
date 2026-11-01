for file in rvs/*.ly; do
    lilypond -fpng -o "rvs/" "$file"
done
