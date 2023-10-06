-- Proyecto 2 Algoritmo y Estructura de Datos
-- Santino Ponchiardi 45211321

-- Ejercicio 1a
data Carrera = Computacion | Astronomia | Matematica | Fisica

-- Ejercicio 1b
titulo :: Carrera -> String
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia =  "Licenciatura en Astronomia"
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
{-
*Main> titulo Computacion 
"Licenciatura en Ciencias de la Computacion"
*Main> titulo Astronomia 
"Licenciatura en Astronomia"
*Main> titulo Matematica 
"Licenciatura en Matematica"
*Main> titulo Fisica
"Licenciatura en Fisica"
-}

-- Ejercicio 1c
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Bounded, Show)

-- Ejercicio 1d
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'
{-
*Main> cifradoAmericano Sol
'G'
*Main> cifradoAmericano Fa
'F'
*Main> cifradoAmericano Re
'D'
-}

-- Ejercicio 2a
{-
*Main> Do <= Re
True
*Main> Do < Re
True
*Main> Si < Mi
False
*Main> min Fa Sol
Fa
*Main> min Fa Do
Do
-}

-- Ejercicio 3a
minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xd) = min x (minimoElemento xd)
{-
*Main> minimoElemento [0,2]
0
*Main> minimoElemento [-4,2]
-4
*Main> minimoElemento [4,2]
2
-}

-- Ejercicio 3b
minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xd) = min x (minimoElemento' xd)
{-
*Main> minimoElemento' ([15,4,10]::[Int])
4
*Main> minimoElemento' []
()
*Main> minimoElemento' ([]::[Int])
9223372036854775807
*Main> minimoElemento' ([]::[Bool])
True
-}

-- Ejercicio 3c
{- 
ghci> minimoElemento [Fa,La,Sol,Re,Fa]
Re
-}

-- Ejercicio 4a
type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | MedioCampo | Delantero deriving (Eq, Show)
data TipoReves = DosManos | UnaMano deriving (Show)
data Modalidad  = Carretera | Pista | Monte | BMX deriving (Show)
data PiernaHabil = Izquierda | Derecha deriving (Show)

type ManoHabli = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura 
                | Tenista TipoReves ManoHabli Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving (Show)

-- Ejercicio 4b
{-
ghci> :t Ciclista 
Ciclista :: Modalidad -> Deportista
El tipo de contructor es Enumerado con un Argumento
-}

-- Ejercicio 4c
contarVelocista :: [Deportista] -> Int
contarVelocista [] = 0
contarVelocista (Velocista _:xd) = 1 + contarVelocista xd
contarVelocista (x:xd) = contarVelocista xd
{-
ghci> contarVelocista [Velocista 5, Velocista 3, Ajedrecista]
2
ghci> contarVelocista [Ajedrecista, Velocista 5, Velocista 3, Ajedrecista]
2
-}

-- Ejercicio 4d
contarFutbolista :: [Deportista] -> Zona -> Int
contarFutbolista [] z = 0
contarFutbolista (Futbolista Arco b c d:xd) Arco = 1 + contarFutbolista xd Arco
contarFutbolista (Futbolista Defensa b c d:xd) Defensa = 1 + contarFutbolista xd Defensa
contarFutbolista (Futbolista MedioCampo b c d:xd) MedioCampo = 1 + contarFutbolista xd MedioCampo
contarFutbolista (Futbolista Delantero b c d:xd) Delantero = 1 + contarFutbolista xd Delantero
contarFutbolista (x:xd) z = contarFutbolista xd z
{-
ghci> contarFutbolista [Futbolista Arco 10 Izquierda 175, Ajedrecista, Velocista 180, Futbolista Arco 30 Izquierda 180, Futbolista Delantero 12 Derecha 190] Arco
2
ghci> contarFutbolista [Futbolista Arco 10 Izquierda 175, Ajedrecista, Velocista 180, Futbolista Arco 30 Izquierda 180, Futbolista Delantero 12 Derecha 190] Delantero 
1
-}

-- Ejercicio 4e
mismaZona :: Zona -> Deportista -> Bool
mismaZona z (Futbolista zona _ _ _) = z == zona
mismaZona z _ = False

contarFutbolista' :: [Deportista] -> Zona -> Int
contarFutbolista' [] z = 0
contarFutbolista' xd z = length (filter (mismaZona z) xd)
{-
ghci> contarFutbolista [Futbolista Arco 10 Izquierda 175, Ajedrecista, Velocista 180, Futbolista Arco 30 Izquierda 180, Futbolista Delantero 12 Derecha 190] Arco
2
ghci> contarFutbolista [Futbolista Defensa 10 Izquierda 175, Ajedrecista, Velocista 180, Futbolista Arco 30 Izquierda 180, Futbolista Delantero 12 Derecha 190] Defensa
1
-}

-- Ejercicio 5a
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- Ejercicio 5b
data Alteracion = Bemol | Natural | Sostenido

-- Ejercicio 5c
data NotaMusical = Nota NotaBasica Alteracion

-- Ejercicio 5d
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Bemol) = sonidoNatural n - 1
sonidoCromatico (Nota n Sostenido) = sonidoNatural n + 1
sonidoCromatico (Nota n Natural) = sonidoNatural n
{-
ghci> sonidoCromatico (Nota Re Sostenido)
3
ghci> sonidoCromatico (Nota Si Bemol)
10
-}

