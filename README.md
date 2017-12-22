# StatPorker
This is an statical analysis of Texas hold 'em porker game.

You can easily test this project.
```bash
git clone https://github.com/akawashiro/StatPorker.git
cd StatPorker
stack build
stack exec stat
```
This is an example of output.
```text
Your hands are [D2_,C4_,C5_,C2_,SQ_]
Opoosite hands are [H5_,HK_,C10,C6_,S4_]
Discard cards                        Possbile hands
[]                                  [(HighCards,1)]
[D2_]                              [(HighCards,10)]
[D2_,C2_]                          [(HighCards,45)]
[D2_,C2_,C4_]                     [(HighCards,120)]
[D2_,C2_,C4_,C5_]                 [(HighCards,210)]
[D2_,C2_,C4_,C5_,SQ_] [(HighCards,251),(OnePair,1)]
[D2_,C2_,C4_,SQ_]                 [(HighCards,210)]
[D2_,C2_,C5_]                     [(HighCards,120)]
[D2_,C2_,C5_,SQ_]                 [(HighCards,210)]
[D2_,C2_,SQ_]                     [(HighCards,120)]
[D2_,C4_]                          [(HighCards,45)]
[D2_,C4_,C5_]                     [(HighCards,120)]
[D2_,C4_,C5_,SQ_]                 [(HighCards,210)]
[D2_,C4_,SQ_]                     [(HighCards,120)]
[D2_,C5_]                          [(HighCards,45)]
[D2_,C5_,SQ_]                     [(HighCards,120)]
[D2_,SQ_]                          [(HighCards,45)]
[C2_]                              [(HighCards,10)]
[C2_,C4_]                          [(HighCards,45)]
[C2_,C4_,C5_]                     [(HighCards,120)]
[C2_,C4_,C5_,SQ_]                 [(HighCards,210)]
[C2_,C4_,SQ_]                     [(HighCards,120)]
[C2_,C5_]                          [(HighCards,45)]
[C2_,C5_,SQ_]                     [(HighCards,120)]
[C2_,SQ_]                          [(HighCards,45)]
[C4_]                              [(HighCards,10)]
[C4_,C5_]                          [(HighCards,45)]
[C4_,C5_,SQ_]                     [(HighCards,120)]
[C4_,SQ_]                          [(HighCards,45)]
[C5_]                              [(HighCards,10)]
[C5_,SQ_]                          [(HighCards,45)]
[SQ_]                              [(HighCards,10)]
```
