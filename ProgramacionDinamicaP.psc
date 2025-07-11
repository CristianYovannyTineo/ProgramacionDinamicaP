
Proceso CaminoMinimoIngresoUsuario
    Definir grid, dp, padre_fila, padre_columna, visual Como Entero
    Definir filas, columnas, i, j, i_actual, j_actual Como Entero
    Dimension grid[10,10]
    Dimension dp[10,10]
    Dimension padre_fila[10,10]
    Dimension padre_columna[10,10]
    Dimension visual[10,10]
	
    // Solicitar tamaño
    Escribir "Ingrese cantidad de filas:"
    Leer filas
    Escribir "Ingrese cantidad de columnas:"
    Leer columnas
	
    // Leer datos de la matriz
    Para i = 1 Hasta filas
        Para j = 1 Hasta columnas
            Escribir "Ingrese valor para la posicion (", i, ",", j, "):"
            Leer grid[i,j]
            visual[i,j] = grid[i,j]
        FinPara
    FinPara
	
    // Inicializar DP y padres
    dp[1,1] = grid[1,1]
    padre_fila[1,1] = -1
    padre_columna[1,1] = -1
	
    Para j = 2 Hasta columnas
        dp[1,j] = dp[1,j-1] + grid[1,j]
        padre_fila[1,j] = 1
        padre_columna[1,j] = j-1
    FinPara
	
    Para i = 2 Hasta filas
        dp[i,1] = dp[i-1,1] + grid[i,1]
        padre_fila[i,1] = i-1
        padre_columna[i,1] = 1
    FinPara
	
    Para i = 2 Hasta filas
        Para j = 2 Hasta columnas
            Si dp[i-1,j] < dp[i,j-1] Entonces
                dp[i,j] = grid[i,j] + dp[i-1,j]
                padre_fila[i,j] = i-1
                padre_columna[i,j] = j
            SiNo
                dp[i,j] = grid[i,j] + dp[i,j-1]
                padre_fila[i,j] = i
                padre_columna[i,j] = j-1
            FinSi
        FinPara
    FinPara
	
    Escribir "Costo minimo: ", dp[filas, columnas]
	
    // Marcar camino con -99
    i_actual = filas
    j_actual = columnas
    Mientras i_actual <> -1 Y j_actual <> -1
        visual[i_actual, j_actual] = -99
        i = padre_fila[i_actual, j_actual]
        j = padre_columna[i_actual, j_actual]
        i_actual = i
        j_actual = j
    FinMientras
	
    // Mostrar matriz con el camino marcado
    Escribir "Matriz con el camino minimo (-99 indica el camino):"
    Para i = 1 Hasta filas
        linea <- ""
        Para j = 1 Hasta columnas
            Si visual[i,j] = -99 Entonces
                linea <- linea + "[*]"
            SiNo
                linea <- linea + "[" + ConvertirATexto(grid[i,j]) + "]"
            FinSi
        FinPara
        Escribir linea
    FinPara
FinProceso
