{- 
Haskell es de Fuerte Tipado y con Tipado Estatico, esto nos dice:

~Toda expresion tiene un tipo
~Los errores son detectados antes de la ejecucion de un programa

Tipos:
~Basicos: Int, Integer, Float, Double, Bool, Char, String, ...
~Estructurados: Listas, Tuplas, ...

Polimorfismo Parametrico, es una funcion que puede tener mas de un tipo:
Ej: id :: a -> a
a es una variable de tipo y puede ser cualquiera
~No conoce nada del tipo
~Su comportamiento es dependiente del tipo concreto con el que se use

Currificacion, es cuando las funciones tienen un unico parametro
Ej: max :: Ord a => a -> a -> a

Polimorfismo AdHoc, es una funcion que puede tener distintos comportamientos dependiendo del tipo concreto
con el que se use. Se logra mediante type Classes

Tipos Algebraicos sin parametros (Enumerados)
data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabados | Domingo

Tipos Algebraicos con parametros
data Figura = Circulo (Float, Float) Float | Rectangulo (Float, Float) (Float, Float)

Sinonimos de tipo
type Punto = (Float, Float)
data Figura = Circulo Punto Float | Rectangulo Punto Punto

Tipos de Datos Recursivos, es cuando puede tomar un tamaño arbitrario
Ej: data ListaInt = LVacia | ConsI Int ListaInt
Usado en GHCI queda: ConsI 1 (ConsI 2 (ConsI 3 (ConsI 4 (ConsI 5 LVacia))))
Y devuelve: [1,2,3,4,5]

Tipos Recursivos y Polimorficos
Ej: data Lista a = Vacia | Cons a (Lista a)
let l = Cons True Vacia
let l' = Cons (10::Int) (Cons 0 (Cons 7 Vacia))
l es de tipo Bool y l' es de tipo Int

Tipo Maybe, se usa cuando queremos definir una funcion y existe uno o mas casos en los
que el resultado no se encuentra en el tipo que es imagen de la funcion, por eso se
crea un nuevo tipo que extiende al tipo original agregando un punto distinguido: Nothing
Ej: data Maybe a = Nothing | Just a
-}