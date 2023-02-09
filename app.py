

from datetime import datetime,date, timedelta
from flask import Flask, redirect,render_template, request, session, url_for
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
hi = datetime.now()
#cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor) para iniciar
# mysql.connection.commit() Para finalizar la conexion a la base de datos


#cursor.execute("") para ejecutar las instrucciones sql


@app.route('/')
def Index():
    session.clear()
   
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
            print(results)
            if results:
                #si trae algo
                # Recordar el usuario y rol que se logeo
                session["userId"] = results[0]
                session["user"] = results[1]
                session["userrole"] = results[3]
                print(session['userrole'])
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
                
                #CHEQUEAMOS LAS CONTRASEÑAS PARA VER SI SON IGUALES
                if not check_password_hash(results[2], Contraseña):
                    #contraseñas incorrectas
                    print("contras")
                    return render_template('login.html', errorlogin=2)
                return render_template('ajustes.html',Proveedores = Proveedores, Punto = punto,Material = material,Verificador = verificador,Digitador = digitador )
           
            else:
                #VIENE VACIO
                return render_template('login.html', errorlogin=1) 
                    
        return render_template('index.html') 
            
        
@app.route('/home')
def home():
    try:
        if session['userId']:
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
        else:
            return render_template('otros/error.html')
        
    except:
        return render_template('otros/error.html')
             
@app.route('/buscarProveedor', methods =["POST","GET"])
def buscarProveedor():
   if request.method == "POST":
        proveedor = request.form['proveedor']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_proveedor Where IdEstado = 1 and NombreProveedor like %s",[proveedor+'%'])
        proveedores = cur.fetchall()
        print(proveedores)
        if proveedores:

            return render_template('otros/proveedor-busqueda.html',proveedores = proveedores)
        else:
            return "no"
   else:
        return "No"

@app.route('/buscarProveedorAdmin', methods =["POST","GET"])
def buscarProveedorAdmin():
   if request.method == "POST":
        proveedor = request.form['proveedor']
        print(proveedor)
        cur = mysql.connection.cursor()
        cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,p.Cedula,e.NombreEstado FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado where p.NombreProveedor like %s",[proveedor+'%'])
        proveedores = cur.fetchall()
        if proveedores :

            return render_template('tablas/tabla-proveedornuevo.html',prov = proveedores)
        else:
            return "no"
   else:
        return "No"

#BUSCAR LOS USUARIOS PARA VER SI EXISTEN O NO EXISTEN
@app.route('/buscarUsuariosAdmin', methods =["POST","GET"])
def buscarUsuariosAdmin():
   if request.method == "POST":
        cedula = request.form['usuario']
        cur = mysql.connection.cursor()
        cur.execute("SELECT u.Id_Usuario,u.NombreUsuario as Nombre,c.Usuarios as Usuario,r.NombreRol,e.NombreEstado,u.Cedula,car.NombreCargo FROM tb_usuarios as u inner join tb_credenciales as c ON u.IdCredenciales = c.Id_Credenciales inner join tb_roles as r on c.IdRol = r.Id_Rol  inner join tb_estado as e on u.IdEstado = e.Id_Estado inner join tb_cargo as car on u.IdCargo = car.Id_Cargo where u.Cedula like %s",[cedula+'%'])
        proveedores = cur.fetchall()
        if proveedores :

            return render_template('tablas/tabla-usuario.html',prov = proveedores)
        else:
            return "no"
   else:
        return "No"

#ACTUALIZAMOS EL PROVEEDOR
@app.route('/llamarProveedorEspecifico', methods =["POST","GET"])
def llamarProveedorEspecifico():
   if request.method == "POST":
        id = request.form['id']
        print(id)
        cur = mysql.connection.cursor()
        cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,p.Cedula,e.NombreEstado FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado Where p.Id_Proveedor = %s",[id])
        proveedor = cur.fetchall()
        mysql.connection.commit()
        print(proveedor)
        
        return render_template('modal/proveedornuevo-modal.html',proveedor = proveedor)
   else:
        return "No"

#ACTUALIZAMOS EL PROVEEDOR
@app.route('/actProve', methods =["POST","GET"])
def actProve():
   if request.method == "POST":
        id = request.form['id']
        nombre = request.form['nombre']
        cedula = request.form['cedula']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE tb_proveedor set NombreProveedor = %s, Cedula = %s Where Id_Proveedor = %s",(nombre,cedula,id))
        proveedor = cur.fetchall()
        mysql.connection.commit()
        
        return "listo"
   else:
        return "No"
