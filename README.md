
## Objectius:

- Comprensió de l'equació de transmissió (Friis) en espai lliure.
- Programació amb MATLAB d'expressions senzilles i les seves possibilitats de
representació gràfica.
- Realització de regressió lineal de dades amb ajut de MATLAB.
- Cal·libració de l’analitzador d’espectres.


Preparació pràctica: Estudio previ.
Estudieu  la fórmula de  Friis  en  espai  lliure  en  lineal  i  en  logarítmic.  Feu  un  script  en
matlab  per  representar  la  potència  rebuda  dBm  per  un  vector  de  distàncies  de  1  m  a
1000 m. Deixeu-lo en funció de la resta de paràmetres.


## Dades:

## P
## TX
= 20dBm, G
## TX
=6 dB, G
## RX
= 3 dB, f=2.4 GHz



Treball al laboratori:

- Executeu la rutina matlab davant del professor.

- Regressió lineal.

Es  disposa  d'unes  mesures  realitzades  al  campus  de  la  URV d'un  enllaç  a  2.45 GHz
entre  dues  antenes  monopol  situades  a  diferents  altures  del terra.  Les  mesures  de  les
potències  rebudes  a  la  sortida  del  receptor  en  funció  de  la  distància  es  troben  en  els
fitxers següents: mesura_0_15m.mat (altura 0.15 m) y mesura_2m.mat (altura2 m).

Cada fitxer conté dues variables: la distancia: d, la potencia rebuda mesurada en dBm
per cada distancia: p.

Es pretenen mitjançant regressió lineal obtenir els paràmetres del model A i n. Per a això
s'utilitzarà  la  funció polyfit que  permet  obtenir  els  coeficients  d'un  polinomi  d'ordre
especificat  a  partir  d'unes  dades  d'entrada  i  l'ordre  del  polinomi.  Internament  aquesta
funció  realitza  una  minimització  per  mínims  quadrats. Noteu  que  en  comptes  de
representar  l’atenuació  en  funció  del  logaritme  distància,  representarem  la  potència
rebuda en funció del logaritme distància.

- Representar les dades y=p, en funció de x=10*log10(d) on d es el vector
de distàncies contingut en el fitxer .mat. p es un vector que conté les
potències mesurades en dBm per cada distancia del vector d.
- Trobar els coeficients de la recta que ajusta les dades de la gràfica
anterior utilitzant l’ordre polyfit del MATLAB.
- Determinar els valors predits pel model lineal (recta ajustada) utilitzant
l’ordre polyval.
- Comparar en una mateixa gràfica les potències mesurades i estimades
amb el model lineal.
- Repetir par les dues altures, i extraure conclusions.

- Mesures experimentals.

Repetireu    les    mesures    de l’apartat 4 però utilitzant    les dades    obtingudes
experimentalment en el laboratori.

Abans d’això calibrareu l’analitzador d’espectres en transmissió, operació que haureu
de  fer  en  altres  pràctiques.  El  professor  també calibrarà l’analitzador d’espectres per
posteriorment fer les mesures experimentals amb el corresponent muntatge.

a) Configuració dels instruments: Cal libració de l’instrument.

- Generador: Analitzador d’espectres amb generador de tracking activat i
zero span a 868 MHz
- Receptor: Analitzador d’espectres amb el marker a 868 MHz, RBW 100
KHz, VBW 10 kHz, RL -20 dBm

b) Mesures.

- Anotar en una taula la distancia i potencia rebuda per cada distància. Fer-
ho per les dues polaritzacions de l’antena dipol.




Annex 1: Processament  de  les  mesures  obtingudes  al  lab. (darrera
part)


Figura 1: Mesura de la relació de les potències rebuda i transmesa fent servir l’analitzador d’espectres
(mode tracking generator). Antenes (parxe de doble polarització i dipol pol vertical) situats a 75 cm

a)
b)
Figura 2: a) procés de calibratge per descomptar l’efecte dels cables (potència transmesa= potència rebuda),
b) dipol en polarització vertical.

Taula  1:  Mesures  presses  al  lab  depenen  de  la  orientació  del  dipol. El  resultat  mostra  la  relació de  la
potència rebuda respecte a la transmesa en funció de la distància.
Distància [cm] Polarització horitzontal [dB] Polarització vertical [dB]
## 25 -11,1 -11,23
## 50 -15,35 -14,5
## 75 -19,41 -17,31
## 100 -20,8 -19,28
## 150 -23,51 -22,38
## 200 -27,66 -25,76
## 250 -29,4 -26,46
## 300 -30,8 -31
## 350 -31,5 -25,73




Annex 2: Regressió lineal.

