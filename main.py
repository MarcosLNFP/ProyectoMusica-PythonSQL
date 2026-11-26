#Instalar psycopg para cargar PostgreSQL -- pip install psycopg2
import psycopg2 as postgre

def db_musica():
    with postgre.connect(
        host="localhost",
        port=5432,
        dbname="musica",
        user="postgres",
        password="root" #Poner contraseña del servidor Postgres
    ) as conexion:
        with conexion.cursor() as cursor:
            sql = """
                SELECT a.id_artista, a.nombre, a.nacionalidad, al.id_album, al.titulo, al.fecha_lanzamiento, al.formato, al.canciones, al.precio, al.stock, v.id_venta, v.fecha_hora, v.unidades 
                FROM tienda.artista a
                INNER JOIN tienda.album al
                    ON a.id_artista = al.id_artista
                LEFT JOIN tienda.ventas v
                    ON al.id_album = v.id_album;"""
            cursor.execute(sql)
            return cursor.fetchall()


#1.Mostrar catálogo de álbumes
def mostrar_catalogo(resultados): 
    encontrados = [] #crea una lista vacía para los ID encontrados

    for fila in resultados: #recorre los registros
        if fila[3] not in encontrados: #comprueba si el ID no está
            print("------")
            print("Album:", fila[4])
            print("Artista:", fila[1])
            print("Fecha:", fila[5])
            print("Formato:", fila[6])
            print("Canciones:", fila[7])
            print("Precio:", fila[8])
            print("Stock:", fila[9])

            encontrados.append(fila[3]) #añade el ID del album a la lista 

#2.Buscar artista y discografía            
def buscar_artista(resultados):
    nombre = input("Introduce nombre del artista: ").lower() #pide al usuario el nombre del artista
    encontrado = False #comprueba si encontramos al artista
    albumes = [] #crea una lista vacía para los albumes encontrados

    for fila in resultados: #recorre todos los registros
        if nombre in fila[1].lower(): #comprueba si el nombre introducido esta dentro de la lista de artistas
            encontrado = True #indica que se ha encontrado el artista

            if fila[3] not in albumes: 
                print("------")
                print("Nombre: ", fila[1])
                print("Nacionalidad: ", fila[2])
                print("Álbumes: ", fila[4])
                print("Formato: ", fila[6])

                albumes.append(fila[3]) #guarda el ID del album en la lista
                encontrado = True #indica que hemos encontrado el artista

    if encontrado == False: #Si no se encuentra el artista muestra el mensaje
        print("Artista no encontrado")

#3.Filtrar albumes por formato
def filtrar_albumes(resultados): 
    formato = input("Introduce formato (CD, Vinilo, Casette) :").lower() 
    encontrado = False #Comprueba si hemos encontrado algún album
    albumes = [] #Crea una lista vacía para los álbumes encontrados

    for fila in resultados: 
        if fila[6].lower() == formato: #comprueba si el formato del álbum coincide con el que se introduce
            encontrado = True #Indica que se ha encontrado un álbum con ese formato

            if fila[3] not in albumes: 
                print("------")
                print("Album: ", fila[4])
                print("Artista: ", fila[1])
                print("Formato: ", fila[6])
                print("Precio: ", fila[8])

                albumes.append(fila[3]) #guarda el ID del album para que no se repita

    if encontrado == False: #Comprueba si no se ha encontrado ningún álbum con ese formato
       print("No se encontraron álbumes en ese formato")
        
#4.Buscar una canción
def buscar(resultados):
    texto = input("Introduce un texto: ").lower()
    mostrados = set() #Tupla para evitar duplicados
    for fila in resultados: 
        artista = fila[1]
        canciones = fila[7] 
        for cancion in canciones: #Filtrar por coincidencia
            coincidencia = (artista, cancion)
            if texto in cancion.lower() and coincidencia not in mostrados:
                    print(f"{artista} — {cancion}") #imprime por pantalla las canciones coincidentes
                    mostrados.add(coincidencia)
                
#Ranking de álbumes más vendidos                    
def ranking(resultados):
    totales = {} # Diccionario 
    for fila in resultados:
        titulo = fila[4]
        unidades = fila[12]
        if titulo not in totales:
            totales[titulo] = 0 #Se añade el titulo del album al diccionario
        totales[titulo] += unidades # Se suman las unidades totales al diccionario

    ordenados = sorted(totales.items(), key=lambda album: album[1], reverse=True) # Ordena de mayor a menor
    contador = 1 # Contador para rankear los 31 albumes
    for titulo, unidades in ordenados: #Muestra los albumes en varias lineas usando el diccionario
        print(f"{contador}. {titulo} - {unidades} unidades")
        contador += 1
        
#Mostrar precio de los albumes en orden
def albumes_precio(resultados):
    albumes = {} #Diccionario
    for fila in resultados:
        idalbum = fila[3]
        titulo = fila[4]
        precio = fila[8]
        if idalbum not in albumes:
            albumes[idalbum] = (titulo, precio) #Añadir al diccionario el idalbum y sus claves titulo y precio
    ordenados = sorted(albumes.values(), key=lambda album: album[1], reverse=True) #Ordenar de mayor a menor los precios
    for titulo, precio in ordenados:
        print(f"{titulo} - {precio} €")

def main():
    opcion = None
    resultados = db_musica()
    while opcion != 0:
        print("""
==========================================
        TIENDA DE MUSICA
==========================================
1. Mostrar catalogo de albumes
2. Buscar artista y discografia
3. Filtrar albumes por formato
4. Buscar una cancion
5. Ranking de albumes mas vendidos
6. Filtrar albumes por precio
0. Salir
==========================================""")
        opcion = int(input("Elige una opcion: "))
        match opcion:
            case 0:
                print("Saliendo del programa...")
            case 1:
                mostrar_catalogo(resultados)
            case 2:
                buscar_artista(resultados)
            case 3:
                filtrar_albumes(resultados)
            case 4:
                buscar(resultados)
            case 5:
                ranking(resultados)
            case 6:
                albumes_precio(resultados)
            case _:
                print("Opción no valida")


if __name__ == "__main__":
    main()
    