#ACTUALIZAR USUARIOS
@app.route('/actUsu', methods =["POST","GET"])
def actUsu():
   if request.method == "POST":
        id = request.form['id']
        nombre = request.form['nombre']
        loginUser = request.form['loginUser']
        cedula = request.form['cedula']
        rol = request.form['rol']
        cargo = request.form['cargo']
        contra = request.form['contra']
        flag = request.form['flag']
        if flag == "nocontra":
            cur = mysql.connection.cursor()
            cur.execute("UPDATE tb_usuarios set NombreUsuario = %s, Cedula = %s, IdCargo = %s Where Id_Usuario = %s",(nombre,cedula,cargo,id))
            proveedor = cur.fetchall()
            mysql.connection.commit()
            #MODIFICAMOS EL ROL
            cur = mysql.connection.cursor()
            cur.execute("UPDATE tb_credenciales set Usuarios = %s, IdRol = %s Where Id_Credenciales = %s",(loginUser,rol,id))
            proveedor = cur.fetchall()
            mysql.connection.commit()
        elif flag == "contra":
            contra = request.form['contra']
            cur = mysql.connection.cursor()
            cur.execute("UPDATE tb_usuarios set NombreUsuario = %s, Cedula = %s, IdCargo = %s Where Id_Usuario = %s",(nombre,cedula,cargo,id))
            proveedor = cur.fetchall()
            mysql.connection.commit()
            #MODIFICAMOS EL ROL
            haseho = generate_password_hash(contra)
            cur = mysql.connection.cursor()
            cur.execute("UPDATE tb_credenciales set Usuarios = %s,Contraseñas = %s, IdRol = %s Where Id_Credenciales = %s",(loginUser,haseho,rol,id))
            proveedor = cur.fetchall()
            mysql.connection.commit()

        return "listo"
   else:
        return "No"

#ADD USUARIOS
@app.route('/addUsu', methods =["POST","GET"])
def addUsu():
   if request.method == "POST":
        nombre = request.form['nombre']
        loginUser = request.form['loginUser']
        cedula = request.form['cedula']
        rol = request.form['rol']
        cargo = request.form['cargo']
        contra = request.form['contra']
        
        contra = request.form['contra']
        #CREAMOS PRIMERO LAS CREDENCIALES
        haseho = generate_password_hash(contra)
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tb_credenciales (Usuarios,Contraseñas,IdRol) VALUES (%s,%s,%s)",(loginUser,haseho,rol))
        cred = cur.fetchall()
        mysql.connection.commit()

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM tb_credenciales ORDER by Id_Credenciales DESC LIMIT 1")
        cred = cur.fetchone()
        mysql.connection.commit()
        print(cred)
        #AHORA CREAMOS EL USUARIO COMO TAL
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tb_usuarios (NombreUsuario,Cedula,IdCargo,IdCredenciales,IdEstado) VALUES (%s,%s,%s,%s,1)",(nombre,cedula,cargo,cred[0]))
        proveedor = cur.fetchall()
        mysql.connection.commit()
        print("listo")
        return "listo"
   else:
        return "No"

#ELIMINAMOS EL PROVEEDOR
@app.route('/eliminarProveedor', methods =["POST","GET"])
def eliminarProveedor():
   if request.method == "POST":
        id = request.form['id']
        cur = mysql.connection.cursor()
        cur.execute("Update tb_proveedor set IdEstado = 2 Where Id_Proveedor = %s",[id])
        
        mysql.connection.commit()
        
        return "done"
   else:
        return "No"

#ACTUALIZAMOS EL PROVEEDOR
@app.route('/eliminarUsuario', methods =["POST","GET"])
def eliminarUsuario():
   if request.method == "POST":
        id = request.form['id']
        if int(id) == int(session['userId']):
            return "no"
        else:
            cur = mysql.connection.cursor()
            cur.execute("Update tb_usuarios set IdEstado = 2 Where Id_Usuario = %s",[id])
            
            mysql.connection.commit()
        
            return "done"
   else:
        return "No"

#HABILITAMOS EL PROVEEDOR QUE SE ENCUENTRA INACTIVO
@app.route('/habilitarProveedor', methods =["POST","GET"])
def habilitarProveedor():
   if request.method == "POST":
        id = request.form['id']
        cur = mysql.connection.cursor()
        cur.execute("Update tb_proveedor set IdEstado = 1 Where Id_Proveedor = %s",[id])
        
        mysql.connection.commit()
        
        return "done"
   else:
        return "No"

#HABILITAMOS EL USUARIO QUE SE ENCUENTRA INACTIVO
@app.route('/habilitarUsuario', methods =["POST","GET"])
def habilitarUsuario():
   if request.method == "POST":
        id = request.form['id']
        cur = mysql.connection.cursor()
        cur.execute("Update tb_USuarios set IdEstado = 1 Where Id_Usuario = %s",[id])
        
        mysql.connection.commit()
        
        return "done"
   else:
        return "No"

@app.route('/buscarUsuario', methods =["POST","GET"])
def buscarUsuario():
   if request.method == "POST":
        usuario = request.form['proveedor']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_usuarios Where IdEstado = 1 AND NombreUsuario like %s",[usuario+'%'])
        proveedores = cur.fetchall()
        print(proveedores)
        return render_template('otros/proveedor-busqueda.html',proveedores = proveedores)
    
@app.route('/buscarUsuarioNuevo', methods =["POST","GET"])
def buscarUsuarioNuevo():
   if request.method == "POST":
        usuario = request.form['usuario']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_usuarios Where IdEstado = 1 AND NombreUsuario like %s",[usuario+'%'])
        usuario = cur.fetchall()
        if usuario:
            return "existe"
        else:
            return "no existe"
        return render_template('otros/proveedor-busqueda.html',proveedores = proveedores)