-- Ejercicio 5e
instance Eq NotaMusical
    where
        n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2
{-
ghci> sonidoNatural Do == sonidoNatural Do
True
ghci> sonidoNatural Do == sonidoNatural Re
False
ghci> sonidoCromatico (Nota Mi Natural) == sonidoCromatico (Nota Fa Bemol)
True
ghci> sonidoCromatico (Nota Sol Bemol) == sonidoCromatico (Nota Fa Sostenido)
True
ghci> sonidoCromatico (Nota Sol Bemol) == sonidoCromatico (Nota Fa Natural)
False
-}

-- Ejercicio 5f
instance Ord NotaMusical
    where
        n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2
{-
ghci> sonidoNatural Do < sonidoNatural Re
True
ghci> sonidoNatural Do > sonidoNatural Re
False
ghci> sonidoNatural Do <= sonidoNatural Do
True
ghci> sonidoCromatico (Nota Sol Bemol) <= sonidoCromatico (Nota Fa Sostenido)
True
ghci> sonidoCromatico (Nota Sol Bemol) < sonidoCromatico (Nota Fa Sostenido)
False
-}

-- Ejercicio 6a
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xd) = Just x
{-
ghci> primerElemento []
Nothing
ghci> primerElemento [1,2,3,4]
Just 1
-}

-- Ejercicio 7a1
data Cola = ColaVacia | EnCola Deportista Cola deriving (Show)

atender :: Cola -> Maybe Cola
atender ColaVacia = Nothing
atender (EnCola _ colaRestante) = Just colaRestante
{-
ghci> atender (EnCola Ajedrecista (EnCola Ajedrecista ColaVacia))
Just (EnCola Ajedrecista ColaVacia)
ghci> atender (EnCola Ajedrecista ColaVacia)
Just ColaVacia
ghci> atender (ColaVacia)
Nothing
-}

-- Ejercicio 7a2
agregarACola :: Deportista -> Cola -> Cola
agregarACola deportista ColaVacia = EnCola deportista ColaVacia
agregarACola deportista (EnCola d colaRestante) = EnCola d (agregarACola deportista colaRestante)
{-
ghci> agregarACola Ajedrecista (EnCola (Ciclista Pista) ColaVacia)
EnCola (Ciclista Pista) (EnCola Ajedrecista ColaVacia)
-}

-- Ejercicio 7a3
buscaFutbolistas :: Cola -> Zona -> Maybe Deportista
buscaFutbolistas ColaVacia _ = Nothing
buscaFutbolistas (EnCola deportista colaRestante) z |mismaZona z deportista = Just deportista --Funcion "mismaZona" usada en ejercicios anteriores
                                                    |otherwise = buscaFutbolistas colaRestante z
{-
ghci> buscaFutbolistas ColaVacia Arco
Nothing
ghci> buscaFutbolistas (EnCola (Ciclista Pista) (EnCola (Futbolista Arco 10 Derecha 180) (EnCola Ajedrecista ColaVacia))) Arco
Just (Futbolista Arco 10 Derecha 180)
ghci> buscaFutbolistas (EnCola (Ciclista Pista) (EnCola (Futbolista Arco 10 Derecha 180) (EnCola Ajedrecista ColaVacia))) Delantero 
Nothing
-}

