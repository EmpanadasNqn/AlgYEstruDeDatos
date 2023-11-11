--Ejercicio 2
data TipoPlanta  = PlenoSol | MediaSombra | Floral | Frutal deriving(Show) -- No puede estar en clase EQ ni ORD
data Ubicacion = Exterior | Interior deriving(Show) -- No puede estar en clase EQ ni ORD
data Agua = MuyResistente | Resistente | NadaResistente deriving(Show, Eq, Ord)
type Precio = Int

data TipoSemilla = Hortalizas | Aromaticas | Cesped deriving(Show, Eq, Ord)
type Peso = Float

data TipoMaceta = Terracota | FibroCemento | Plastico deriving(Show) -- No puede estar en clase EQ ni ORD
data Forma = Cuadrada | Redonda deriving(Show, Eq, Ord)

-- No puede estar en clase EQ ni ORD
data ProductoDeVivero = Planta TipoPlanta Ubicacion Agua Precio | BolsaSemilla TipoSemilla Peso Precio | Maceta TipoMaceta Forma Precio deriving(Show)

cuantasPlantas :: [ProductoDeVivero] -> TipoPlanta -> Int
cuantasPlantas [] _ = 0
cuantasPlantas ((Planta PlenoSol _ _ _):xs) PlenoSol = 1 + cuantasPlantas xs PlenoSol
cuantasPlantas ((Planta MediaSombra _ _ _):xs) MediaSombra = 1 + cuantasPlantas xs MediaSombra
cuantasPlantas ((Planta Floral _ _ _):xs) Floral = 1 + cuantasPlantas xs Floral
cuantasPlantas ((Planta Frutal _ _ _):xs) Frutal = 1 + cuantasPlantas xs Frutal
cuantasPlantas (_:xs) tp = cuantasPlantas xs tp

{-
ghci> cuantasPlantas [(Planta PlenoSol Exterior Resistente 100),(Planta Frutal Interior MuyResistente 150),(Planta PlenoSol Exterior MuyResistente 60),(BolsaSemilla Cesped 10.5 140)] PlenoSol
2
-}

mismoTipoPlanta :: TipoPlanta -> TipoPlanta -> Bool
mismoTipoPlanta PlenoSol PlenoSol = True
mismoTipoPlanta MediaSombra MediaSombra = True
mismoTipoPlanta Floral Floral = True
mismoTipoPlanta Frutal Frutal = True
mismoTipoPlanta _ _ = False

mismaUbicacion :: Ubicacion -> Ubicacion -> Bool
mismaUbicacion Exterior Exterior = True
mismaUbicacion Interior Interior = True
mismaUbicacion _ _ = False

mismoTipoMaceta :: TipoMaceta -> TipoMaceta -> Bool
mismoTipoMaceta Terracota Terracota = True
mismoTipoMaceta FibroCemento FibroCemento = True
mismoTipoMaceta Plastico Plastico = True
mismoTipoMaceta _ _ = False

instance Eq ProductoDeVivero where
    (Planta t1 u1 _ _) == (Planta t2 u2 _ _) = mismoTipoPlanta t1 t2 && mismaUbicacion u1 u2
    (BolsaSemilla _ pe1 pr1) == (BolsaSemilla _ pe2 pr2) = pe1 == pe2 && pr1 == pr2
    (Maceta tm1 _ _) == (Maceta tm2 _ _) = mismoTipoMaceta tm1 tm2

{-
ghci> (Planta PlenoSol Exterior Resistente 100) == (Planta PlenoSol Exterior Resistente 100)
True
ghci> (Planta PlenoSol Exterior Resistente 100) == (Planta PlenoSol Exterior Resistente 150)
True
ghci> (Planta PlenoSol Exterior Resistente 100) == (Planta Floral Exterior Resistente 150)
False
ghci> (Planta Floral Exterior Resistente 100) == (Planta Floral Exterior Resistente 150)
True
ghci> (Planta Floral Interior Resistente 100) == (Planta Floral Exterior Resistente 150)
False

ghci> (BolsaSemilla Cesped 10.5 150) == (BolsaSemilla Hortalizas 10.5 150)
True
ghci> (BolsaSemilla Cesped 10.5 150) == (BolsaSemilla Hortalizas 10.5 160)
False
ghci> (BolsaSemilla Cesped 10.51 150) == (BolsaSemilla Hortalizas 10.5 150)
False
ghci> (BolsaSemilla Cesped 10.51 150) == (BolsaSemilla Hortalizas 10.51 150)
True
ghci> (BolsaSemilla Cesped 10.51 150) == (BolsaSemilla Cesped 10.51 150)
True

ghci> (Maceta Plastico Redonda 100) == (Maceta Plastico Cuadrada 140)
True
ghci> (Maceta Plastico Redonda 100) == (Maceta Terracota Cuadrada 140)
False
ghci> (Maceta Plastico Redonda 100) == (Maceta Plastico Cuadrada 140)
True
ghci> (Maceta Plastico Redonda 100) == (Maceta Terracota Cuadrada 140)
False
-}

data EstadoHojas = MuchasQuemadas | PocasQuemadas | Saludables deriving(Show, Eq)
type Altura = Int
type TotalHojas = Int
type HojasFlorecidas = Int
type Meses = Int

data RegistroPlanta = DatoPlanta EstadoHojas Altura TotalHojas HojasFlorecidas Meses RegistroPlanta | NoDato deriving(Show)

transplantar :: RegistroPlanta -> Int -> Bool
transplantar (DatoPlanta PocasQuemadas a _ _ m pr) em = (a > 40 && m >= em) || transplantar pr em
transplantar (DatoPlanta Saludables a _ _ m pr) em = (a > 40 && m >= em) || transplantar pr em
transplantar (DatoPlanta MuchasQuemadas _ h _ m pr) em = (h < 10 && m >= em) || transplantar pr em
transplantar _ _ = False

{-
ghci> transplantar (DatoPlanta MuchasQuemadas 20 9 5 2 (DatoPlanta PocasQuemadas 45 15 5 2 (DatoPlanta Saludables 45 15 5 2 NoDato))) 2
True
ghci> transplantar (DatoPlanta MuchasQuemadas 20 9 5 2 (DatoPlanta PocasQuemadas 45 15 5 2 (DatoPlanta Saludables 39 15 5 2 NoDato))) 2
True
ghci> transplantar (DatoPlanta MuchasQuemadas 20 9 5 2 (DatoPlanta PocasQuemadas 39 15 5 2 (DatoPlanta Saludables 39 15 5 2 NoDato))) 2
True
ghci> transplantar (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 2 (DatoPlanta Saludables 39 15 5 2 NoDato))) 2
False
-}

devolverEstado :: RegistroPlanta -> Int -> Maybe EstadoHojas
devolverEstado (DatoPlanta e _ _ _ m pr) em |m >= em = Just e
                                            |otherwise = devolverEstado pr em
devolverEstado _ _ = Nothing

{-
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 5 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 2 NoDato))) 1
Just MuchasQuemadas
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 1
Just MuchasQuemadas
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 2
Just MuchasQuemadas
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 3
Just PocasQuemadas
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 4
Just PocasQuemadas
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 5
Just Saludables
ghci> devolverEstado (DatoPlanta MuchasQuemadas 20 15 5 2 (DatoPlanta PocasQuemadas 39 15 5 4 (DatoPlanta Saludables 39 15 5 5 NoDato))) 7
Nothing
-}