Es  molt  sovint  utilitzar  un polinomi  per  ajustar  un  model  a  una  sèrie  de  mesures
experimentals.  El  cas  més  simple  és  quant  aquest  polinomi és  de  primer  orde,  es  a  dir
una recta.  Per  exemple  en  la  figura  següent  es  mostra  una  gràfica  amb  unes  dades
experimentals (x
i
## ,y
i
) representades en punts, i la recta que  ajusta el núvol de punts.



Degut  a  errors en  les mesures (o  tambè  en  el model),  la recta  no passa  exactament  per
tots els punts. Es busca la recta que millor ajusta als punts mesurats. Per tant, cal establir
un criteri. El criteri més utilitzat és la minimització de l’error quadràtic mitjà:

## 2
## 1
## (   (   ))
n
ii
i
Ef   xy
## =
## =−
## 
## (2)
## On (x
i
## ,y
i
)  són els punts mesurats, i f(x) és la funció que  es  vol  ajustar. Per  exemple, si
s’utilitza un polinomi de primer ordre (recta) seria:
## 10
()f  xa x   a=+
## (3)

Idealment si no hi hagués errors de mesura, cada punt passaria per la recta, yi=f(xi). Es
podria escriure el següent sistema d’equacions sobredeterminat.

## 11   10
## 21   20
## 10nn
ya xa
ya xa
ya xa
## =+
## =+
## =+
## (4)
Notar que en aquest sistema hi ha com incògnites els coeficients del polinomi (a
## 1
, a
## 0
) i
en  canvi,  hi  ha  n  equacions.  Per  tal  que  tingui  solució  cal  que  hagi  n>=ordre  del
polinomi (en el cas d’una recta 2) equacions independents. A la pràctica degut als errors
de  mesura  és  convenient  que hagi  un  nombre  d’equacions  o  mesures  el  més  gran
possible, de manera que s’eviti que punts molt mal mesurats afectin a l’ajust.

El sistema d’equacions (4) es pot reescriure en notació matricial:
## 11
## 221
## 0
## 1
## 1
## 1
nn
yx
yxa
a
yx
##     
##     
## 
##     
## =
## 
##     
## 
##     
##     
## (5)
O bé:


yAa=
## (6)
On el vector
y
és el un vector columna format pels valors mesurats y
i
, A és la matriu
del sistema anterior, i el vector a és el vector d’incògnites format pels coeficients del
polinomi (recta):
## 1
## 0
a
a
a
## 
## =
## 
## 
## (7)
Multiplicant  a  tots  dos  costat  del  sistema (6)  per  la  matriu  A  trasposta s’obté un nou
sistema d’equacions que s’anomena equacions normals:

## TT
A  yA  Aa=
## (8)
Ara la matriu d’aquest nou sistema és quadrada, es a dir té el mateix nombre de files que
columnes  (n x n),  i  per  tant,  és  pot  invertir  si  està  ben  condicionada  (determinant  no
nul), i aïllar el vector d’incògnites:
## ()
## 1
## ()
## TT
aA  AA  ypinv  A  y
## −
## ==
## (9)
A   la   matriu  d’aquest  sistema  es  coneix  com  a  matriu  pseudoinversa,  i  esta
implementada en  MATLAB amb l’ordre pinv. Internament per trobar la pseudoinversa
el  MATLAB  utilitza  un  mètode  eficient  i  robust  basat  en  la  descomposició  en  valors
singulars (SVD).

Per   tal de   facilitar   la   regressió   amb   funcions polinòmiques,   el   MATLAB,   té
implementada les funcions polyfit i polyval.

La  funció polyfit permet  trobar  els  coeficients  del  millor  polinomi  que  ajusta els  punts
indicats pels vectors x, e y. S’ha d’indicar l’ordre del polinomi que es desitja.

L’ordre polyval permet evaluar o substituir en un polinomi, i comprovar les diferencies
entre els valors mesurats i calculats a partir del polinomi de regressió.

Exemple de regressió amb MATLAB:

%Dades mesurades (recta y=2x+3)
x=[1,2,3,4,5,6,7,8,9,10];
y=2*x+3;

%Trobem el polinomi p de la recta
p=polyfit(x,y,1)

p =

## 2.0000    3.0000


%Calculem els valors ajustats, susbtituint a la recta p
yestimat=polyval(p,x)






yestimat =

Columns 1 through 7

## 5.0000    7.0000    9.0000   11.0000   13.0000   15.0000   17.0000

Columns 8 through 10

## 19.0000   21.0000   23.0000

%Comparem els valors estimats i originals
plot(x,yestimat,x,y,’o’)
xlabel(‘x’); ylabel(‘y’);
legend('Model','Mesures')




## 12345678910
## 4
## 6
## 8
## 10
## 12
## 14
## 16
## 18
## 20
## 22
## 24
x
y
## Model
## Mesures
