# MEI's @notationtype and @notationsubtype

MEI encodes flavour of Mensural notation at `<staffDef>`'s `@notationtype` attribute. In MEI 5.1 and 6.0-dev defines [values](https://music-encoding.org/guidelines/dev/mei-mensural/data-types/data.NOTATIONTYPE.html):
* `"mensural"`
* `"mensural.black"`
* `"mensural.white"`

Additionally, MEI provides `@notationsubtype` attribute allowing for additional free description.

We see that this attribute, rightly so, is used e.g. by Verovio to adjust the visual aspects of the score. It provides a clue for _what visual features needs to be engaged to express durational value of a note_.

This GitHub issue proposes to extend coverage of `@notationtype` values to more types of mensural notation based on existing repertoire.

# Prelimianry literature

I base my terminology on the following sources:

* M. Bent, _Principles of mensuration and coloration: virtuosity and anomalies in the Old Hall manuscript_.

* P. Kolb, Divisions of dots and dots of division: history, theory, and practice

# Example sources

The following examples show different flavours of what could be encoded using `@notationtype`.

| Century | Source | Notation |
|:----:|:------:|:--------:|
| XIV | [Tournai](https://www.diamm.ac.uk/sources/7/)<br>p. 1 | ![](examples/Messe_de_Tournai_B-Tc_476_p1.png) |
| XIV | [Chantilly](https://www.diamm.ac.uk/sources/201/)<br>f. 44 | ![](examples/Cuvelier_En_la_saison_Codex_Chantilly_f44.png) |
| XV | [I-Bc Q15](https://www.diamm.ac.uk/sources/117/)<br>f. 169v | ![](examples/Dufay_Benedicamus_II_I-Bc_Q15_169v-170.png) |
| XV | [Trent 87](https://www.diamm.ac.uk/sources/807/)<br>f. 219v | ![](examples/Conditor_Alme_Siderum_Tr87_219v-220r.png) |
| XV | [Old Hall](https://www.diamm.ac.uk/sources/210/#/images)<br>f. 44 | ![](examples/Credo_Old_Hall_f44.png) |
| XV | [Aosta](https://www.diamm.ac.uk/sources/112/)<br>f. 232 | ![](examples/Power_Gloria_I_AO_Cod15_Aosta_Manuscript_f232_FULL.png) |
| XV | [Chigi](https://www.diamm.ac.uk/sources/943/)<br>f. 104 | ![](examples/Ockeghem_Sanctus_Prolationum_Chigi_Codex_f104_altus_bassus.png) |
| XVI | [Ed. Attaignan](https://ks15.imslp.org/files/imglnks/usimg/a/ab/IMSLP64609-PMLP131631-AttaignantOrgue.pdf)<br>p. 2 | ![](examples/Ed_P_Attaignant_Tabulature_pour_le_jeu_d_ogues_p2.png) |
| XVII | [Frescobaldi](https://ks15.imslp.org/files/imglnks/usimg/d/db/IMSLP304590-PMLP181690-Frescobaldi_-_Fiori_Musicali_-Alessandro_Vincenti,_1635-.pdf)<br>p. 92 | ![](examples/Frescobald_La_Bergamasca_Fiori_Musicali_p92.png) |

> [!tip]
> Please suggest more!

# Logical features of mensural rhythm

The following section brings a selection of logical information. This information is encoded using various visual clues, depending on the notation going much beyond the \"white- vs black-\" mensural distinction.

### Durational Value Sequence (DVS) 

| `@notationtype` | expected DVS (lilypond) | Verovio 6.3.0 |
|:---------------:|:------------:|:-------------:|
| `cmn`           | ![](./dvs/cmn.png) | ![](mei/cmn.png) |
| `mensural`      | ![](./dvs/whitemensural.png) | ![](mei/mensural.png) |
| `mensural.white`      | ![](./dvs/whitemensural.png) | ![](mei/mensural-white.png) |
| `mensural.black`      | ![](./dvs/blackmensural.png) | ![](mei/mensural-black.png)<br>_(semifusa renders incorrectly)_ |


A *durational value* [^1] (short: \"**value**\") is a *logical* property of a note that indicates the note's position in an ordered sequence of progressively finer durational values (short: \"**DVS**\").

DVS is expressed using the visual features:
* *shape* (breve, whole, half)
* *fill* (half, quarter)
* *flags* amount (quater, 8th, 16th...)

In Common Music Notation, each value consists of two smaller values. In mensural notation, those complexities are govern by the **mensura**. 

### PROPOSAL 1 – void notation

The void notation (term after Bent) works similar to black notation except all notes are not filled. It can be found in XV c. as well as in early XVI prints.

This notation is often conflated with XVI c. white mensural notation. However, it is behaves more like a black notation's subtype with colors reversed.

**Unlike _white_** notation, the polychrome version of the void notation uses different pigment-coding for mensural `color` (see next section).

**Unlike _black_** notation, it may contain opposite-filled noteheads denoting smaller durations values. Those minute values appear rarely in XV, but more often in XVI century.

| Notation | expected DVS (lilypond) | examples | comment |
|:--------:|:-----------------------:|:-------:|:-------:|
| `mensural.void` | ![](./dvs/whitevoid.png) | ![](examples/Conditor_Alme_Siderum_Tr87_219v-220r.png)<br>![](examples/Ed_P_Attaignant_Tabulature_pour_le_jeu_d_ogues_p2.png) | Where exactly duple proportion is encoded? Only when second flag appears?

> [!caution]
> Is there any example where notes become black after addition of the first flag?
> ![](./dvs/whitevoid-hypothetical.png)
> This appears in white mensural notation (sic!) when mensura has `prolatio maior`. See further example with Ockeghem.

### PROPOSAL 2 – monochrome vs polychrome

Those terms come from M. Bent, _Principles of mensuration and coloration: virtuosity and anomalies in the Old Hall manuscript_.

Mensural notation can use additional pigment denoting a mensural `color`. It allows to mark two categories of mensural operations:
* imperfection, sesquialtera or \"color minor\"
* duple proportion

Understanding the meaning of color depends heavily on what kind of mensural notation is applied. Thus, application of color should be at least mentioned in MEI documentation. 

| Feature | ex. | default | color | duple |
|:-:|:-:|:-:|:-:|:-:|
| black monochrome<br>(./older) | ![](examples/Messe_de_Tournai_B-Tc_476_p1.png) | ⚫ | — | — |
| black polychrome | ![](./examples/Cuvelier?_En_la_saison_Codex_Chantilly_f44.png) | ⚫ | 🔴 🔵 | ⚪ ⭕ |
| black monochrome<br>(./decolorized) | ![](examples/Dufay_Benedicamus_II_I-Bc_Q15_169v-170.png) | ź | ⚪ | ⚪ |
| void | ![](./examples/Conditor_Alme_Siderum_Tr87_219v-220r.png)![](examples/Ed_P_Attaignant_Tabulature_pour_le_jeu_d_ogues_p2.png) | ⚪ | ⚫ | ⚫? |
| void polychrome | ![](./examples/Power_Gloria_I_AO_Cod15_Aosta_Manuscript_f232.png) | ⚪ | ⭕ | ⚫ 🔴 |
| "white" | ![](./examples/Josquin_Ave_Maria_snippet.png) | ⚪⚫ | ⚫ | — |

Note:
* Black monochrome appears here twice. The "older" version was suitable for pieces from before rhythmic of late XIV c. The "decolorized" version is a type of notation where advanced mensural features (like duple void proportion) are used but using pigment is avoided.
* blue notation 🔵 appears exclusively in Old Hall codex.
* Void polychrome notation is very rare and is usually a result of a transcription (see Bent's remarks on Aosta manuscript).

### ISSUE – encoding white mensural prolatio maior – add to guidelines!

`Prolatio maior` notation retains many old spelling idioms. Consider this example:

![](./examples/Ockeghem_Sanctus_Prolationum_Chigi_Codex_f104_altus_bassus.png)

Here, two concurrent DVS are used:
||||
|:-:|:-:|:-:|
| 1. | ![](./dvs/whitevoid-hypothetical.png) | Stemmed void semiminims are void and appear after dotted minims. |
| 2. | ![](./dvs/whitemensural.png) | Semiminims are filled and stemless.

This idiom can be well-found still even in XVII century:

![](./examples/Frescobald_La_Bergamasca_Fiori_Musicali_p92.png)

How DVS is represented vary greatily depending on notation:

|  | ex. | DVS |
|:-:|:-:|:-:|
| black monochrome (./older) | ![](examples/Messe_de_Tournai_B-Tc_476_p1.png) | ![](dvs/blackmensural-ancient.png) |
| black monochrome | ![](./examples/Dufay_Benedicamus_II_I-Bc_Q15_169v-170.png)![](examples/Cuvelier?_En_la_saison_Codex_Chantilly_f44.png) | ![](dvs/blackmensural.png)![](dvs/blackmensural-noflags.png) |
| void | ![](./examples/Conditor_Alme_Siderum_Tr87_219v-220r.png)![](examples/Power_Gloria_I_AO_Cod15_Aosta_Manuscript_f232.png)![](examples/Ed_P_Attaignant_Tabulature_pour_le_jeu_d_ogues_p2.png) | ![](dvs/whitevoid.png) |
| "white" | ![](./examples/Josquin_Ave_Maria_snippet.png) | ![](dvs/whitemensural.png)![](dvs/blackmensural.png)![](dvs/whitevoid-hypothetical.png) |

## Dots

Mei has:
* augmentationis
* divisionis

Why not also:
* perfectionis, imperfectionis, alterationis, syncopationis, additionis (Tinctoris)
* transportationis (Gaffurius)

# Footnotes

[^1]: Two terms are used within MEI documentation:
1) [data.DURATION.mensural](https://music-encoding.org/guidelines/dev/mei-mensural/data-types/data.DURATION.mensural.html)
2) [B4 Repertoire: Mensural Notation](https://music-encoding.org/guidelines/dev/mei-mensural/content/mensural.html#mensuralRules) guideline uses term \"degree\" is used (e.g. \"next smaller degree\")