#DETALLES DE USUARIO Y ESTE MODAL ES PARA AÑADIR USUARIOS NUEVOS DEPENDIENDO DE LA FLAG
@app.route('/detalleUsuarios', methods =["POST","GET"])
def detalleUsuarios():
   if request.method == "POST":
        
        flagUSuario = request.form['flagUsuario']
        cedula = request.form['nombre']
        if flagUSuario == "editar":
            id = request.form['id']
            cur = mysql.connection.cursor()
            cur.execute("SELECT u.Id_Usuario,u.NombreUsuario as Nombre,c.Usuarios as Usuario,r.NombreRol,e.NombreEstado,u.Cedula,car.NombreCargo FROM tb_usuarios as u inner join tb_credenciales as c ON u.IdCredenciales = c.Id_Credenciales inner join tb_roles as r on c.IdRol = r.Id_Rol inner join tb_estado as e on u.IdEstado = e.Id_Estado inner join tb_cargo as car on u.IdCargo = car.Id_Cargo where u.Id_Usuario = %s",[id])
            usuario = cur.fetchall()
            
            
        #TRAEMOS LOS CARGOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_cargo")
        cargos = cur.fetchall()
        #TRAEMOS LOS ROLES
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_roles")
        roles = cur.fetchall()
        return render_template('modal/usuarionuevo-modal.html',flagUSuario = flagUSuario, info = usuario,cargos = cargos, roles = roles)

#LISTA DE PROVEEDORES TABLA
@app.route('/listaProveedores', methods =["POST","GET"])
def listaProveedores():
   if request.method == "POST":
        proveedor = request.form['proveedor']
        if proveedor == "":
            
            #LLamar la verificacion de ese proveedor
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra Where v.IdEstado = 3 AND v.IdUsuarioCreacion = %s",[session["userId"]])
            verificaciones = cur.fetchall()
            return render_template('tablas/tabla-proveedores.html',verificaciones = verificaciones)
        else:
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("select * from tb_proveedor Where NombreProveedor = %s",[proveedor])
            proveedornuevo = cur.fetchone()
            #INSERTAMOS LA VERIFICACION
            fecha = hi.replace(microsecond=0)
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO tb_verificacion (Fecha,IdProveedor,IdPuntoCompra,IdEstado,IdUsuarioCreacion) VALUES (%s,%s,%s,%s,%s)",(fecha,proveedornuevo[0],5,3,session["userId"]))
            proveedornuevo = cur.fetchone()
            #LLAMAMOS LAS VERIFICACIONES DEL USUARIO
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra Where v.IdEstado = 3 AND v.IdUsuarioCreacion = %s",[session["userId"]])
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            
            print(verificaciones)
            return render_template('tablas/tabla-proveedores.html',verificaciones = verificaciones)
   else:
        return "No"
#DETALLE VERIFICACION
@app.route('/detalleVerificacion', methods =["POST","GET"])
def detalleVerificacion():
   if request.method == "POST":
        print("aqui no")
        id = request.form['id']
        print(id)
        cur = mysql.connection.cursor()
        cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
        nueva = cur.fetchall()
        mysql.connection.commit()
        print("nueva")
        print(nueva)
        if nueva:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
            verificacion = cur.fetchall()
            mysql.connection.commit()
        else:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
            verificacion = cur.fetchall()
            mysql.connection.commit()
            
        #ESTAS CONSULTAS SON PARA TRAER LOS PROVEEDORES Y LOS DATOS DE LOS SELECT
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
        
        # necesito mandar a llamar los dastos del usuario que esta logueado para ponerlo como verificador
        cur = mysql.connection.cursor()
        cur.execute("select cred.Id_Credenciales,u.NombreUsuario from tb_usuarios as u inner join tb_credenciales as cred on u.IdCredenciales = cred.Id_Credenciales Where cred.Id_Credenciales = %s",[session['userId']])
        usuariolog = cur.fetchone()  
        # necesito mandar a llamar los dastos del usuario para saber en que punto de venta esta
        cur = mysql.connection.cursor()
        cur.execute("select pc.Id_PuntoCompra,pc.NombrePuntoCompra from tb_usuarios as u inner join tb_puntocompra as pc on u.IdPuesto = pc.Id_PuntoCompra inner join tb_credenciales as cred on u.IdCredenciales = cred.Id_Credenciales where cred.Id_Credenciales = %s",[session['userId']])
        usuariopunto = cur.fetchone()  
        return render_template('modal/verificaciones-modal.html',usuariopunto = usuariopunto,usuariolog = usuariolog,verificacion = verificacion,Punto = punto,Material = material,Verificador = verificador,Digitador = digitador)

#DETALLE VERIFICACION
@app.route('/detalleVerificacionAdmin', methods =["POST","GET"])
def detalleVerificacionAdmin():
   if request.method == "POST":
        id = request.form['id']
        cur = mysql.connection.cursor()
        
        cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.Id_Verificacion = %s",[id])
        nueva = cur.fetchall()
        mysql.connection.commit()
        if nueva:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.Id_Verificacion = %s",[id])
            verificacion = cur.fetchall()
            mysql.connection.commit()
        else:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra Where v.Id_Verificacion = %s",[id])
            verificacion = cur.fetchall()
            mysql.connection.commit()
        #ESTAS CONSULTAS SON PARA TRAER LOS PROVEEDORES Y LOS DATOS DE LOS SELECT
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
        print(verificacion)
        return render_template('modal/admin-modal.html',verificacion = verificacion,Punto = punto,Material = material,Verificador = verificador,Digitador = digitador)

