import mysql.connector

# Function to execute a custom query
def execute_custom_query():
    query = input("Enter your custom query: ")
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        if result:
            for row in result:
                print(row)
        else:
            print("No results found.")
    except mysql.connector.Error as e:
        print(f"Error executing query: {e}")


# Function to insert data into tables
def insert_data(table_name):
    if table_name.lower() == "championship":
        championship_id = int(input("Enter Championship ID: "))
        year = int(input("Enter Year: "))
        try:
            cursor.execute("INSERT INTO Championship (championship_id, year) VALUES (%s, %s)",
                           (championship_id, year))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")

    elif table_name.lower() == "grandprix":
        race_id = int(input("Enter Race ID: "))
        race_name = input("Enter Race Name: ")
        location = input("Enter Location: ")
        track_type = input("Enter Track Type: ")
        date = input("Enter Race Date (YYYY-MM-DD): ")
        championship_id = int(input("Enter Championship ID: "))
        circuit_id = int(input("Enter Circuit ID: "))
        try:
            cursor.execute(
                "INSERT INTO GrandPrix (race_id, race_name, location, track_type, date, championship_id, circuit_id) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                (race_id, race_name, location, track_type, date, championship_id, circuit_id))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")

    elif table_name.lower() == "circuit":
        circuit_id = int(input("Enter Circuit ID: "))
        circuit_name = input("Enter Circuit Name: ")
        location = input("Enter Location: ")
        length_km = float(input("Enter Circuit Length (km): "))
        try:
            cursor.execute(
                "INSERT INTO Circuit (circuit_id, circuit_name, location, length_km) VALUES (%s, %s, %s, %s)",
                (circuit_id, circuit_name, location, length_km))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")

    elif table_name.lower() == "team":
        team_id = int(input("Enter Team ID: "))
        team_name = input("Enter Team Name: ")
        constructor = input("Enter Constructor: ")
        championship_id = int(input("Enter Championship ID: "))
        try:
            cursor.execute(
                "INSERT INTO Team (team_id, team_name, constructor, championship_id) VALUES (%s, %s, %s, %s)",
                (team_id, team_name, constructor, championship_id))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")

    elif table_name.lower() == "driver":
        driver_id = int(input("Enter Driver ID: "))
        driver_name = input("Enter Driver Name: ")
        nationality = input("Enter Nationality: ")
        dob = input("Enter Date of Birth (YYYY-MM-DD): ")
        team_id = int(input("Enter Team ID: "))
        try:
            cursor.execute(
                "INSERT INTO Driver (driver_id, driver_name, nationality, dob, team_id) VALUES (%s, %s, %s, %s, %s)",
                (driver_id, driver_name, nationality, dob, team_id))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")

    elif table_name.lower() == "raceresult":
        result_id = int(input("Enter Result ID: "))
        race_id = int(input("Enter Race ID: "))
        driver_id = int(input("Enter Driver ID: "))
        position = int(input("Enter Position: "))
        points = float(input("Enter Points: "))
        fastest_lap = input("Enter Fastest Lap Time (HH:MM:SS) or leave blank: ")
        fastest_lap = fastest_lap if fastest_lap else None
        try:
            cursor.execute(
                "INSERT INTO RaceResult (result_id, race_id, driver_id, position, points, fastest_lap) VALUES (%s, %s, %s, %s, %s, %s)",
                (result_id, race_id, driver_id, position, points, fastest_lap))
            connection.commit()
            print("Data inserted successfully.")
        except mysql.connector.Error as e:
            print(f"Error inserting data: {e}")


# Function to select data from a table
def select_data(table_name):
    try:
        cursor.execute(f"SELECT * FROM {table_name}")
        result = cursor.fetchall()
        if result:
            for row in result:
                print(row)
        else:
            print("No results found.")
    except mysql.connector.Error as e:
        print(f"Error selecting data: {e}")


# Function to delete data from a table
def delete_data(table_name):
    try:
        key_name = input(f"Enter primary key name of {table_name}: ")
        key_value = input(f"Enter primary key value of {table_name}: ")
        cursor.execute(f"DELETE FROM {table_name} WHERE {key_name} = %s", (key_value,))
        connection.commit()
        print("Data deleted successfully.")
    except mysql.connector.Error as e:
        print(f"Error deleting data: {e}")


def update_data(table_name):
    try:
        column_name = input(f"Enter the column you want to update in {table_name}: ")
        new_value = input(f"Enter new value for {column_name}: ")
        key_name = input(f"Enter primary key column name: ")
        key_value = input(f"Enter primary key value: ")

        query = f"UPDATE {table_name} SET {column_name} = %s WHERE {key_name} = %s"
        cursor.execute(query, (new_value, key_value))
        connection.commit()
        print("Data updated successfully.")
    except mysql.connector.Error as e:
        print(f"Error updating data: {e}")


# Main menu function
def main_menu():
    while True:
        print("\nMain Menu:")
        print("1. Insert data")
        print("2. Select data")
        print("3. Delete data")
        print("4. Execute custom query")
        print("5. Update data")
        print("6. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            table_name = input("Enter table name to insert data into: ")
            insert_data(table_name)
        elif choice == "2":
            table_name = input("Enter table name to select data from: ")
            select_data(table_name)
        elif choice == "3":
            table_name = input("Enter table name to delete data from: ")
            delete_data(table_name)
        elif choice == "4":
            execute_custom_query()
        elif choice == "5":
            table_name = input("Enter table name to update data: ")
            update_data(table_name)
        elif choice == "6":
            break
        else:
            print("Invalid choice. Please try again.")


# Connect to MySQL database
u = input("Enter MySQL username: ")
p = input("Enter MySQL password: ")

try:
    connection = mysql.connector.connect(
        host="localhost",
        user=u,
        password=p,
        database="khan_21378681"
    )
    cursor = connection.cursor()
    main_menu()
except mysql.connector.Error as e:
    print(f"Error connecting to database: {e}")

# Close cursor and connection
cursor.close()
connection.close()