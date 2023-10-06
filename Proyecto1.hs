-- Proyecto 1 Algoritmo y Estructura de Datos
-- Santino Ponchiardi 45211321

-- Ejercicio 1a
esCero :: Int -> Bool
esCero x = x == 0
{- 
*Main> esCero 0
True
*Main> esCero 3
False
-}

-- Ejercicio 1b
esPositivo :: Int -> Bool
esPositivo x = x > 0
{-
*Main> esPositivo 3
True
*Main> esPositivo (-2)
False
-}

-- Ejercicio 1c
esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'
{-
*Main> esVocal 'a'
True
*Main> esVocal 'b'
False
-}

-- Ejercicio 1d
valorAbsoluto :: Int -> Int
valorAbsoluto x |(x >= 0) = x
                |otherwise = -x
{-
*Main> valorAbsoluto 0
0
*Main> valorAbsoluto 5
5
*Main> valorAbsoluto (-4)
4
-}

-- Ejercicio 2a
paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x:xd) = x == True && paraTodo xd
{-
*Main> paraTodo []
True
*Main> paraTodo [True, True]
True
*Main> paraTodo [True, True, False]
False
-}

-- Ejercicio 2b
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xd) = x + sumatoria xd
{- 
*Main> sumatoria []
0
*Main> sumatoria [1..5]
15
-}

-- Ejercicio 2c
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xd) = x * productoria xd
{- 
*Main> productoria [1..3]
6
*Main> productoria [1..5]
120
-}

-- Ejercicio 2d
factorial :: Int -> Int 
factorial 0 = 1
factorial x = x * factorial (x-1)
{- 
*Main> factorial 5
120
*Main> factorial 3
6
-}

-- Ejercicio 2e
promedio :: [Int] -> Int
promedio x = div (sumatoria x) (length x)
{- 
*Main> promedio [1..5]
3
*Main> promedio [1..15]
8
-}

-- Ejercicio 3
pertenece :: Int -> [Int] -> Bool
pertenece y [] = False
pertenece y (x:xd) = y == x || pertenece y xd 
{- 
*Main> pertenece 10 [1,2,3]
False
*Main> pertenece 10 [10,2,3]
True
-}

-- Ejercicio 4a
paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] f = True
paraTodo' (x:xd) f = f x && paraTodo' xd f
{- 
*Main> paraTodo' [(-1)..3] esPositivo 
False
*Main> paraTodo' [(1)..3] esPositivo 
True
*Main> paraTodo' [0,0,0,0] esCero 
True
*Main> paraTodo' [0,0,0,1] esCero 
False
*Main> paraTodo' [] esCero 
True
-}

-- Ejercicio 4b
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xd) f = f x || existe' xd f
{-
*Main> existe' [] esCero 
False
*Main> existe' [0,0,0] esCero 
True
*Main> existe' [0,0,0,1] esCero 
True
*Main> existe' [1] esCero 
False
-}

-- Ejercicio 4c
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xd) f = f x + sumatoria' xd f
{- 
*Main> sumatoria' [] valorAbsoluto 
0
*Main> sumatoria' [(-3), 1, 5] valorAbsoluto 
9
-}

-- Ejercicio 4d
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] f = 1
productoria' (x:xd) f = f x * productoria' xd f
{- 
*Main> productoria' [] valorAbsoluto 
1
*Main> productoria' [1,2,3] valorAbsoluto 
6
*Main> productoria' [1,2,3,10] valorAbsoluto 
60
*Main> productoria' [1,2,3,(-10)] valorAbsoluto 
60
-}

-- Ejercicio 5
paraTodo2 :: [a] -> (a -> Bool) -> Bool
paraTodo2 xd f = paraTodo' xd f
{- 
*Main> paraTodo2 [5,5,5] esCero 
False
*Main> paraTodo2 [0,0,0,0] esCero 
True
-}

-- Ejercicio 6a
todosPares :: [Int] -> Bool
todosPares xd = paraTodo' xd even
{- 
*Main> todosPares [2,2,2]
True
*Main> todosPares [2,2,3]
False
-}

-- Ejercicio 6b
multiplo :: Int -> Int -> Bool
multiplo x y = mod y x == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo y xd = existe' xd (multiplo y)
{- 
*Main> hayMultiplo 3 [1,2,2,2]
False
*Main> hayMultiplo 3 [6,2,2,2]
True
-}

-- Ejercicio 6c
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x] (^2)
{- 
*Main> sumaCuadrados 5
55
*Main> sumaCuadrados 10
385
-}

-- Ejercicio 6d
multiplo' :: Int -> Int -> Bool
multiplo' x y = mod x y == 0

existeDivisor :: Int -> [Int] -> Bool
existeDivisor y (l:ld) = existe' ld (multiplo' y)
{- 
*Main> existeDivisor 2 [3,5,2]
True
*Main> existeDivisor 2 [3,5,1]
True
*Main> existeDivisor 2 [3,5,4]
False
-}

-- Ejercicio 6e
esPrimo :: Int -> Bool
esPrimo x = not(existeDivisor x [1..(x-1)])
{- 
*Main> esPrimo 11
True
*Main> esPrimo 12
False
*Main> esPrimo 13
True
-}

--Ejercicio 6f
factorial' :: Int -> Int
factorial' x = productoria [2..x]
{- 
*Main> factorial' 5
120
*Main> factorial' 6
720
-}

