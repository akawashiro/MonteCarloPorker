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
Your hands are [D5_,C6_,D10,S3_,C4_]
Opoosite hands are [D3_,DQ_,C3_,D4_,CJ_]
Open cards are [H3_,HQ_,D6_,D7_]
Discard cards                                                                                                                             Possbile hands
[]                                                                                                                                        [(Straight,1)]
[S3_]                                                                                                                          [(Straight,17),(Flush,3)]
[S3_,C4_]                                                            [(OnePair,28),(TwoPair,71),(ThreeOfAKind,9),(Straight,20),(Flush,54),(FullHouse,8)]
[S3_,C4_,D5_]                                                   [(OnePair,218),(TwoPair,536),(ThreeOfAKind,72),(Straight,96),(Flush,123),(FullHouse,95)]
[S3_,C4_,D5_,C6_]         [(HighCards,234),(OnePair,1221),(TwoPair,1127),(ThreeOfAKind,92),(Straight,641),(Flush,1461),(FullHouse,68),(StraightFlush,1)]
[S3_,C4_,D5_,C6_,D10] [(HighCards,720),(OnePair,3436),(TwoPair,2976),(ThreeOfAKind,130),(Straight,1888),(Flush,6230),(FullHouse,106),(StraightFlush,18)]
[S3_,C4_,D5_,D10]                         [(OnePair,812),(TwoPair,1943),(ThreeOfAKind,297),(Straight,417),(Flush,893),(FullHouse,482),(StraightFlush,1)]
[S3_,C4_,C6_]                                   [(HighCards,29),(OnePair,184),(TwoPair,190),(ThreeOfAKind,18),(Straight,165),(Flush,544),(FullHouse,10)]
[S3_,C4_,C6_,D10]          [(HighCards,157),(OnePair,928),(TwoPair,983),(ThreeOfAKind,78),(Straight,1169),(Flush,1461),(FullHouse,68),(StraightFlush,1)]
[S3_,C4_,D10]                                                  [(OnePair,168),(TwoPair,474),(ThreeOfAKind,60),(Straight,220),(Flush,123),(FullHouse,95)]
[S3_,D5_]                                                            [(OnePair,50),(TwoPair,78),(ThreeOfAKind,12),(Straight,41),(Flush,3),(FullHouse,6)]
[S3_,D5_,C6_]                                    [(HighCards,77),(OnePair,343),(TwoPair,222),(ThreeOfAKind,14),(Straight,344),(Flush,136),(FullHouse,4)]
[S3_,D5_,C6_,D10]          [(HighCards,276),(OnePair,1148),(TwoPair,883),(ThreeOfAKind,22),(Straight,1441),(Flush,1066),(FullHouse,8),(StraightFlush,1)]
[S3_,D5_,D10]                                                   [(OnePair,220),(TwoPair,415),(ThreeOfAKind,66),(Straight,297),(Flush,78),(FullHouse,64)]
[S3_,C6_]                                                                                                                    [(Straight,136),(Flush,54)]
[S3_,C6_,D10]                                                                                                [(Straight,1000),(Flush,136),(FullHouse,4)]
[S3_,D10]                                                                                                       [(Straight,181),(Flush,3),(FullHouse,6)]
[C4_]                                                                                                [(TwoPair,15),(Straight,1),(Flush,3),(FullHouse,1)]
[C4_,D5_]                                                                                          [(TwoPair,161),(Straight,6),(Flush,3),(FullHouse,20)]
[C4_,D5_,C6_]                                                                     [(OnePair,218),(TwoPair,670),(Straight,96),(Flush,136),(FullHouse,20)]
[C4_,D5_,C6_,D10]                                            [(OnePair,807),(TwoPair,2511),(Straight,411),(Flush,1081),(FullHouse,34),(StraightFlush,1)]
[C4_,D5_,D10]                                                                                   [(TwoPair,863),(Straight,47),(Flush,57),(FullHouse,173)]
[C4_,C6_]                                                                             [(OnePair,28),(TwoPair,86),(Straight,20),(Flush,54),(FullHouse,2)]
[C4_,C6_,D10]                                                                    [(OnePair,168),(TwoPair,592),(Straight,224),(Flush,136),(FullHouse,20)]
[C4_,D10]                                                                                         [(TwoPair,145),(Straight,22),(Flush,3),(FullHouse,20)]
[D5_]                                                                                                          [(TwoPair,17),(Straight,2),(FullHouse,1)]
[D5_,C6_]                                                                              [(OnePair,50),(TwoPair,95),(Straight,41),(Flush,3),(FullHouse,1)]
[D5_,C6_,D10]                                                                      [(OnePair,220),(TwoPair,530),(Straight,303),(Flush,85),(FullHouse,2)]
[D5_,D10]                                                                                                   [(TwoPair,136),(Straight,35),(FullHouse,19)]
[C6_]                                                                                                                          [(Straight,17),(Flush,3)]
[C6_,D10]                                                                                                       [(Straight,186),(Flush,3),(FullHouse,1)]
[D10]                                                                                                                      [(Straight,19),(FullHouse,1)]
```
