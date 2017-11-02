**Losowa próba 1**

+-----------------------------------+-----------------------------------+
| **Przebieg**                      | **Opis**                          |
+===================================+===================================+
| Iteration 1 infected 38 nodes.    | Losowo wybrany wierzchołek, który |
|                                   | uczyniono zaczątkiem              |
| Iteration 2 infected 99 nodes.    | rozprowadzania informacji,        |
|                                   | oznaczono większym rozmiarem i    |
| Iteration 3 infected 1 nodes.     | kolorem czarnym. Widać, że jest   |
|                                   | to dość dobry wierzchołek,        |
| Iteration 4 infected 0 nodes.     | ponieważ ma dużo bezpośrednich    |
|                                   | sąsiadów, którzy pozwalają szybko |
| Iteration 5 infected 0 nodes.     | rozpropagować wiadomość w dwóch   |
|                                   | iteracjach. Iteracja trzecia to   |
| Iteration 6 infected 0 nodes.     | już tylko jeden nowy wierzchołek, |
|                                   | do którego dociera wiadomość.     |
| Iteration 7 infected 0 nodes.     | Podana w ćwiczeniu sieć           |
|                                   | charakteryzuje się tym, że nie do |
| Iteration 8 infected 0 nodes.     | wszystkich wierzchołków w sieci   |
|                                   | można dotrzeć, relacje z          |
| Iteration 9 infected 0 nodes.     | sąsiadami mają tylko w jedną      |
|                                   | stronę.                           |
| Iteration 10 infected 0 nodes.    |                                   |
+-----------------------------------+-----------------------------------+

![/Users/r.makowiecki/DataScienceProjects/RIntroductionSocialNetworks/random1.jpg](media/image1.jpeg){width="6.323830927384077in"
height="4.525713035870516in"}

**Losowa próba 2**

+-----------------------------------+-----------------------------------+
| **Przebieg**                      | **Opis**                          |
+===================================+===================================+
| Iteration 1 infected 1 nodes.     | W tym przypadku wylosowano węzeł  |
|                                   | mało znaczący w sieci, mający     |
| Iteration 2 infected 62 nodes.    | tylko jednego bezpośredniego      |
|                                   | sąsiada, któremu mógł przekazać   |
| Iteration 3 infected 76 nodes.    | informację. Dopiero w drugiej i   |
|                                   | trzeciej iteracji udaje się       |
| Iteration 4 infected 0 nodes.     | dotrzeć do węzłów bardziej        |
|                                   | centralnych w sieci, które        |
| Iteration 5 infected 0 nodes.     | pozwalają szybko rozpropagować    |
|                                   | wiadomość po sieci. W             |
| Iteration 6 infected 0 nodes.     | przeciwieństwie jednak do         |
|                                   | pierwszego przypadku można uznać, |
| Iteration 7 infected 0 nodes.     | że propagowanie informacji po     |
|                                   | sieci w tym przypadku trwa        |
| Iteration 8 infected 0 nodes.     | znacząco dłużej.                  |
|                                   |                                   |
| Iteration 9 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 10 infected 0 nodes.    |                                   |
+-----------------------------------+-----------------------------------+

![/Users/r.makowiecki/DataScienceProjects/RIntroductionSocialNetworks/random2.jpg](media/image2.jpeg){width="6.29375in"
height="4.334199475065617in"}

**Losowa próba 3**

+-----------------------------------+-----------------------------------+
| **Przebieg**                      | **Opis**                          |
+===================================+===================================+
| Iteration 1 infected 12 nodes.    | Trzecia próba pokazuje przypadek, |
|                                   | gdzie węzeł początkowy nie        |
| Iteration 2 infected 125 nodes.   | był mocno centralny, ale          |
|                                   | posiadał sąsiadów, którzy już     |
| Iteration 3 infected 1 nodes.     | tacy byli I w kolejnej iteracji   |
|                                   | pozwolili rozpropagować wiadomość |
| Iteration 4 infected 0 nodes.     | do reszty sieci. Ponownie w       |
|                                   | trzeciej iteracji pozostaje tylko |
| Iteration 5 infected 0 nodes.     | jeden węzeł do „zarażenia".       |
|                                   |                                   |
| Iteration 6 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 7 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 8 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 9 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 10 infected 0 nodes.    |                                   |
+-----------------------------------+-----------------------------------+

![/Users/r.makowiecki/DataScienceProjects/RIntroductionSocialNetworks/random3.jpg](media/image3.jpeg){width="6.29375in"
height="4.708053368328959in"}

**Losowa próba 4**

