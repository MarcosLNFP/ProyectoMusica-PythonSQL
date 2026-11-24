#Instalar psycopg para cargar PostgreSQL -- pip install psycopg
import psycopg2 as sql

with sql.connect(
    host="localhost",
    port=5432,
    dbname="musica",
    user="postgres",
    password="root"
) as conexion:
    with conexion.cursor() as cursor:
        cursor.execute("SELECT COUNT(*) FROM tienda.album")
        total_albumes = cursor.fetchone()[0]
        print(f"Conexión correcta. Hay {total_albumes} álbumes en tienda.album.") # Prueba de conexion y consulta básica de albumes