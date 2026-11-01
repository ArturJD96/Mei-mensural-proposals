\version "2.24.4"

\include "early/early.ly"
\include "early/mensural.ly"
% \include "early/mensur/mensural.ly" ;; awaiting for merging of the "record" rewritten branch.
#(early:testing-run #f)

%%%%%%%

notationTypes = \early \relative b'  {

    % \mark "White mensural"
    \whitemensural
    b\maxima \longa \breve 1 2 4 8 16 \pageBreak

    % \mark "Blackmensural"
    \blackmensural
    b\maxima \longa \breve 1 2 4 8 16 \pageBreak

    \whitehollow
    b\maxima \longa \breve 1 2 4 8 16 \pageBreak

}

%%%%%%%

\paper {
  #(set-paper-size '(cons (* 28 mm) (* 12 mm)))
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
    \enablePolymeter % should be by default I think...?
    indent = 0
    \autoLineBreaksOff

    \override Score.SpacingSpanner.packed-spacing = ##t
    \override EarlyStaff.StaffSymbol.stencil = #(early-staff delicate-jagged-line)
    \override Staff.StaffSymbol.thickness = 0.75
    \override Stem.length = 6

    %% Colors.
%     \override Staff.NoteHead.color = #'white
%     \override Voice.NoteHead.color = #'white
%
%     \override EarlyStaff.NoteHead.color = #'white
%     \override EarlyVoice.NoteHead.color = #'white

}