-- Ejercicio 7b
{-
El tipo de dato "Cola" que contiene los constructores "ColaVacia" y "EnCola", donde los argumentos de "EnCola" son
"Deportista" y "Cola", significando que "Cola" es un tipo de dato recursivo. 
El constructor "EnCola" se parece al constructor de listas ":". El constructor "ColaVacia" se parece a "[]" que se pone al final
de la construccion de una lista. ej: "EnCola Ajedrecista (EnCola Futbolista ColaVacia)" se asemeja a "(x:y:[])".
Por lo que concluyo que el tipo de dato "Cola" se parece a una lista, que en realidad una lista es una estructura de datos, Pero
entonces el tipo de dato "Cola" con gente "haciendo fila" seria una estructura de datos igualmente.
-}

-- Ejercicio 8
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)

-- Ejercicio 8a
type GuiaTelefonica = ListaAsoc String Int
--Donde el String es el Nombre y Apellido de la persona o empresa que se busca, y el Int justamente el numero de telefono.

-- Ejercicio 8b1
laLong :: ListaAsoc a b -> Int
laLong Vacia = 0
laLong (Nodo _ _ listaRest) = 1 + laLong listaRest
{-
ghci> laLong (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia))
2
ghci> laLong Vacia
0
-}

-- Ejercicio 8b2
laConcat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
laConcat Vacia listaB = listaB
laConcat (Nodo a b listaRest) listaB = Nodo a b (laConcat listaRest listaB)
{-
ghci> laConcat Vacia (Nodo 123 456 Vacia)
Nodo 123 456 Vacia
ghci> laConcat (Nodo 123 456 Vacia) Vacia
Nodo 123 456 Vacia
ghci> laConcat Vacia Vacia
Vacia
ghci> laConcat (Nodo 111 222 Vacia) (Nodo 333 444 Vacia)
Nodo 111 222 (Nodo 333 444 Vacia)
-}

-- Ejercicio 8b3
laAgregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
laAgregar Vacia clave dato = Nodo clave dato Vacia
laAgregar (Nodo a b listaRest) clave dato |a == clave = Nodo clave dato listaRest
                                          |otherwise = Nodo a b (laConcat listaRest (Nodo clave dato Vacia))
{-
ghci> laAgregar Vacia "Ponch" 111
Nodo "Ponch" 111 Vacia
ghci> laAgregar (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia)) "Alejo" 299
Nodo "Ponch" 299 (Nodo "Pato" 2569 (Nodo "Alejo" 299 Vacia))
ghci> laAgregar (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia)) "Ponch" 299466
Nodo "Ponch" 299466 (Nodo "Pato" 2569 Vacia)
-}

-- Ejercicio 8b4
laPares :: ListaAsoc a b -> [(a,b)]
laPares Vacia = []
laPares (Nodo a b listaRest) = (a,b) : laPares listaRest
{-
ghci> laPares (Nodo "Ponch" 299 Vacia)
[("Ponch",299)]
ghci> laPares (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia))
[("Ponch",299),("Pato",2569)]
ghci> laPares Vacia
[]
-}

-- Ejercicio 8b5
laBusca :: Eq a => ListaAsoc a b -> a -> Maybe b
laBusca Vacia clave = Nothing
laBusca (Nodo a dato listaRest) clave |a == clave = Just dato
                                      |otherwise = laBusca listaRest clave
{-
ghci> laBusca Vacia "Ponch"
Nothing
ghci> laBusca (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia)) "Pato"
Just 2569
ghci> laBusca (Nodo "Ponch" 299 (Nodo "Pato" 2569 Vacia)) "Ponch"
Just 299
-}

-- Ejercicio 8b6
laBorrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
laBorrar _ Vacia = Vacia
laBorrar clave (Nodo a dato listaRest) |a == clave = listaRest
                                       |otherwise = Nodo a dato (laBorrar clave listaRest)
{-
ghci> laBorrar "Ponch" Vacia
Vacia
ghci> laBorrar "Ponch" (Nodo "Pato" 2569 (Nodo "Ponch" 299 Vacia))
Nodo "Pato" 2569 Vacia
ghci> laBorrar "Pato" (Nodo "Pato" 2569 (Nodo "Ponch" 299 Vacia))
Nodo "Ponch" 299 Vacia
-}

