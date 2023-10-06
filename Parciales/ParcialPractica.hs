-- Ejercicio 1a
type Titulo = String
type Artista = String
type Duracion = Int

data Genero = Rock | Blues | Pop | Jazz deriving (Show)

data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion deriving (Show)

-- Ejercicio 1b
mismoGenero :: Genero -> Genero -> Bool
mismoGenero Rock Rock = True
mismoGenero Blues Blues = True
mismoGenero Pop Pop = True
mismoGenero Jazz Jazz = True
mismoGenero _ _ = False

-- Ejercicio 1c
duracionDe :: Cancion -> Duracion
duracionDe (Tema _ _ _ d) = d
duracionDe (Publicidad d) = d
{-
ghci> duracionDe (Tema "a" "b" Pop 320)
320
ghci> duracionDe (Publicidad 320)
320
-}

-- Ejercicio 1d
instance Eq Cancion where
    c1 == c2 = duracionDe c1 == duracionDe c2

instance Ord Cancion where
    c1 <= c2 = duracionDe c1 <= duracionDe c2
{-
ghci> (Tema "A" "B" Pop 320) == (Tema "C" "D" Pop 320)
True
ghci> (Tema "A" "B" Pop 320) == (Tema "C" "D" Pop 321)
False
ghci> (Tema "A" "B" Pop 320) <= (Tema "C" "D" Pop 321)
True
ghci> (Tema "A" "B" Pop 320) <= (Tema "C" "D" Pop 319)
False
-}

-- Ejercicio 2
soloGenero :: [Cancion] -> Genero -> [Titulo]
soloGenero [] _ = []
soloGenero ((Tema titulo _ g _):xs) gi |mismoGenero g gi = titulo : soloGenero xs gi
                                       |otherwise = soloGenero xs gi
soloGenero (x:xs) gi = soloGenero xs gi
{-
ghci> soloGenero [] Rock
[]
ghci> soloGenero [(Tema "A" "r" Pop 200),(Tema "B" "r" Rock 120),(Publicidad 30),(Tema "C" "r" Pop 230)] Pop
["A","C"]
ghci> soloGenero [(Tema "A" "r" Pop 200),(Tema "B" "r" Rock 120),(Publicidad 30),(Tema "C" "r" Pop 230)] Rock
["B"]
-}

-- Ejercicio 3
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)

laSumaMayores :: (Num b, Eq b, Ord b) => ListaAsoc a b -> b -> b
laSumaMayores Vacia x = 0
laSumaMayores (Nodo _ dato listaRest) x |dato > x = dato + laSumaMayores listaRest x
                                        |otherwise = laSumaMayores listaRest x
{-
ghci> laSumaMayores (Nodo "Coca" 300 (Nodo "Hamburgesa" 1500 (Nodo "Sal" 150 Vacia))) 200
1800
ghci> laSumaMayores (Nodo "Coca" 300 (Nodo "Hamburgesa" 1500 Vacia)) 200
1800
ghci> laSumaMayores Vacia 1000
0
-}

-- Ejercicio 4a
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

aListar :: Arbol a -> [a]
aListar Hoja = []
aListar (Rama d m i) = [m] ++ aListar d ++ aListar i
{-
ghci> aListar (Rama (Rama Hoja 4 (Rama Hoja 5 Hoja)) 7 (Rama (Rama Hoja 10 Hoja) 15 (Rama Hoja 18 Hoja)))
[7,4,5,15,10,18]
-}


{---Ejercicio 1

type Titulo = String
type Artista = String
type Duracion = Int

data Genero = Rock | Blues | Pop | Jazz deriving Show

data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion

mismoGenero :: Genero -> Genero -> Bool
mismoGenero Rock Rock = True
mismoGenero Pop Pop = True
mismoGenero Blues Blues = True
mismoGenero Jazz Jazz = True
mismoGenero _ _ = False

duracionDe :: Cancion -> Duracion
duracionDe (Tema _ _ _ d) = d
duracionDe (Publicidad d) = d

-- Para incluir a Cancion en la clase Ord primero hay que incluirlo en la clase Eq
instance Eq Cancion where
    c1 == c2 = duracionDe c1 == duracionDe c2

instance Ord Cancion where
    c1 <= c2 = duracionDe c1 <= duracionDe c2

--Ejercicio 2

soloGenero :: [Cancion] -> Genero -> [Titulo]
soloGenero [] _ = []
-- Caso para temas musicales
soloGenero ((Tema t a g d):xs) gi | mismoGenero g gi = t : soloGenero xs gi
                                   | otherwise = soloGenero xs gi
-- Caso para publicidades
soloGenero (x:xs) gi = soloGenero xs gi

--Ejemplo:

-- *Main> solo_genero [Tema "t1" "a1" Rock 197, Tema "t2" "a2" Pop 227, Publicidad 40, Tema "t3" "a3" Rock 197, Tema "t1" "a1" Jazz 385, Publicidad 30] Rock
--["t1","t3"]

--Ejercicio 3

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

laSumaMayores :: (Num b, Ord b, Eq b) => ListaAsoc a b -> b -> b
laSumaMayores Vacia _ = 0
laSumaMayores (Nodo k v la) x | v > x = v + laSumaMayores la x
                                | otherwise = laSumaMayores la x

--Ejemplo:

-- *Main> la_suma_mayores (Nodo "hola" 3 (Nodo "chau" 1 (Nodo "casa" 4 (Nodo "auto" 2 Vacia)))) 2
-- 7

--Ejercicio 4*

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

aListar :: Arbol a -> [a]
aListar Hoja = []
aListar (Rama l e r) = [e] ++ aListar l ++ aListar r

--Ejemplo:

-- *Main> a_listar (Rama (Rama Hoja 4 (Rama Hoja 5 Hoja)) 7 (Rama (Rama Hoja 10 Hoja) 15 (Rama Hoja 18 Hoja)))
--[7,4,5,15,10,18]
-}