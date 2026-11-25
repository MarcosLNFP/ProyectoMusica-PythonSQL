#Instalar psycopg para cargar PostgreSQL -- pip install psycopg
import psycopg2 as postgre

def db_musica():
    with postgre.connect(
        host="localhost",
        port=5432,
        dbname="musica",
        user="postgres",
        password="root"
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


def print_basico(resultados):
    for fila in resultados:
        print(fila)


def main():
    resultados: db_musica
    opcion = None
    resultados = db_musica()
    print_basico(resultados)
# while opcion != 0:
#     print("""==========================================
#            TIENDA DE MUSICA
# ==========================================
# 1. Mostrar catalogo de albumes
# 2. Buscar artista y discografia
# 3. Filtrar albumes por formato
# 4. Buscar una cancion
# 5. Ranking de albumes mas vendidos
# 6. Resumen economico de la tienda
# 0. Salir
# ==========================================
# Elige una opcion:""")
#     match opcion:
#         case 1:
#         case 2:
#         case 3:
#         case 4:
#         case 5:
#         case 6:

if __name__ == "__main__":
    main()
    