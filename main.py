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


def print_basico(resultados): #Probar que la consulta funciona
    for fila in resultados[:31]:
        print(f"ID: {fila[0]}")
        print(f"Nombre: {fila[1]}")
        print(f"Nacionalidad: {fila[2]}")
        print(f"ID Album: {fila[3]}")
        print(f"Título del álbum: {fila[4]}")
        print(f"Fecha de lanzamiento: {fila[5]}")
        print(f"Formato: {fila[6]}")
        print(f"Canciones: {', '.join(fila[7] or [])}")
        print(f"Precio: {fila[8]} €")
        print(f"Stock disponible: {fila[9]}")
        print(f"ID de la venta: {fila[10]}")
        print(f"Fecha y hora de la venta: {fila[11]}")
        print(f"Unidades vendidas: {fila[12]}")

def buscar(resultados):
    texto = input("Introduce un texto: ").lower()
    encontrados = set()
    for fila in resultados[:31]:
        artista = fila[1]
        canciones = fila[7]
        for cancion in canciones:
            if texto in cancion.lower():
                coincidencia = (artista, cancion)
                if coincidencia not in encontrados:
                    print(f"{artista} — {cancion}")
                    encontrados.add(cancion)

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
6. Resumen economico de la tienda
7. Prueba Consulta 
0. Salir
==========================================""")
        opcion = int(input("Elige una opcion: "))
        match opcion:
            case 1:
                print("1")
            case 2:
                print("2")
            case 3:
                print("3")
            case 4:
                buscar(resultados)
            case 5:
                print("5")
            case 6:
                print("6")
            case 7:
                print_basico(resultados)


if __name__ == "__main__":
    main()
    