#GUARDAR DATOS GENERALES DE LAS VERIFICACIONES CREADAS
@app.route('/datosGeneralesVerificacion', methods =["POST","GET"])
def datosGeneralesVerificacion():
   if request.method == "POST":
        id = request.form['id']
        puntoCompra = request.form['puntoCompra']
        verificador = request.form['verificador']
        digitador = request.form['digitador']
        po = request.form['po']
        nboleta = request.form['nboleta']
        bahia = request.form['bahia']
        cur = mysql.connection.cursor()
        cur.execute('Update tb_verificacion set PO = %s,NoBoleta = %s,IdVerificador = %s,IdDigitador = %s,IdPuntoCompra = %s,Bahia = %s where Id_Verificacion = %s', (po,nboleta,verificador,digitador,puntoCompra,bahia,id))
        digitador = cur.fetchall()
        mysql.connection.commit()
        return "done" 

#CARGAR LOS PESOS DE LAS VERIFICACIONES
@app.route('/listaPesos', methods =["POST","GET"])
def listaPesos():
    if request.method == "POST":
        id = request.form['id']
        if id != "":
            #LLamar la verificacion de ese proveedor
            cur = mysql.connection.cursor()
            cur.execute("SELECT dt.Id_DetalleVerificacion,dt.IdVerificacion,m.NombreMaterial,dt.PesoBruto,dt.PesoTara,dt.Destare,dt.PesoNeto FROM tb_detalleverificacion as dt inner join tb_material as m ON dt.IdMaterial = m.Id_Material Where dt.IdVerificacion = %s",[id])
            pesos = cur.fetchall()
            print(pesos)
            #HACEMOS LOA SUMA DE CADA COLUMNA
            #  SUMA DE LA COLUMNA PESOS BRUTOS
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoBruto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaBruto1 = cur.fetchone()
            if sumaBruto1[0]:
                sumaBruto = round(sumaBruto1[0],2)
            else:
                sumaBruto = 0.00

            print(sumaBruto)
            #  SUMA DE LA COLUMNA PESOS TARA
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaTara1 = cur.fetchone()
            if sumaTara1[0]:
                sumaTara = round(sumaTara1[0],2)
            else:
                sumaTara = 0.00
            
            #  SUMA DE LA COLUMNA PESOS DESTARE
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaDestare1 = cur.fetchone()
            mysql.connection.commit()
            if sumaDestare1[0]:
                sumaDestare = round(sumaDestare1[0],2)
            else:
                sumaDestare = 0.00
            
            #  SUMA DE LA COLUMNA PESOS NETO
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaNeto1 = cur.fetchone()
            mysql.connection.commit()
            if sumaNeto1[0]:
                sumaNeto = round(sumaNeto1[0],2)
            else:
                sumaNeto = 0.00
            print(pesos)
            return render_template('tablas/tabla-pesos.html',pesos = pesos,sumaBruto = sumaBruto, sumaTara = sumaTara,sumaDestare = sumaDestare,sumaNeto = sumaNeto)
        else:
            pesos =""
            return render_template('tablas/tabla-pesos.html',pesos = pesos)
    else:
        return "No"

#CARGAR LOS PESOS GENERALES DE LAS VERIFICACIONES
@app.route('/generalPesos', methods =["POST","GET"])
def generalPesos():
    if request.method == "POST":
        id = request.form['id']
        if id != "":
            #total de materiales
            cur = mysql.connection.cursor()
            cur.execute('SELECT m.NombreMaterial,sum(ver.PesoBruto) as bruto,sum(ver.PesoTara) as tara,SUM(ver.PesoNeto) as neto FROM tb_detalleverificacion as ver inner join tb_material as m ON ver.IdMaterial = m.Id_Material WHERE ver.IdVerificacion = %s Group BY ver.IdMaterial',[id])
            mat = cur.fetchall()
            mysql.connection.commit()
            return render_template('tablas/tabla-mat-general.html',mat = mat)
        else:
            pesos =""
            return render_template('tablas/tabla-mat-general.html',mat = mat)
    else:
        return "No"

#BUSCAMOS MATERIALES
@app.route('/buscarMaterial', methods =["POST","GET"])
def buscarMaterial():
   if request.method == "POST":
        material = request.form['material']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_material Where Id_Estado = 1 AND NombreMaterial like %s",['%'+material+'%'])
        materiales = cur.fetchall()
        print(materiales)
        return render_template('otros/material-busqueda.html',materiales = materiales)
   else:
        return "No"

