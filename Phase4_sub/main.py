# Project 4 D&A

import subprocess as sp
import pymysql
import pymysql.cursors
from prettytable import PrettyTable

def Search_ID():
    try:
        row = {}
        row["subpart"] = int(input("Enter Subpart: "))

        query = "SELECT * FROM PASSENGERS WHERE Pr_ID LIKE '%%%d%%'" % (row["subpart"])

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Bus_State():
    try:
        row = {}
        row["state"] = input("Enter State: ")

        query = "SELECT * FROM BUSES WHERE State='%s'" % (row["state"])

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Last_Digit():
    try:
        row = {}
        row["digit"] = int(input("Enter Last Digit: "))

        query = "SELECT Driver_ID,Dr_Name FROM DRIVERS WHERE Driver_ID LIKE '%%%d'" % (row["digit"])

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Max_Journey():
    try:

        query = "SELECT Pr_Name, Journeys FROM PASSENGERS WHERE Journeys IN (SELECT MAX(Journeys) FROM PASSENGERS)"

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Analysis():
    try:
        row = {}
        row["min"] = int(input("Minimum Age: "))
        row["max"] = int(input("Maximum Age: "))

        query = "select SUM(Journeys),COUNT(Journeys),AVG(Journeys) from PASSENGERS where Pr_ID in (select Pr_ID from PASSENGERS where Age>%d and Age<%d)" % (row["min"], row["max"])

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Min_Journey():
    try:
        row = {}
        row["min"] = int(input("Enter minimum number of journeys: "))

        query = "SELECT * FROM PASSENGERS WHERE Journeys>%d" % (row["min"])

        print(query)
        cur.execute(query)
        con.commit()
        table = cur.fetchall()
        desc = cur.description

        fieldstuple = []
        for rows in desc:
            fieldstuple.append(rows[0])

        newtable = PrettyTable(fieldstuple)
        for rows in table:
            row = []
            for i in rows.values():
                row.append(i)
            newtable.add_row(row)
        print(newtable)

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def Buy_Bus():
    try:
        row = {}
        print("Enter new bus' details: ")
        row["busid"] = int(input("Bus ID: "))
        row["State"] = input("State: ")
        row["Number"] = int(input("Number Assigned: "))
        row["AC"] = input("AC: ")
        row["Seater"] = int(input("Seater: "))
        row["Sleeper"] = int(input("Sleeper: "))
        row["Total"] = row["Seater"] + row["Sleeper"]

        query = "INSERT INTO BUSES(Bus_ID, State, Number_assigned, AC, nSeater_seats, nSleeper_seats, Total) VALUES('%d', '%s', '%d', '%s', '%d', '%d', '%d')" % (
            row["busid"], row["State"], row["Number"], row["AC"], row["Seater"], row["Sleeper"], row["Total"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def Passenger():
    try:
        row = {}
        print("Enter new passenger details: ")
        row["id"] = int(input("Passenger ID: "))
        row["name"] = input("Passenger Name: ")
        row["age"] = int(input("Age: "))
        row["gender"] = input("Gender: ")
        row["journeys"] = int(input("Journeys: "))

        query = "INSERT INTO PASSENGERS(Pr_ID, Pr_Name, Age, Gender, Journeys) VALUES('%d', '%s', '%d', '%s', '%d')" % (
            row["id"], row["name"], row["age"], row["gender"], row["journeys"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def Fire_Driver():
    try:
        row = {}
        row["id"] = int(input("Driver ID: "))

        query = "DELETE FROM DRIVERS WHERE Driver_Id=%d" % row["id"]

        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def Change_Prices():
    try:
        row = {}
        row["day"] = input("Category of Day: ")
        row["sleeper"] = int(input("Sleeper Prices: "))
        row["seater"] = int(input("Seater Prices: "))

        query = "UPDATE TICKET_PRICES SET Sleeper_price='%d', Seater_price='%d' WHERE Category_of_day='%s'" % (row["sleeper"], row["seater"], row["day"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        Search_ID()
    elif(ch == 2):
        Bus_State()
    elif(ch == 3):
        Last_Digit()
    elif(ch == 4):
        Max_Journey()
    elif(ch == 5):
        Analysis()
    elif(ch == 6):
        Min_Journey()
    elif(ch == 7):
        Buy_Bus()
    elif(ch == 8):
        Passenger()
    elif(ch == 9):
        Fire_Driver()
    elif(ch == 10):
        Change_Prices()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="root",
                              password="pass",
                              db='Project',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. Retrieve Passengers whose Pr_ID having a certain subpart")
                print("2. Retrieve all buses of a certain state")
                print("3. Retrieve all Drivers' Names whose Driver_ID ends in a digit")
                print("4. Retrieve maximum number of journeys done by a single passenger")
                print("5. Retrieve Sum, Count, Average of Journeys done by passengers in a range of ages")
                print("6. Retrieve passengers with more than a certain number of journeys")
                print("7. Buy a New Bus")
                print("8. Add Passenger Details")
                print("9. Fire a Driver")
                print("10. Change Prices")
                print("11. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 11:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
