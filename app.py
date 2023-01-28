

from flask import Flask,render_template, request, session, url_for
from flask_mysqldb import MySQL
import MySQLdb.cursors
from werkzeug.security import check_password_hash, generate_password_hash
import config
import MySQLdb.cursors

app = Flask(__name__)

mysql = MySQL()
mysql.init_app(app)


#CONFIGURACIONES DE LA BASE DE DATOS 
app.secret_key = 'your secret key'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'verificacion'

#CIERRE CONFIGURACIONES

#cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor) para iniciar
# mysql.connection.commit() Para finalizar la conexion a la base de datos


#cursor.execute("") para ejecutar las instrucciones sql


@app.route('/')
def Index():
   
    return render_template('login.html')



# Aqui comienza el login 

@app.route('/login',methods=["GET", "POST"])
def login():
    session.clear()
    
    if request.method == "POST":
        usuario = request.form['loginUser']
        Contraseña = request.form['loginPassword']
        if usuario == "" or Contraseña == "":
            return render_template('login.html', errorlogin=1)
        else:

            cur = mysql.connection.cursor()
            cur.execute("select * from tb_credenciales Where Usuarios = %s",[usuario])
            results = cur.fetchone()
            if len(results) == 0 or not check_password_hash(results[2], Contraseña):
                return render_template('index.html', errorlogin=1)
            else:
                   
                    # Recordar el usuario y rol que se logeo
                    session["user"] = results[1]
                    session["userrole"] = results[3]
                    #ESTAS CONSULTAS SON PARA TRAER LOS PROVEEDORES Y LOS DATOS DE LOS SELECT
                    #CONSULTA PARA LOS PROVEEDORES
                    cur = mysql.connection.cursor()
                    cur.execute("select * from tb_proveedor Where IdEstado = 1")
                    Proveedores = cur.fetchall()
                    #CONSULTA PARA LOS PUNTOS DE COMPRA
                    cur = mysql.connection.cursor()
                    cur.execute("select * from tb_puntocompra Where IdEstado = 1")
                    punto = cur.fetchall()
                    #CONSULTA PARA LOS MATERIALES
                    cur = mysql.connection.cursor()
                    cur.execute("select * from tb_material Where Id_Estado = 1")
                    material = cur.fetchall()
                    #CONSULTA PARA LOS VERIFICADORES
                    cur = mysql.connection.cursor()
                    cur.execute("select * from tb_usuarios Where IdEstado = 1 AND IdCargo = 2")
                    verificador = cur.fetchall()
                    #CONSULTA PARA LOS DIGITADOR
                    cur = mysql.connection.cursor()
                    cur.execute("select * from tb_usuarios Where IdEstado = 1 AND IdCargo = 1")
                    digitador = cur.fetchall()
                    return render_template('home.html',Proveedores = Proveedores, Punto = punto,Material = material,Verificador = verificador,Digitador = digitador )
           
    return render_template('index.html') 
            
        
@app.route('/home')
def home():
    #ESTAS CONSULTAS SON PARA TRAER LOS PROVEEDORES Y LOS DATOS DE LOS SELECT
    #CONSULTA PARA LOS PROVEEDORES
    cur = mysql.connection.cursor()
    cur.execute("select * from tb_proveedor Where IdEstado = 1")
    Proveedores = cur.fetchall()
    #CONSULTA PARA LOS PUNTOS DE COMPRA
    cur = mysql.connection.cursor()
    cur.execute("select * from tb_puntocompra Where IdEstado = 1")
    punto = cur.fetchall()
    #CONSULTA PARA LOS MATERIALES
    cur = mysql.connection.cursor()
    cur.execute("select * from tb_material Where Id_Estado = 1")
    material = cur.fetchall()
    #CONSULTA PARA LOS VERIFICADORES
    cur = mysql.connection.cursor()
    cur.execute("select * from tb_usuarios Where IdEstado = 1 AND IdCargo = 2")
    verificador = cur.fetchall()
    #CONSULTA PARA LOS DIGITADOR
    cur = mysql.connection.cursor()
    cur.execute("select * from tb_usuarios Where IdEstado = 1 AND IdCargo = 1")
    digitador = cur.fetchall()
    print(digitador)
   
    return render_template('home.html',Proveedores = Proveedores, Punto = punto,Material = material,Verificador = verificador,Digitador = digitador )
                    



if __name__ == '__main__':
    app.run(port=5000, debug=True)