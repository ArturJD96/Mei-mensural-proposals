\version "2.24.4"

\paper {
  #(set-paper-size '(cons (* 7 mm) (* 12 mm)))
  right-margin = 1
  left-margin = 1
  top-margin = 1
  bottom-margin = 1

  print-page-number = false
}

\header {
    tagline = ""
}

\layout {
    indent = 0
    \autoLineBreaksOff

    \override Score.SpacingSpanner.packed-spacing = ##t
    % \override Staff.StaffSymbol.stencil = #(early-staff delicate-jagged-line)
    \override Staff.StaffSymbol.thickness = 0.75
    \override Stem.length = 6

    \context { \Staff

        \remove Time_signature_engraver
        \remove Clef_engraver
        \remove Custos_engraver
        \hide Staff.StaffSymbol

    }

}