#INSERTAMOS LOS PESOS DEL MATERIALE SELECCIONADO
@app.route('/insertarPesos', methods =["POST","GET"])
def insertarPesos():
   if request.method == "POST":
        id = request.form['id']
        material = request.form['material']
        destare = request.form['destare']
        pBruto = request.form['pBruto']
        pTara = request.form['pTara']
        
        
        #MANDAMOS A LLAMAR EL ID DEL MATERIAL QUE SELECCIONO EL USUARIO
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_material Where Id_Estado = 1 AND NombreMaterial like %s",[material+'%'])
        materiales = cur.fetchone()

        
        #CREAMOS EL DETALLE VERIFICACION AÑADIENDO LOS PESOS QUE EL USUARIO INGRESO 
        pNeto = round(float(float(pBruto)-float(pTara)-float(destare)),2)
        
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tb_detalleverificacion (IdVerificacion,IdMaterial,PesoBruto,PesoTara,PesoNeto,Destare) VALUES (%s,%s,%s,%s,%s,%s)",(id,materiales[0],pBruto,pTara,pNeto,destare))
        mysql.connection.commit()
        #MANDAMOS A LLAMAR TODA LA TABLA DE DETALLE VERIFICACION CON LOS NUEVOS DATOS REGISTRADOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT dt.Id_DetalleVerificacion,dt.IdVerificacion,m.NombreMaterial,dt.PesoBruto,dt.PesoTara,dt.Destare,dt.PesoNeto FROM tb_detalleverificacion as dt inner join tb_material as m ON dt.IdMaterial = m.Id_Material Where dt.IdVerificacion = %s",[id])
        pesos = cur.fetchall()
        mysql.connection.commit() 
        #HACEMOS LOA SUMA DE CADA COLUMNA
        #  SUMA DE LA COLUMNA PESOS BRUTOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(PesoBruto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaBruto1 = cur.fetchone()
        mysql.connection.commit()
        sumaBruto = round(sumaBruto1[0],2)
        #  SUMA DE LA COLUMNA PESOS TARA
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaTara1 = cur.fetchone()
        sumaTara = round(sumaTara1[0],2)
        #  SUMA DE LA COLUMNA PESOS DESTARE
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaDestare1 = cur.fetchone()
        mysql.connection.commit()
        sumaDestare = round(sumaDestare1[0],2)
        #  SUMA DE LA COLUMNA PESOS NETO
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaNeto1 = cur.fetchone()
        mysql.connection.commit()
        sumaNeto = round(sumaNeto1[0],2)
        print(sumaNeto)
        return render_template('tablas/tabla-pesos.html',pesos = pesos,sumaBruto = sumaBruto, sumaTara = sumaTara,sumaDestare = sumaDestare,sumaNeto = sumaNeto)
   else:
        return "No"

#FINALIZAR VERIFICACION
@app.route('/finalizarVerificacion', methods =["POST","GET"])
def finalizarVerificacion():
   if request.method == "POST":
        id = request.form['id']

        #MANDAMOS A LLAMAR TODA LA TABLA DE DETALLE VERIFICACION CON LOS NUEVOS DATOS REGISTRADOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT dt.Id_DetalleVerificacion,dt.IdVerificacion,m.NombreMaterial,dt.PesoBruto,dt.PesoTara,dt.Destare,dt.PesoNeto FROM tb_detalleverificacion as dt inner join tb_material as m ON dt.IdMaterial = m.Id_Material Where dt.IdVerificacion = %s",[id])
        pesos = cur.fetchall()
        mysql.connection.commit() 
        print("pesos")
        if pesos:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
            Verificacion = cur.fetchall()
            mysql.connection.commit()
            #HACEMOS LOA SUMA DE CADA COLUMNA
            #  SUMA DE LA COLUMNA PESOS BRUTOS
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoBruto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaBruto1 = cur.fetchone()
            sumaBruto = round(sumaBruto1[0],2)
            #  SUMA DE LA COLUMNA PESOS TARA
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaTara1 = cur.fetchone()
            sumaTara = round(sumaTara1[0],2)
            #  SUMA DE LA COLUMNA PESOS DESTARE
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaDestare1 = cur.fetchone()
            mysql.connection.commit()
            sumaDestare = round(sumaDestare1[0],2)
            #  SUMA DE LA COLUMNA PESOS NETO
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaNeto1 = cur.fetchone()
            mysql.connection.commit()
            sumaNeto = round(sumaNeto1[0],2)
            #  FECHA VERIFICACION
            cur = mysql.connection.cursor()
            cur.execute("SELECT Fecha FROM tb_verificacion WHERE Id_Verificacion = %s",[id])
            fecha = cur.fetchone()
            mysql.connection.commit()
            fechacreacion = datetime.date(hi)
            #Usuario que lo creó
            cur = mysql.connection.cursor()
            cur.execute("SELECT u.NombreUsuario FROM `tb_verificacion` as v inner join tb_usuarios as u ON v.IdUsuarioCreacion = u.Id_Usuario WHERE Id_Verificacion = %s",[id])
            usuario = cur.fetchone()
            mysql.connection.commit()
            #Cambiar el estado de la verificacion
            cur = mysql.connection.cursor()
            cur.execute('Update tb_verificacion set IdEstado = 4 Where Id_Verificacion = %s',[id])
            mysql.connection.commit()
            #total de materiales
            cur = mysql.connection.cursor()
            cur.execute('SELECT m.NombreMaterial,round(sum(ver.PesoBruto),2) as bruto,round(sum(ver.PesoTara),2) as tara,round(SUM(ver.PesoNeto),2) as neto FROM tb_detalleverificacion as ver inner join tb_material as m ON ver.IdMaterial = m.Id_Material WHERE ver.IdVerificacion = %s Group BY ver.IdMaterial',[id])
            mat = cur.fetchall()
            mysql.connection.commit()
            print(pesos)
            print("factura aquiii")
            print(len(pesos))
            return render_template('otros/factura.html',mat = mat,id = id,usuario = usuario,verificacion = Verificacion, fechaEmision = fecha,fechaCreacion = fechacreacion,pesos = pesos,sumaBruto = sumaBruto,sumaTara = sumaTara,sumaDestare = sumaDestare,sumaNeto = sumaNeto)
        else:
            print("vacio")
            return "vacio"
        
   else:
        return "No"

