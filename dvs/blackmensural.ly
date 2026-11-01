\version "2.24.4"

\include "early/early.ly"
\include "early/mensural.ly"
% \include "early/mensur/mensural.ly" ;; awaiting for merging of the "record" rewritten branch.
#(early:testing-run #f)

\include "setup.ily"

%%%%%%%

notationTypes = \early \relative b'  {

    \blackmensural
    b\maxima \longa \breve 1 2 4 8 \pageBreak

}

%%%%%%%

\score {
    \new EarlyStaff \with {
        \remove Time_signature_engraver
        \remove Clef_engraver
        \remove Custos_engraver
        \hide Staff.StaffSymbol
    } \new EarlyVoice {
            \notationTypes
    }
}
