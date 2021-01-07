import psycopg2

def execute_q(query):
    # Connect to an existing database
    conn = psycopg2.connect(
        host='zepalheta-postgres', 
        dbname='zepalheta', 
        user='postgres',
        password= 'qaninja'
    )

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    cur.execute(query)

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()

## Customers #############################################################
def format_cpf(cpf):
    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf [9:]

def insert_customer(name, cpf, address, phone):
    cpf_formatado = format_cpf(cpf)

    query = "insert into public.customers(name, cpf, address, phone_number) "\
        "values ('{}', '{}', '{}', '{}');".format(name, cpf_formatado, address, phone)
    print(query)

    execute_q(query)

def remove_customer_by_cpf(cpf):
    cpf_formatado = format_cpf(cpf)

    query = "delete from public.customers where cpf ='{}';".format(cpf_formatado)
    print(query)

    execute_q(query)

# 2º Desafio do RoboCamp 6
# ## Equipos #############################################################
def remove_equipo_by_name(eq_name):
    query = "delete from public.equipos where name ='{}';".format(eq_name)
    print(query)

    execute_q(query)

def insert_equipo(eq_name, eq_price):
    query = "insert into public.equipos(name, daily_price) "\
        "values ('{}', {});".format(eq_name, eq_price.replace(",","."))
    print(query)

    execute_q(query)