#MODULO DE ADMINISTRACION 
@app.route('/administracion')
def administracion():
    try:
        if session['userrole'] == 1:
            return render_template('administracion.html')
        else:
            return render_template('otros/error.html')
    except:
        return render_template('otros/error.html')
       

#VALOR DE LA TABLA DE ADMINISTRACION 
@app.route('/valorTablaAdmin', methods =["POST","GET"])
def valorTablaAdmin():
    if request.method == "POST":
        opc = request.form['valor']
        print(opc)
        if opc == "Usuarios":
            usuario = request.form['proveedor']
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("select * from tb_usuarios Where NombreUsuario = %s",[usuario])
            proveedornuevo = cur.fetchone()
            #LLAMAMOS LAS VERIFICACIONES DEL USUARIO
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,e.NombreEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_estado as e on v.IdEstado = e.Id_Estado Where v.IdUsuarioCreacion = %s",[proveedornuevo[0]])
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            print(verificaciones)
            return render_template('tablas/tabla-filtracion.html',opc = opc,verificaciones = verificaciones)
            return "usu"
        elif opc == "Proveedores":
            proveedor = request.form['proveedor']
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("select * from tb_proveedor Where NombreProveedor = %s",[proveedor])
            proveedornuevo = cur.fetchone()
            #LLAMAMOS LAS VERIFICACIONES DEL USUARIO
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,e.NombreEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_estado as e on v.IdEstado = e.Id_Estado Where v.IdProveedor = %s",[proveedornuevo[0]])
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            return render_template('tablas/tabla-filtracion.html',opc = opc,verificaciones = verificaciones)
        elif opc == "verificaciones (Pendientes)":
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,e.NombreEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_estado as e on v.IdEstado = e.Id_Estado Where v.IdEstado = 3 ")
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            print(verificaciones)
            return render_template('tablas/tabla-filtracion.html',opc = opc,verificaciones = verificaciones)
        elif opc == "verificaciones (Terminadas)":
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,e.NombreEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_estado as e on v.IdEstado = e.Id_Estado Where v.IdEstado = 4 ")
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            print(verificaciones)
            return render_template('tablas/tabla-filtracion.html',opc = opc,verificaciones = verificaciones)
        elif opc == "po":
            po = request.form['po']
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,e.NombreEstado, p.NombreProveedor from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_estado as e on v.IdEstado = e.Id_Estado where v.PO like %s",[po+'%'])
            verificaciones = cur.fetchall()
            mysql.connection.commit()
            print(verificaciones)
            return render_template('tablas/tabla-filtracion.html',opc = opc,verificaciones = verificaciones)
        return render_template('tablas/tabla-filtracion.html',opc = opc)

# APARTADO DE AJUSTES 

@app.route('/ajustes')
def ajustes():
    try:
        if session['userId']:
            return render_template('ajustes.html')
        else:
            return render_template('otros/error.html')
        
    except:
        return render_template('otros/error.html')
    
    


# APARTADO DE VER PROVEEDORES
@app.route('/verProveedores', methods =["POST","GET"])
def verProveedores():
    if request.method == "POST":

        #SELECCIONAR EL ID DEL PROVEEDOR
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_proveedor Where IdEstado = 3")
        proveedores = cur.fetchall()

        return render_template('modal/proveedores-modal.html')
# APARTADO DE VER USUARIOS
@app.route('/verUsuarios', methods =["POST","GET"])
def verUsuarios():
    try:
        if session['userrole'] == 1:
            if request.method == "POST":
                #SELECCIONAR EL ID DEL PROVEEDOR
                cur = mysql.connection.cursor()
                cur.execute("select * from tb_usuarios Where IdEstado = 3")
                proveedores = cur.fetchall()

            return render_template('modal/usuarios-modal.html')
        else:
            return render_template('otros/error.html')
    except:
        return render_template('otros/error.html')
    
    


#TRAER TODOS LOS PROVEEDORES
@app.route('/traerProveedores', methods =["POST","GET"])
def traerProveedores():
    if request.method == "POST":
        proveedor = request.form['proveedor']
        if proveedor == "":
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,e.NombreEstado,p.Cedula FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado")
            proveedores = cur.fetchall()
        else:
            cur = mysql.connection.cursor()
            cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,e.NombreEstado,p.Cedula FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado where p.NombreProveedor like %s",[proveedor+'%'])
            proveedores = cur.fetchall()

        
        print(proveedores)
        return render_template('tablas/tabla-proveedornuevo.html',prov = proveedores)

