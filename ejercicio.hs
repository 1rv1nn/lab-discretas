
{- funcion = cumpleaños
  Descripcion = Calula la edad exacta, hasta días, de una persona. Recibe dos tuplas que representan fechas con formato dd/mm/aaaa.
  La primera es la fecha actual y la segunda la fecha de nacimiento.
  Uso : cumpleaños (01,09,2025) (11,12,1998)
  -}

cumpleaños :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
cumpleaños (d, m, a) (d1, m1, a1) = if m<m1 then (d, m, a-a1-1)
  else if m==m1 && d<d1 then (d, m-m1, a-a1)
  else if m==m1 && d>=d1 then (d-d1, m-m1,a-a1 )
  else (d, m-m1, a-a1)
  
