-- Ejercicio 02 - b
-- Variedades arabica no resistentes a la roya, por nombre descendente

SELECT
    T1.variety_name AS variety,
    T1.species AS species
FROM farm.coffee_varieties AS T1
WHERE
    T1.is_rust_resistant = FALSE
    AND T1.species = 'arabica'
ORDER BY T1.variety_name DESC;
/*
    variety    | species
---------------+---------
 Típica        | arabica
 Pacamara      | arabica
 Maragogipe    | arabica
 Geisha        | arabica
 Caturra       | arabica
 Borbón Rosado | arabica
 Borbón        | arabica

/*
