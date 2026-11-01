for file in noteheads/*.ly; do
    lilypond -fpng -o "./noteheads/" "$file"
done
