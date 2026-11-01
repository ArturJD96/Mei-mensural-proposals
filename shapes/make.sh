for file in shapes/*.ly; do
    lilypond -fpng -o "./shapes/" "$file"
done
