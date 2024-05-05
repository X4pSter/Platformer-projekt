## Platforme og player implementation Version 1.0

Denne mappe indholder en ikke færdig implementation spillet med platforme og player.  
Player klassen er viderebygget med hoppe-funktionalitet, tyngdekraft og friktion.   

Men koden til platformene er endnu ikke færdig. I skal selv bygge en platformsklasse.  
Ligesom sidst skal i anvende "single responsibility" og "indkapsling" når i laver plaformsklassen.

### INDKAPSLINGS-PRINCIPPET & SINGLE-RESPONSIBILITY-PRINCIPPET 

Se beskrivelse fra sidst

### Opgaver: 

1. Læs og forstå ( forklar for hinanden) player-koden, der håndterer hoppe-funktionalitet, tyngdekraft og friktion. 
2. I pde-filen kan I se der er implementeret kode til tre forskellige platforme. Forklar, i jeres log-bog, hvorfor det ikke er muligt at fjerne de tre if-statements og kalde "handlePlatformCollision" direkte for hver platform ?
3. Flyt platformer-koden over i en "platformer-klasse" og tilpas resten af koden.
4. Lav en ArrayList, der indeholder dine platforme, og lav et loop der løber igennem listen, og håndterer kaldet til "handlePlatformCollision" for hver enkelt platform...
5. Som I kan se kan man hoppe igennem platformene. Dette er fordi der vi kun laver og håndterer "kollisions-tjek" i bunden af player'en. ( se de små cirkler i toppen og bunden af spilleren ). I metoden "handlePlatformCollision" skal i tjekke om toppen af spilleren rammer en platform. Hvis dette er tilfældet skal I ændre spillerens position, hastighed og acceleration, så spilleren ikke længere kan hoppe igennem platforme!!

**Gå før tid:**   
Hvis I har lavet opgaverne ovenfor må I holde fri efter første lektion ;-)

**Ekstra opgaver:**   
Prøv at se om I kan bygge en Spritesheet-animations klasse og anvende denne i Playeren?   
Hvis du har brug for yderligere udfordringer, kan i lave forskellige typer af animation når spilleren "går", "hopper" eller "står stille"