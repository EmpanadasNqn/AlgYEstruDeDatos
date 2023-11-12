--Ejercicio 1
data Ropa = Camisa | Pantalon | Pollera | Short deriving(Show)

mismaRopa :: Ropa -> Ropa -> Bool
mismaRopa Camisa Camisa = True
mismaRopa Pantalon Pantalon = True
mismaRopa Pollera Pollera = True
mismaRopa Short Short = True
mismaRopa _ _ = False

type Talle = Int
data Prenda = ConTalle Talle Ropa | TalleUnico Ropa deriving(Show)

valorTalle :: Prenda -> Int
valorTalle (ConTalle t _) = t
valorTalle (TalleUnico _) = 0

instance Eq Prenda where
    (ConTalle _ r1) == (ConTalle _ r2) = mismaRopa r1 r2
    (TalleUnico r1) == (TalleUnico r2) = mismaRopa r1 r2

instance Ord Prenda where
    p1 >= p2 = valorTalle p1 >= valorTalle p2
    p1 <= p2 = valorTalle p1 <= valorTalle p2

--Ejercicio 2
soloConTalle :: [Prenda] -> Ropa -> [Talle]
soloConTalle [] _ = []
soloConTalle ((ConTalle t r):xs) ro |mismaRopa r ro = t : soloConTalle xs ro
                                    |otherwise = soloConTalle xs ro
soloConTalle (_:xs) ro = soloConTalle xs ro

-- [(ConTalle 10 Camisa),(ConTalle 15 Camisa),(TalleUnico Camisa),(ConTalle 5 Pantalon),(ConTalle 20 Camisa)]

{-
ghci> soloConTalle [(ConTalle 10 Camisa),(ConTalle 15 Camisa),(TalleUnico Camisa),(ConTalle 5 Pantalon),(ConTalle 20 Camisa)] Camisa
[10,15,20]
ghci> soloConTalle [(ConTalle 10 Camisa),(ConTalle 15 Camisa),(TalleUnico Camisa),(ConTalle 5 Pantalon),(ConTalle 20 Camisa)] Pantalon 
[5]
-}

--Ejercicio 3