+-----------------------------------+-----------------------------------+
| **Przebieg**                      | **Opis**                          |
+===================================+===================================+
| Iteration 1 infected 82 nodes.    | W czwartym przypadku wylosowany   |
|                                   | węzeł jest lepszy od tego w       |
| Iteration 2 infected 55 nodes.    | pierwszym, ponieważ już w         |
|                                   | pierwszej iteracji pozwala        |
| Iteration 3 infected 1 nodes.     | rozpropagować informację do       |
|                                   | większości sieci. Nadal jednak    |
| Iteration 4 infected 0 nodes.     | informacja dociera do wszystkich  |
|                                   | możliwych węzłów dopiero w        |
| Iteration 5 infected 0 nodes.     | trzeciej iteracji.                |
|                                   |                                   |
| Iteration 6 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 7 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 8 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 9 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 10 infected 0 nodes.    |                                   |
+-----------------------------------+-----------------------------------+

![](media/image4.jpeg){width="6.294444444444444in"
height="4.506944444444445in"}

**Próba największego "betweenness"**

+-----------------------------------+-----------------------------------+
| **Przebieg**                      | **Opis**                          |
+===================================+===================================+
| Iteration 1 infected 136 nodes.   | W przypadku wybrania węzła o      |
|                                   | najwyższej wyliczonej wartości    |
| Iteration 2 infected 2 nodes.     | betweenness widzimy, jak duże     |
|                                   | znaczenie ma poprawne wybranie    |
| Iteration 3 infected 0 nodes.     | węzła centralnego. Nie dość, że   |
|                                   | trzecia iteracja nie istnieje, to |
| Iteration 4 infected 0 nodes.     | jeszcze miażdżąca większość       |
|                                   | węzłów zostaje „zarażona" już w   |
| Iteration 5 infected 0 nodes.     | pierwszej iteracji. Jest to       |
|                                   | najlepszy wynik dla tej sieci pod |
| Iteration 6 infected 0 nodes.     | względem szybkości propagacji     |
|                                   | danych.                           |
| Iteration 7 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 8 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 9 infected 0 nodes.     |                                   |
|                                   |                                   |
| Iteration 10 infected 0 nodes.    |                                   |
+-----------------------------------+-----------------------------------+

![/Users/r.makowiecki/DataScienceProjects/RIntroductionSocialNetworks/1attempt.jpg](media/image5.jpeg){width="6.294444444444444in"
height="4.5348873578302715in"}

**Dodatek**

W procesie implementacji algorytmu propagacji informacji trzeba było
zadbać o to, żeby nie „zarażać" ponownie już raz odwiedzonego węzła,
ponieważ wtedy ginęła informacja, kiedy po raz pierwszy został on
odwiedzony. Jako że na podanej w zadaniu sieci ciężko było zweryfikować
poprawność działania algorytmu, poniżej umieszczono obrazy przechwycone
dla różnych, losowych sieci, na których algorytm był wizualnie
sprawdzany.

![](media/image6.jpeg){width="5.46875in" height="3.2840277777777778in"}

Powyższy graf pokazuje wycinek rzeczywistości, gdzie istnieją zupełnie
rozłączne sieci. Przypadkowo, jeżeli chcielibyśmy dotrzeć z produktem do
większej części sieci, warto byłoby użyć na przykład węzła 13 w celu
poszerzenia grona odbiorców informacji.

![](media/image7.jpeg){width="5.46875in" height="3.2840277777777778in"}

Kolejny graf pokazuje rzadką sieć, w której dodatkowo zaczęto od dość
nieznaczącego węzła. Duża liczba iteracji pozwoliła jednak dotrzeć do
wszystkich możliwych zakątków sieci. Jeżeli w rzeczywistym przypadku
czasu byłoby mniej (mniejsza liczba iteracji), to należałoby wyliczyć
węzeł o najwyższej wartości betweenness i zacząć propagację od niego.

![](media/image8.jpeg){width="5.842361111111111in"
height="3.5083333333333333in"}

Kolejny przypadek pokazał możliwy przypadek, w którym węzeł początkowy
został wybrany fatalnie, ponieważ węzeł nie miał komu przekazać
informacji. Mimo oderwania od rzeczywistości, przykład pokazuje jeszcze
raz, jak ważna jest kwestia centralności węzła.

![](media/image9.jpeg){width="5.84375in" height="3.5097222222222224in"}

Ostatni przypadek pokazuje teoretyczną sieć o bardzo dużej ilości
powiązań. Taki model może w rzeczywistości być reprezentowany przez małą
społeczność, mocno zżytą z sobą.
