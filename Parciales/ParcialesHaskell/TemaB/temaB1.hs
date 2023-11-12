--Ejercicio 1
type Titulo = String
type Artista = String
type Duracion = Int
data Genero = Rock | Blues | Pop | Jazz deriving(Show)

data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion deriving(Show)

mismoGenero :: Genero -> Genero -> Bool
mismoGenero Rock Rock = True
mismoGenero Blues Blues = True
mismoGenero Pop Pop = True
mismoGenero Jazz Jazz = True
mismoGenero _ _ = False

duracionDe :: Cancion -> Duracion
duracionDe (Tema _ _ _ s) = s
duracionDe (Publicidad s) = s

instance Eq Cancion where
    (Tema t1 a1 g1 s1) == (Tema t2 a2 g2 s2) = t1 == t2 && a1 == a2 && mismoGenero g1 g2 && s1 == s2

instance Ord Cancion where
    c1 <= c2 = duracionDe c1 <= duracionDe c2

--Ejercicio 2
soloGenero :: [Cancion] -> Genero -> [Titulo]
soloGenero [] _ = []
soloGenero ((Tema t _ Rock _):xs) Rock = t : soloGenero xs Rock
soloGenero ((Tema t _ Blues _):xs) Blues = t : soloGenero xs Blues
soloGenero ((Tema t _ Pop _):xs) Pop = t : soloGenero xs Pop
soloGenero ((Tema t _ Jazz _):xs) Jazz = t : soloGenero xs Jazz
soloGenero (_:xs) gi = soloGenero xs gi

--Ejercicio 3
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)

laSumaMayores :: (Ord b, Num b) => ListaAsoc a b -> b -> b
laSumaMayores Vacia _ = 0
laSumaMayores (Nodo a b xs) ed | b > ed = b + laSumaMayores xs ed
laSumaMayores _ _ = 0

--Ejercicio 4*
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving(Show, Eq)

aListar :: Arbol a -> [a]
aListar Hoja = []
aListar (Rama xs a ys) = [a] ++ aListar xs ++ aListar ys

-- (Rama (Rama (Hoja) 4 (Rama Hoja 5 Hoja)) 7 (Rama (Rama Hoja 10 Hoja) 15 (Rama Hoja 18 Hoja)))

{-
ghci> aListar (Rama (Rama (Hoja) 2 (Hoja)) 1 (Rama (Hoja) 3 (Rama (Hoja) 4 (Hoja))))
[1,2,3,4]
ghci> aListar (Rama (Rama (Hoja) "l" (Rama (Hoja) "a" (Hoja))) "Ho" (Rama (Hoja) "Hoho" (Hoja)))
["Ho","l","a","Hoho"]
ghci> aListar (Rama (Rama (Hoja) 4 (Rama Hoja 5 Hoja)) 7 (Rama (Rama Hoja 10 Hoja) 15 (Rama Hoja 18 Hoja)))
[7,4,5,15,10,18]
-}