#TRAER TODOS LOS PROVEEDORES
@app.route('/traerUsuarios', methods =["POST","GET"])
def traerUsuarios():
    if request.method == "POST":
        cedula = request.form['usuario']
        if cedula == "":
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("SELECT u.Id_Usuario,u.NombreUsuario as Nombre,c.Usuarios as Usuario,r.NombreRol,e.NombreEstado,u.Cedula,car.NombreCargo FROM tb_usuarios as u inner join tb_credenciales as c ON u.IdCredenciales = c.Id_Credenciales inner join tb_roles as r on c.IdRol = r.Id_Rol  inner join tb_estado as e on u.IdEstado = e.Id_Estado inner join tb_cargo as car on u.IdCargo = car.Id_Cargo")
            proveedores = cur.fetchall()
        else:
            cur = mysql.connection.cursor()
            cur.execute("SELECT u.Id_Usuario,u.NombreUsuario as Nombre,c.Usuarios as Usuario,r.NombreRol,e.NombreEstado,u.Cedula,car.NombreCargo FROM tb_usuarios as u inner join tb_credenciales as c ON u.IdCredenciales = c.Id_Credenciales inner join tb_roles as r on c.IdRol = r.Id_Rol  inner join tb_estado as e on u.IdEstado = e.Id_Estado inner join tb_cargo as car on u.IdCargo = car.Id_Cargo where u.Cedula like %s",[cedula+'%'])
            proveedores = cur.fetchall()

        return render_template('tablas/tabla-usuario.html',prov = proveedores)

#INSERTAMOS LOS PESOS DEL MATERIALE SELECCIONADO
@app.route('/insertarProveedor', methods =["POST","GET"])
def insertarProveedor():
    if request.method == "POST":
        cedula = request.form['cedula']
        proveedor = request.form['proveedor']
        #INSERTAMOS EL NUEVO PROVEEDOR EN LA BASE
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tb_proveedor (NombreProveedor,Cedula,IdEstado) VALUES (%s,%s,1)",(proveedor.upper(),cedula))
        mysql.connection.commit()
        return "done"
    else:
        return "No"

#INSERTAMOS EL USUARIO
@app.route('/insertarUsuario', methods =["POST","GET"])
def insertarUsuario():
    if request.method == "POST":
        flagUSuario = "nuevo"
        cedula = request.form['cedula']
        if flagUSuario == "editar":
            id = request.form['id']
            cur = mysql.connection.cursor()
            cur.execute("SELECT u.Id_Usuario,u.NombreUsuario as Nombre,c.Usuarios as Usuario,r.NombreRol,e.NombreEstado,u.Cedula,car.NombreCargo FROM tb_usuarios as u inner join tb_credenciales as c ON u.IdCredenciales = c.Id_Credenciales inner join tb_roles as r on u.Id_Usuario = r.Id_Rol inner join tb_estado as e on u.IdEstado = e.Id_Estado inner join tb_cargo as car on u.IdCargo = car.Id_Cargo where Id_Usuario = %s",[id])
            usuario = cur.fetchall()
            
        #TRAEMOS LOS CARGOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_cargo")
        cargos = cur.fetchall()
        #TRAEMOS LOS ROLES
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_roles")
        roles = cur.fetchall()
        return render_template('modal/usuarionuevo-modal.html',flagUSuario = flagUSuario, info = cedula,cargos = cargos, roles = roles)

#INSERTAMOS EL USUARIO NUEVO
@app.route('/insertarUsuarioNuevo', methods =["POST","GET"])
def insertarUsuarioNuevo():
    if request.method == "POST":
        flagUSuario = "nuevo"
        cedula = request.form['cedula']
         
        #TRAEMOS LOS CARGOS
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_cargo")
        cargos = cur.fetchall()
        #TRAEMOS LOS ROLES
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_roles")
        roles = cur.fetchall()
        print(cedula)
        return render_template('modal/usuarionuevo-modal.html',flagUSuario = flagUSuario, info = cedula,cargos = cargos, roles = roles)

#DETALLE DE TARAS PARA AÑADIR LOS OTROS VALORES DE LA TARA
@app.route('/añadirTarasExtras', methods =["POST","GET"])
def añadirTarasExtras():
    if request.method == "POST":
        id = request.form['id']
        valor = request.form['valor']
        tipo = request.form['tipo']
        print("iddd")
        print(id)
        #INSERTAMOS el valor de la tara al detalle
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tb_detalletara (IdDetalleVerificacion,Contenedor,ValorTaraExtra) VALUES (%s,%s,%s)",(id,tipo,valor))
        mysql.connection.commit()
        #TRAEMOS LOS valores de la tara a la tabla
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_detalletara where IdDetalleVerificacion = %s",[id])
        taras = cur.fetchall()
       
        #total del peso de las taras que existen en el pesaje
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoTara as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[id])
        pesotaraviejo = cur.fetchone()
        mysql.connection.commit()
        print(pesotaraviejo)
        taranueva = round(float(pesotaraviejo[0]) + float(valor),2)
        print(taranueva)
        cur.execute("UPDATE tb_detalleverificacion set PesoTara = %s Where Id_DetalleVerificacion = %s",(taranueva,id))
        proveedor = cur.fetchall()
        mysql.connection.commit()

        #TRAEMOS LA TARA
        #PARA HACER LAS OPERACIONES
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoBruto,PesoTara,Destare as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[id])
        datos = cur.fetchone()
        mysql.connection.commit()
        
        #AL MODIFICAR EL PESO BRUTO TAMBIEN SE MODIFICA EL PESO NETO
        
        pNeto = round(float(float(datos[0])-float(datos[1])-float(datos[2])),2)
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE tb_detalleverificacion set PesoNeto = %s Where Id_DetalleVerificacion = %s",(pNeto,id))
        mysql.connection.commit()
        print("pessooooo netooo")
        print(datos[0])
        print(pNeto)
        return render_template('tablas/tabla-taras.html',taras = taras,total = taranueva)

