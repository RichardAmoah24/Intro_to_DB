import mysql.connector
from mysql.connector import Error


def create_database():
    try:
        # Connect to MySQL server (adjust username and password as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Rich.Amoah$my24"
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f""except mysql.connector.Error")

    finally:
        # Close cursor and connection properly
        if connection.is_connected():
            cursor.close()
            connection.close()
            # Optional message to confirm closing
            print("MySQL connection closed.")


if __name__ == "__main__":
    create_database()

