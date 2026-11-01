\version "2.24.4"
\include "setup.ily"

\score {
    \layout { indent = 2 }
    \new Staff \with {
        \remove Time_signature_engraver
        \remove Clef_engraver
        \hide Staff.StaffSymbol
    } \new Voice  \relative b' {
        \autoBeamOff
        a\breve*1/16 1*1/8 2*1/8 4*1/4 8*1/2 16 \pageBreak
    }
}
