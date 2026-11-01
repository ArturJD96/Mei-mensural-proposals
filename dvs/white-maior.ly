\version "2.24.4"

\include "early/early.ly"
\include "early/mensural.ly"
% \include "early/mensur/mensural.ly" ;; awaiting for merging of the "record" rewritten branch.
#(early:testing-run #f)

\include "setup.ily"

%%%%%%%

notationTypes = \early \relative b'  {


    \mensura "C."

    \whitemensural
    b2 4 4 2 \bar "|" \hide 1
    \whitehollow
    b2. \once \override Dots.transparent = ##t 4. 2

    % b\maxima \longa \breve 1 2 4 8 16 \pageBreak

}

%%%%%%%

\score {
    \earlyLayout
    \new EarlyStaff \with {
        % \remove Time_signature_engraver
        \consists Barline_engraver
        \remove Clef_engraver
        \remove Custos_engraver
        \hide Staff.StaffSymbol
    } \new EarlyVoice {
        \notationTypes
    }
}
