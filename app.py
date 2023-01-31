

from datetime import datetime,date, timedelta
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
hi = datetime.now()
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
                    session["userId"] = results[0]
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
                    return render_template('ajustes.html',Proveedores = Proveedores, Punto = punto,Material = material,Verificador = verificador,Digitador = digitador )
           
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
                   
@app.route('/buscarProveedor', methods =["POST","GET"])
def buscarProveedor():
   if request.method == "POST":
        proveedor = request.form['proveedor']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_proveedor Where IdEstado = 1 AND NombreProveedor like %s",[proveedor+'%'])
        proveedores = cur.fetchall()
        return render_template('otros/proveedor-busqueda.html',proveedores = proveedores)
   else:
        return "No"

@app.route('/buscarProveedorAdmin', methods =["POST","GET"])
def buscarProveedorAdmin():
   if request.method == "POST":
        proveedor = request.form['proveedor']
        print(proveedor)
        cur = mysql.connection.cursor()
        cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,e.NombreEstado FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado where p.NombreProveedor like %s",[proveedor+'%'])
        proveedores = cur.fetchall()
        if proveedores :

            return render_template('tablas/tabla-proveedornuevo.html',prov = proveedores)
        else:
            return "no"
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
            fecha = datetime.date(hi)
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
        id = request.form['id']
        cur = mysql.connection.cursor()
        cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
        nueva = cur.fetchall()
        mysql.connection.commit()
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
        print(verificacion)
        return render_template('modal/verificaciones-modal.html',verificacion = verificacion,Punto = punto,Material = material,Verificador = verificador,Digitador = digitador)

#DETALLE VERIFICACION
@app.route('/detalleVerificacionAdmin', methods =["POST","GET"])
def detalleVerificacionAdmin():
   if request.method == "POST":
        id = request.form['id']
        cur = mysql.connection.cursor()
        print(id)
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
            #HACEMOS LOA SUMA DE CADA COLUMNA
            #  SUMA DE LA COLUMNA PESOS BRUTOS
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoBruto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaBruto = cur.fetchone()
            mysql.connection.commit()
            #  SUMA DE LA COLUMNA PESOS TARA
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaTara = cur.fetchone()
            #  SUMA DE LA COLUMNA PESOS DESTARE
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaDestare = cur.fetchone()
            mysql.connection.commit()
            #  SUMA DE LA COLUMNA PESOS NETO
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaNeto = cur.fetchone()
            mysql.connection.commit()
            print(pesos)
            return render_template('tablas/tabla-pesos.html',pesos = pesos,sumaBruto = sumaBruto, sumaTara = sumaTara,sumaDestare = sumaDestare,sumaNeto = sumaNeto)
        else:
            pesos =""
            return render_template('tablas/tabla-pesos.html',pesos = pesos)
    else:
        return "No"

#BUSCAMOS MATERIALES
@app.route('/buscarMaterial', methods =["POST","GET"])
def buscarMaterial():
   if request.method == "POST":
        material = request.form['material']
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_material Where Id_Estado = 1 AND NombreMaterial like %s",[material+'%'])
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
        pNeto = float(float(pBruto)-float(pTara)-float(destare))
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
        sumaBruto = cur.fetchone()
        mysql.connection.commit()
        #  SUMA DE LA COLUMNA PESOS TARA
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaTara = cur.fetchone()
        #  SUMA DE LA COLUMNA PESOS DESTARE
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaDestare = cur.fetchone()
        mysql.connection.commit()
        #  SUMA DE LA COLUMNA PESOS NETO
        cur = mysql.connection.cursor()
        cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
        sumaNeto = cur.fetchone()
        mysql.connection.commit()

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
        
        if pesos:
            cur = mysql.connection.cursor()
            cur.execute("select v.Id_Verificacion,v.Fecha,v.PO,v.NoBoleta,pc.NombrePuntoCompra,v.IdEstado, p.NombreProveedor,digi.NombreUsuario as digitador,veri.NombreUsuario as verificador,v.Bahia from tb_verificacion as v inner join tb_proveedor as p ON v.IdProveedor = p.Id_Proveedor inner join tb_puntocompra as pc ON v.IdPuntoCompra = pc.Id_PuntoCompra inner join tb_usuarios as digi on v.IdDigitador = digi.Id_Usuario inner join tb_usuarios as veri on v.IdVerificador = veri.Id_Usuario Where v.IdEstado = 3 AND v.Id_Verificacion = %s",[id])
            Verificacion = cur.fetchall()
            mysql.connection.commit()
            #HACEMOS LOA SUMA DE CADA COLUMNA
            #  SUMA DE LA COLUMNA PESOS BRUTOS
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoBruto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaBruto = cur.fetchone()
            mysql.connection.commit()
            #  SUMA DE LA COLUMNA PESOS TARA
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoTara) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaTara = cur.fetchone()
            #  SUMA DE LA COLUMNA PESOS DESTARE
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(Destare) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaDestare = cur.fetchone()
            mysql.connection.commit()
            #  SUMA DE LA COLUMNA PESOS NETO
            cur = mysql.connection.cursor()
            cur.execute("SELECT SUM(PesoNeto) FROM tb_detalleverificacion WHERE IdVerificacion = %s",[id])
            sumaNeto = cur.fetchone()
            mysql.connection.commit()
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
            return render_template('otros/factura.html',usuario = usuario,verificacion = Verificacion, fechaEmision = fecha,fechaCreacion = fechacreacion,pesos = pesos,sumaBruto = sumaBruto,sumaTara = sumaTara,sumaDestare = sumaDestare,sumaNeto = sumaNeto)
        else:
            return "vacio"
        
   else:
        return "No"

#MODULO DE ADMINISTRACION 
@app.route('/administracion')
def administracion():

    return render_template('administracion.html')

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
        return render_template('tablas/tabla-filtracion.html',opc = opc)

# APARTADO DE AJUSTES 

@app.route('/ajustes')
def ajustes():
   
    return render_template('ajustes.html')

# APARTADO DE VER PROVEEDORES
@app.route('/verProveedores', methods =["POST","GET"])
def verProveedores():
    if request.method == "POST":

        #SELECCIONAR EL ID DEL PROVEEDOR
        cur = mysql.connection.cursor()
        cur.execute("select * from tb_proveedor Where IdEstado = 3")
        proveedores = cur.fetchall()

        return render_template('modal/proveedores-modal.html')
#TRAER TODOS LOS PROVEEDORES
@app.route('/traerProveedores', methods =["POST","GET"])
def traerProveedores():
    if request.method == "POST":
        proveedor = request.form['proveedor']
        if proveedor == "":
            #SELECCIONAR EL ID DEL PROVEEDOR
            cur = mysql.connection.cursor()
            cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,e.NombreEstado FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado")
            proveedores = cur.fetchall()
        else:
            cur = mysql.connection.cursor()
            cur.execute("SELECT p.Id_Proveedor,p.NombreProveedor,e.NombreEstado FROM tb_proveedor as p inner join tb_estado as e ON p.IdEstado = e.Id_Estado where p.NombreProveedor like %s",[proveedor+'%'])
            proveedores = cur.fetchall()


        print(proveedores)
        return render_template('tablas/tabla-proveedornuevo.html',prov = proveedores)



    return render_template('administracion.html')
 
if __name__ == '__main__':
    app.run(port=5000, debug=True)