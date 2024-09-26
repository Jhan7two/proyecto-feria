from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
app.secret_key = "Cairocoders-Ednalan"

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'directorio_de_empleado'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host=app.config['MYSQL_DATABASE_HOST'],
            user=app.config['MYSQL_DATABASE_USER'],
            password=app.config['MYSQL_DATABASE_PASSWORD'],
            database=app.config['MYSQL_DATABASE_DB']
        )
        if conn.is_connected():
            return conn
    except Error as e:
        print(f"Error: {e}")
        return None

@app.route('/')
def Index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute('SELECT * FROM informacion_empleado')
    data = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('index.html', employee=data)

@app.route('/add_contact', methods=['POST'])
def add_employee():
    if request.method == 'POST':
        nombre = request.form['nombre']
        phone = request.form['telefono']
        correo = request.form['correo']
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("INSERT INTO informacion_empleado (Nombre, Correo, Telefono) VALUES (%s, %s, %s)",(nombre, correo, phone))
        conn.commit()
        cursor.close()
        conn.close()
        flash('Empleado añadido exitosamente')
        return redirect(url_for('Index'))

@app.route('/edit/<int:id>', methods=['GET'])
def get_employee(id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute('SELECT * FROM informacion_empleado WHERE ID_empleado = %s', (id,))
    data = cursor.fetchone()

    cursor.close()
    conn.close()
    if data:
        return render_template('edit.html', employee=data)
    else:
        flash('Empleado no encontrado')
        return redirect(url_for('Index'))

@app.route('/update/<int:id>', methods=['POST'])
def update_employee(id):
    if request.method == 'POST':
        nombre = request.form['nombre']
        telefono = request.form['telefono']
        correo = request.form['correo']
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE informacion_empleado
            SET Nombre = %s,
                Correo = %s,
                Telefono = %s
            WHERE ID_empleado = %s
        """, (nombre, correo, telefono, id))
        conn.commit()
        cursor.close()
        conn.close()
        flash('Actualización exitosa')
        return redirect(url_for('Index'))

@app.route('/delete/<int:id>', methods=['POST'])
def delete_employee(id):
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute('DELETE FROM informacion_empleado WHERE ID_empleado = %s', (id,))
    conn.commit()
    cursor.close()
    conn.close()
    flash('Empleado eliminado exitosamente')
    return redirect(url_for('Index'))

# starting the app
if __name__ == "__main__":
    app.run(port=3000, debug=True)
