#SPDX-License-Identifier: MIT
""" 
    _email_columns_
    cmt_author_raw_email
    cmt_author_email
    cmt_committer_raw_email
    cmt_committer_email
    
    ## Decode: 

        SELECT convert_from(pgp_sym_decrypt(decode(your_text_column, 'base64'), 'your_secret_key'), 'UTF8') AS decrypted_text
        FROM your_table;
"""
# -- Enable the pgcrypto extension if not already enabled.
import psycopg2

def main():
    # Replace these connection details with your actual database credentials.
    conn = psycopg2.connect(
        dbname='your_database',
        user='your_user',
        password='your_password',
        host='your_host',
        port='your_port'
    )
    
    cursor = conn.cursor()
    try:
        # Create the pgcrypto extension if it doesn't exist.
        cursor.execute("CREATE EXTENSION IF NOT EXISTS pgcrypto;")
        conn.commit()
        
        # Encrypt cmt_author_raw_email.
        cursor.execute("""
            UPDATE commits
            SET cmt_author_raw_email = encode(pgp_sym_encrypt(cmt_author_raw_email, 'your_secret_key'), 'base64');
        """)
        conn.commit()
        
        # Encrypt cmt_author_email.
        cursor.execute("""
            UPDATE commits
            SET cmt_author_email = encode(pgp_sym_encrypt(cmt_author_email, 'your_secret_key'), 'base64');
        """)
        conn.commit()
        
        # Encrypt cmt_committer_raw_email.
        cursor.execute("""
            UPDATE commits
            SET cmt_committer_raw_email = encode(pgp_sym_encrypt(cmt_committer_raw_email, 'your_secret_key'), 'base64');
        """)
        conn.commit()
        
        # Encrypt cmt_committer_email.
        cursor.execute("""
            UPDATE commits
            SET cmt_committer_email = encode(pgp_sym_encrypt(cmt_committer_email, 'your_secret_key'), 'base64');
        """)
        conn.commit()
        
        print("Encryption updates applied successfully.")
    except Exception as e:
        print("An error occurred:", e)
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
    
    
CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

UPDATE commits
SET cmt_author_raw_email = encode(pgp_sym_encrypt(cmt_author_raw_email, 'your_secret_key'), 'base64');

COMMIT;




