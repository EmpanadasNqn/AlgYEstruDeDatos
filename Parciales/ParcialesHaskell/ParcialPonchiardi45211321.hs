--Parcial 1 Laboratorio de Algoritmo y Estructuras de Datos
--Santino Ponchiardi 45211321, Turno 11hs, Tema C

-- Ejercicio 1c
valorODefault :: Int -> Maybe Int -> Int
valorODefault i Nothing = i
valorODefault _ (Just x) = x
{-
*Main> valorODefault 5 Nothing 
5
*Main> valorODefault 5 (Just 3) 
3
-}

-- Ejercicio 1d
data PodraSer a = NoEs | QuizaSi | Definitivamente a deriving (Show)
{-
*Main> Definitivamente 3
Definitivamente 3
*Main> QuizaSi
QuizaSi
*Main> NoEs
NoEs
*Main> :t NoEs
NoEs :: PodraSer a
*Main> :t QuizaSi
QuizaSi :: PodraSer a
*Main> :t Definitivamente 
Definitivamente :: a -> PodraSer a
-}

-- Ejercicio 2

-- Planta
data TipoPlanta = PlenoSol | MediaSombra | Floral | Frutal deriving (Show) --No debe estar en clase Eq ni Ord
data Ubicacion = Exterior | Interior deriving (Show) --No debe estar en clase Eq ni Ord
data Agua = MuyResistente | Resistente | NadaResistente deriving (Show)
type Precio = Int

-- BolsaSemilla
data TipoSemilla = Hortaliza | Aromaticas | Cesped deriving (Show)
type Peso = Float

--Maceta
data TipoMaceta = Terracota | FibroCemento | Plastico deriving (Show) --No debe estar en clase Eq ni Ord
data Forma = Cuadrada | Redonda deriving (Show)

-- Ejercicio 2a
--No debe estar en clase Eq ni Ord
data ProductoDeVivero = Planta TipoPlanta Ubicacion Agua Precio | BolsaSemilla TipoSemilla Peso Precio | Maceta TipoMaceta Forma Precio deriving (Show)

-- Ejercicio 2b
cuantasPlantas :: [ProductoDeVivero] -> TipoPlanta -> Int
cuantasPlantas [] _ = 0
cuantasPlantas ((Planta PlenoSol _ _ _):xs) PlenoSol = 1 + cuantasPlantas xs PlenoSol
cuantasPlantas ((Planta MediaSombra _ _ _):xs) MediaSombra = 1 + cuantasPlantas xs MediaSombra
cuantasPlantas ((Planta Floral _ _ _):xs) Floral = 1 + cuantasPlantas xs Floral
cuantasPlantas ((Planta Frutal _ _ _):xs) Frutal = 1 + cuantasPlantas xs Frutal
cuantasPlantas ((Planta _ _ _ _):xs) tp = cuantasPlantas xs tp
{-
*Main> cuantasPlantas [] Floral
0
*Main> cuantasPlantas [(Planta Floral Interior Resistente 200),(Planta Floral Interior Resistente 200),(Planta PlenoSol Interior Resistente 200)] Floral 
2
*Main> cuantasPlantas [(Planta Floral Interior Resistente 200),(Planta PlenoSol Interior Resistente 200),(Planta PlenoSol Interior Resistente 200)] Floral 
1
*Main> cuantasPlantas [(Planta Floral Interior Resistente 200),(Planta PlenoSol Interior Resistente 200),(Planta PlenoSol Interior Resistente 200),(Planta Floral Interior Resistente 200),(Planta Floral Interior Resistente 200)] Floral 
3
-}

-- Ejercicio 2c
plantasMismaUbicacion :: [ProductoDeVivero] -> [ProductoDeVivero] -> Bool
plantasMismaUbicacion [] [] = False
plantasMismaUbicacion ((Planta _ Exterior _ _):xs) ((Planta _ Exterior _ _):ys) = True
plantasMismaUbicacion ((Planta _ Interior _ _):xs) ((Planta _ Interior _ _):ys) = True
plantasMismaUbicacion ((Planta _ _ _ _):xs) ((Planta _ _ _ _):ys) = False

{-bolsaSemillaMismoPesoPrecio :: [BolsaSemilla] -> [BolsaSemilla] -> Bool
bolsaSemillaMismoPesoPrecio [] [] =  False
bolsaSemillaMismoPesoPrecio ((BolsaSemilla _ p1 pr1):xs) ((BolsaSemilla _ p2 pr2):ys) |p1 == p2 && pr1 == pr2 = True
                                                                                      |otherwise = Flase
-}

instance Eq ProductoDeVivero where
  pv1 == pv2 = ((cuantasPlantas [pv1] PlenoSol) == (cuantasPlantas [pv2] PlenoSol)) && (plantasMismaUbicacion [pv1] [pv2])
  pv1 == pv2 = ((cuantasPlantas [pv1] MediaSombra) == (cuantasPlantas [pv2] MediaSombra)) && (plantasMismaUbicacion [pv1] [pv2])
  pv1 == pv2 = ((cuantasPlantas [pv1] Floral) == (cuantasPlantas [pv2] Floral)) && (plantasMismaUbicacion [pv1] [pv2])
  pv1 == pv2 = ((cuantasPlantas [pv1] Frutal) == (cuantasPlantas [pv2] Frutal)) && (plantasMismaUbicacion [pv1] [pv2])
{-
*Main> (Planta PlenoSol Exterior Resistente 200) == (Planta PlenoSol Interior Resistente 200)
False
*Main> (Planta PlenoSol Exterior Resistente 200) == (Planta PlenoSol Exterior Resistente 200)
True
*Main> (Planta PlenoSol Exterior Resistente 200) == (Planta PlenoSol Interior Resistente 200)
False
*Main> (Planta PlenoSol Exterior Resistente 200) == (Planta MediaSombra Exterior Resistente 200)
False
*Main> (Planta MediaSombra Exterior Resistente 200) == (Planta MediaSombra Exterior Resistente 200)
True
-}

