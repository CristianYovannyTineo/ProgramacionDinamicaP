Proceso CaminoMinimoFuerzaBruta_Desde1
    Definir filas, columnas, i, j Como Entero
    Escribir "Ingrese número de filas:"
    Leer filas
    Escribir "Ingrese número de columnas:"
    Leer columnas
	
    Dimension matriz[filas, columnas]
	
    // Leer matriz desde [1,1]
    Para i <- 1 Hasta filas
        Para j <- 1 Hasta columnas
            Escribir "Ingrese el valor de la celda [", i, "][", j, "]:"
            Leer matriz[i, j]
        FinPara
    FinPara
	
    // Mostrar la matriz ingresada
    Escribir "Matriz ingresada:"
    Para i <- 1 Hasta filas
        Para j <- 1 Hasta columnas
            Escribir Sin Saltar matriz[i, j], " "
        FinPara
        Escribir ""
    FinPara
	
    // Simular fuerza bruta con pila
    Definir minimo, suma, tope, f, c Como Entero
    minimo <- 999999
	
    Dimension pilaF[1000], pilaC[1000], pilaSuma[1000]
    tope <- 1
    pilaF[tope] <- 1
    pilaC[tope] <- 1
    pilaSuma[tope] <- matriz[1, 1]
	
    Mientras tope >= 1 Hacer
        f <- pilaF[tope]
        c <- pilaC[tope]
        suma <- pilaSuma[tope]
        tope <- tope - 1
		
        Si f = filas Y c = columnas Entonces
            Si suma < minimo Entonces
                minimo <- suma
            FinSi
        Sino
            // Mover abajo
            Si f + 1 <= filas Entonces
                tope <- tope + 1
                pilaF[tope] <- f + 1
                pilaC[tope] <- c
                pilaSuma[tope] <- suma + matriz[f + 1, c]
            FinSi
			
            // Mover derecha
            Si c + 1 <= columnas Entonces
                tope <- tope + 1
                pilaF[tope] <- f
                pilaC[tope] <- c + 1
                pilaSuma[tope] <- suma + matriz[f, c + 1]
            FinSi
        FinSi
    FinMientras
	
    Escribir "La suma mínima por fuerza bruta es: ", minimo
FinProceso
