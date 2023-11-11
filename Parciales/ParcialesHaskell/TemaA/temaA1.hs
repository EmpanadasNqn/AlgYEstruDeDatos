import Distribution.Types.LocalBuildInfo (componentNameTargets)
-- Ejercicio 1
data Forma = Piedra | Papel | Tijera deriving (Show)

leGana :: Forma -> Forma -> Bool
leGana Piedra Tijera = True
leGana Tijera Papel = True
leGana Papel Piedra = True
leGana _ _ = False

type Nombre = String
data Jugador = Mano Nombre Forma deriving(Show)

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2) |leGana f1 f2 = Just n1
                                  |leGana f2 f1 = Just n2
                                  |otherwise = Nothing

--Ejercicio 2
quienJugo :: Forma -> [Jugador] -> [Nombre]
quienJugo _ [] = []
quienJugo Piedra ((Mano n Piedra):xs) = n : quienJugo Piedra xs
quienJugo Papel ((Mano n Papel):xs) = n : quienJugo Papel xs
quienJugo Tijera ((Mano n Tijera):xs) = n : quienJugo Tijera xs
quienJugo f1  (x:xs) = quienJugo f1 xs

{-
ghci> quienJugo Piedra []
[]
ghci> quienJugo Piedra [(Mano "Santino" Papel), (Mano "Patito" Piedra), (Mano "Joaco" Piedra), (Mano "Santos" Tijera)]
["Patito","Joaco"]
ghci> quienJugo Piedra [(Mano "Santino" Piedra), (Mano "Patito" Piedra), (Mano "Joaco" Piedra), (Mano "Santos" Tijera)]
["Santino","Patito","Joaco"]
-}

--Ejercicio 3
data NotaMusical = Do | Re | Mi | Fa | Sol | La | Si deriving (Show)
data Figura = Negra | Corchea deriving(Show)
data Melodia = Vacia | Entonar NotaMusical Figura Melodia deriving(Show)

contarTiempos :: Melodia -> Int
contarTiempos Vacia = 0
contarTiempos (Entonar _ Negra m) = 2 + contarTiempos m
contarTiempos (Entonar _ Corchea m) = 1 + contarTiempos m

--Ejercicio 4 De Arboles????
