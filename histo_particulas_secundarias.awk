#! /usr/bin/awk -f 
BEGIN{
sum = 0
bin = 1.
for(i=0; i<100/bin; i++){
	count[i] = 0
}
i=0
sum = 0
}
{
if($1!="#"){
	i = i + 1
	sum += $7 # Suma de los valores de la columna 7
	}
if (i == 100){ # Número de filas que corresponde al número de partículas en cada flujo
	i = 0 # Pone el contador a cero
	count[int(sum/bin)]++ # cuenta el número de veces que se repiten los valores de la suma
	sum = 0 # Pone el valor de la suma a cero e inicia nuevamente
	}
}
END{
for(j=0; j < 100/bin; j++){
	print j*bin+bin/2, count[j];
	} 
}