-- Ejercicio 6g
sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xd) |x == 1 = sonPrimos xd
                 |esPrimo x = x : sonPrimos xd
                 |otherwise = sonPrimos xd

multiplicarPrimos :: [Int] -> Int
multiplicarPrimos xd = productoria' (sonPrimos xd) id
{- 
*Main> sonPrimos [4,6,8,12]
[]
*Main> multiplicarPrimos [1..5] 
30
*Main> multiplicarPrimos [4,5,6]
5
-}

-- Ejercicio 6h
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib (x-2)

listaFib :: Int -> [Int]
listaFib 0 = []
listaFib 1 = [1]
listaFib x = (fib x) : listaFib (x-1)
{- 
Crea la lista desde los numeros grandes hasta los mas chicos,
Y eso hace que tarde mucho la funcion esFib
-}

esFib :: Int -> Bool
esFib n = existe' (listaFib n) (==n)
{- 
*Main> esFib 4
False
*Main> esFib 5
True
*Main> esFib 55
True
esFib n = pertenece n (map fib [(n+1)..0]) Otra forma de hacerlo.
-}

-- Ejercicio 6i
todosFib :: [Int] -> Bool
todosFib xd = paraTodo' xd esFib
{- 
*Main> todosFib [1,2,3,1,4]
False
*Main> todosFib [1,2,3,1,13]
True
-}

-- Ejercicio 7
{- 
a) La función map aplica una funcion f ingresada a una lista xs ingresada,
devolviendonos otra lista ys con la funcion f aplicada a cada elemento de xs.
Y la funcion filter, que dada una lista xs,
devuelve una lista ys cuyos elementos satisfacen la funcion f ingresada.
b) Aplica la funcion f "succ" que suma 1 a cada elemento de la lista xs. 
ej:
*Main> map succ [1,(-4),6,2,(-8)]
[2,-3,7,3,-7]
c) Aplica la funcion f "esPositivo" a la lista xs y devuelve solo los elementos
positivos de xs.
ej:
*Main> filter esPositivo [1,(-4),6,2,(-8)]
[1,6,2]
-}

-- Ejercicio 8a
duplicaSinMap :: [Int] -> [Int]
duplicaSinMap [] = []
duplicaSinMap (x:xd) = x * 2 : duplicaSinMap xd
{- 
*Main> duplicaSinMap [2,4,-4]
[4,8,-8]
*Main> duplicaSinMap []
[]
-}

-- Ejercicio 8b
duplica :: [Int] -> [Int]
duplica xd = map (*2) xd
{- 
*Main> duplica []
[]
*Main> duplica [2,4,-4]
[4,8,-8]
-}

-- Ejercicio 9a
-- Lo mismo que la funcion aux del ejercicio 6g
buscaPrimosSinFilter :: [Int] -> [Int]
buscaPrimosSinFilter [] = []
buscaPrimosSinFilter (x:xd) |x == 1 = buscaPrimosSinFilter xd
                            |esPrimo x = x : buscaPrimosSinFilter xd
                            |otherwise = buscaPrimosSinFilter xd

-- ejercicio 9b
buscaPrimos :: [Int] -> [Int]
buscaPrimos xd = filter esPrimo xd
{- 
*Main> buscaPrimos [2..14]
[2,3,5,7,11,13]
*Main> buscaPrimos []
[]
-}

-- Ejercicio 9c
multiplicarPrimos' :: [Int] -> Int
multiplicarPrimos' xd = productoria' (filter esPrimo xd) id
{- 
*Main> multiplicarPrimos' [5,2,3,5]
150
*Main> multiplicarPrimos' [5,5]
25
-}

-- Ejercicio 10a
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA y [] = []
primIgualesA y (x:xd) | y == x = x : primIgualesA y xd
                      | otherwise = primIgualesA y []
{- 
*Main> primIgualesA 'a' "aaada"
"aaa"
*Main> primIgualesA 3 [3,3,3,4,3]
[3,3,3]
*Main> primIgualesA 3 [4,3,3,3,4,3]
[]
*Main> primIgualesA 3 []
[]
-}

-- Ejercicio 10b
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' y xd = takeWhile (==y) xd
{- 
*Main> primIgualesA' 3 [3,3,3]
[3,3,3]
*Main> primIgualesA' 3 [3,3,3,4]
[3,3,3]
*Main> primIgualesA' 3 [4,3,3,3,4]
[]
*Main> primIgualesA' 'a' "aaada"
"aaa"
-}

-- Ejercicio 11a
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (y:x:xd) | y == x = y : primIguales (x:xd)
                      | otherwise = primIguales [y]
{- 
*Main> primIguales [1]
[1]
*Main> primIguales [3,3,2,1]
[3,3]
*Main> primIguales [4,3,3,2,1]
[4]
*Main> primIguales []
[]
*Main> primIguales "aaaaaadaa"
"aaaaaa"
-}

-- Ejercicio 11b
primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xd) = primIgualesA' x (x:xd)
{- 
*Main> primIguales' []
[]
*Main> primIguales' [1]
[1]
*Main> primIguales' [1,1,1,1,3]
[1,1,1,1]
*Main> primIguales' [1,1,3,1,1,3]
[1,1]
*Main> primIguales' "aadaaaaaa"
"aa"
-}