#VER TARA ESPECIFICA
@app.route('/verTaras', methods =["POST","GET"])
def verTaras():
    if request.method == "POST":
        id = request.form['id']
        #TRAEMOS LOS valores de la tara a la tabla
        cur = mysql.connection.cursor()
        cur.execute("SELECT * From tb_detalletara where IdDetalleVerificacion = %s",[id])
        taras = cur.fetchall()
       
        #total del peso de las taras que existen en el pesaje
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoTara as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[id])
        pesotaraviejo = cur.fetchone()
        mysql.connection.commit()
        
        return render_template('tablas/tabla-taras.html',taras = taras,total = pesotaraviejo)

#MODIFICAR EL PESO BRUTO
@app.route('/modificarPesoBruto', methods =["POST","GET"])
def modificarPesoBruto():
    if request.method == "POST":
        id = request.form['id']
        valor = request.form['valor']
        #MODIFICAMOS EL VALOR DEL PESO BRUTO
        cur = mysql.connection.cursor()
        cur.execute("UPDATE tb_detalleverificacion set PesoBruto = %s Where Id_DetalleVerificacion = %s",(valor,id))
        proveedor = cur.fetchall()
        mysql.connection.commit()

        #TRAEMOS LA TARA
        #PARA HACER LAS OPERACIONES
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoTara,Destare as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[id])
        datos = cur.fetchone()
        mysql.connection.commit()
        mysql.connection.commit()
        #AL MODIFICAR EL PESO BRUTO TAMBIEN SE MODIFICA EL PESO NETO
        
        pNeto = round(float(float(valor)-float(datos[0])-float(datos[1])),2)
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE tb_detalleverificacion set PesoNeto = %s Where Id_DetalleVerificacion = %s",(pNeto,id))
        proveedor = cur.fetchall()
        mysql.connection.commit()
        
        return "done"

#MODIFICAR EL PESO BRUTO
@app.route('/elimLinea', methods =["POST","GET"])
def elimLinea():
    if request.method == "POST":
        id = request.form['id']
        #MODIFICAMOS EL VALOR DEL PESO BRUTO
        cur = mysql.connection.cursor()
        cur.execute("DELETE from tb_detalleverificacion Where Id_DetalleVerificacion = %s",[id])
        mysql.connection.commit()
        
        return "done"
#ELIMINAR EL VALOR TARA DETALLE
@app.route('/elimLIneaTara', methods =["POST","GET"])
def elimLIneaTara():
    if request.method == "POST":
        id = request.form['id']

        #SELECCIONAMOS EL VALOR QUE VAMOS A BORRAR PARA RESTARSELO AL TOTAL
        cur = mysql.connection.cursor()
        cur.execute("SELECT IdDetalleVErificacion,ValorTaraExtra from tb_detalletara Where Id_DetalleTara = %s",[id])
        valorTara = cur.fetchone()
        mysql.connection.commit()

        #total del peso de las taras que existen en el pesaje
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoTara as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[valorTara[0]])
        pesotaraviejo = cur.fetchone()
        mysql.connection.commit()

        taranueva = round(float(pesotaraviejo[0]) - float(valorTara[1]),2)
        cur.execute("UPDATE tb_detalleverificacion set PesoTara = %s Where Id_DetalleVerificacion = %s",(taranueva,valorTara[0]))
        proveedor = cur.fetchall()
        mysql.connection.commit()

         #TRAEMOS LA TARA
        #PARA HACER LAS OPERACIONES
        cur = mysql.connection.cursor()
        cur.execute('SELECT PesoBruto,PesoTara,Destare as tara from tb_detalleverificacion WHERE Id_DetalleVerificacion = %s',[valorTara[0]])
        datos = cur.fetchone()
        mysql.connection.commit()
        
        #AL MODIFICAR EL PESO BRUTO TAMBIEN SE MODIFICA EL PESO NETO

        pNeto = round(float(float(datos[0])-float(datos[1])-float(datos[2])),2)
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE tb_detalleverificacion set PesoNeto = %s Where Id_DetalleVerificacion = %s",(pNeto,valorTara[0]))
        mysql.connection.commit()


        print("aaaaaaaaaaaaaaa")
        print(datos)
        print(pesotaraviejo)
        print(valorTara[1])
        print(taranueva)

        #MODIFICAMOS EL VALOR DEL PESO BRUTO
        cur = mysql.connection.cursor()
        cur.execute("DELETE from tb_detalletara Where Id_DetalleTara = %s",[id])
        mysql.connection.commit()
        
        return "done"




#DESLOGUEO
@app.route('/deslog')
def deslog():
    session.clear()
    return redirect(url_for('Index'))
 
if __name__ == '__main__':
    app.run(host = '0.0.0.0',port = 3134, debug=True)