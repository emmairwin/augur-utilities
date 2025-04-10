#SPDX-License-Identifier: MIT

import json
import psycopg2

def load_db_config(filename='db.config.json'):
    with open(filename, 'r') as f:
        return json.load(f)

def run_sql_script(sql, db_config):
    try:
        connection = psycopg2.connect(**db_config)
        cursor = connection.cursor()
        cursor.execute(sql)
        connection.commit()
        print("SQL script executed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

if __name__ == "__main__":
    db_config = load_db_config()

    # Optionally load from file to keep things clean
    with open("bulk_insert.sql", "r") as f:
        sql_script = f.read()

    run_sql_script(sql_script, db_config)