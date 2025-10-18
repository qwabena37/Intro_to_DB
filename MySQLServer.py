#!/usr/bin/env python3
"""
MySQLServer.py

CREATE DATABASE IF NOT EXISTS alx_book_store

"""

import sys
import mysql.connector
from mysql.connector import errorcode

def main():
    # Ensure user provided necessary arguments
    if len(sys.argv) < 4:
        print("Usage: python3 MySQLServer.py <host> <user> <password>")
        sys.exit(1)

    host = sys.argv[1]
    user = sys.argv[2]
    password = sys.argv[3]
    db_name = "alx_book_store"

    conn = None
    cursor = None

    try:
        # Connect to MySQL server (not to a specific database)
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Kwabena123.'
        )
        cursor = conn.cursor()

        # Try to create the database
        cursor.execute(f"CREATE DATABASE {db_name}")
        print(f"Database '{db_name}' created successfully!")

    except mysql.connector.Error as err:
        # Handle "database already exists" gracefully
        if err.errno == errorcode.ER_DB_CREATE_EXISTS:
            print(f"Database '{db_name}' already exists.")
        else:
            print(f"Error: {err}")
    finally:
        # Properly close resources
        if cursor is not None:
            cursor.close()
        if conn is not None and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    main()
