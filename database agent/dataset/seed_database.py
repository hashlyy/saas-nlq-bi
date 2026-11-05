import os
import mysql.connector
from dotenv import load_dotenv
from pathlib import Path

# Load .env file from parent directory
parent_dir = Path(__file__).parent.parent
load_dotenv(parent_dir / '.env')

def seed_database():
    connection = None
    
    try:
        # Connect to the database
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            database=os.getenv('DB_NAME'),
            allow_local_infile=True  # Required for importing data files
        )
        
        print("Connected to MySQL server")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Empty the database before seeding
        print("Emptying database tables...")
        
        # Get all tables
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        
        # Disable foreign key checks temporarily
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
        
        # Truncate all tables
        for table in tables:
            table_name = table[0]
            print(f"Truncating table: {table_name}")
            cursor.execute(f"TRUNCATE TABLE {table_name}")
        
        # Re-enable foreign key checks
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
        
        connection.commit()
        print("Database emptied successfully")
        
        # Read the seed_data.sql file
        seed_data_path = Path(__file__).parent / 'seed_data.sql'
        with open(seed_data_path, 'r') as f:
            seed_data = f.read()
        
        print("Running seed data script...")
        
        # Split the script into individual statements
        statements = seed_data.split(';')
        
        # Execute each statement
        for statement in statements:
            if statement.strip():
                cursor.execute(statement + ';')
        
        # Commit the changes
        connection.commit()
        
        print("Database seeded successfully!")
        
    except mysql.connector.Error as error:
        print(f"Error seeding database: {error}")
    finally:
        if connection:
            cursor.close()
            connection.close()
            print("Database connection closed")

if __name__ == "__main__":
    seed_database() 