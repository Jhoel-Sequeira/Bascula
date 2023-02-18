import xmlrpc.client
#PRIMERA PRUEBA
#CONEXION A LA BASE DE DATOS
#TENEMOS LOS DATOS DE LA API Y EL USUARIO CON SU CONTRASEÑA
url = 'https://recicladora-31012023-7116641.dev.odoo.com/'
db = 'recicladora-31012023-7116641'
username = 'it@crn.com.ni'
password = '123'
#HACEMOS EL LINK DE LA CONEXION CON LA API DE ODO FORMATEANDOLO
info = xmlrpc.client.ServerProxy('https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/common')
info.version()
uid = info.authenticate(db, username, password,{})

# PRUEBAS PARA INSERCION EN UNA TABLA
#PRUEBAS DE PERMISOS DE CADA USUARIO
#models = xmlrpc.client.ServerProxy('{}/xmlrpc/object'.format(url))
models = xmlrpc.client.ServerProxy('https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/object')
permisos = models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', ['write'], {}) # esta seria como la consulta que mostraria
#CREACION DE REGISTRO DENTRO DE ODDO MEDIANTE LA API
#LAS CONSULTAS SE EJECclsUTAN SEGUN EL COMANDO
#-WRITE, READ, CREATE, SEARCH
#id = models.execute_kw(db, uid, password, 'res.partner', 'create', [{'name': "Prueba2"},{'vat': "123"}]) #ESTA ES LA CONSULTA OARA CREAR LOS REGISTROS
datos = models.execute_kw(db,uid,password,'res.partner','search',[[['name', '=', 'Prueba']]]) # ESTA ES PARA BUSCAR POR NOMBRE

# args = [[['1', '=', 1]]]
#ids = models.execute_kw(db, uid, password, 'res.partner', 'search', args)
#models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', ['read'], {'raise_exception': False})
print(datos)

#print(id)
#traer el cargo del empleado que se logueo


def Autenticar(user,contra):
    uid = info.authenticate(db, user, contra,{})
    cargo = models.execute_kw(db,uid,contra,'res.users','search_read',[[['login','=',''+user]]],{'fields':['x_studio_field_xql4c']})
    #mandamos a llamar el cargo del usuario logueado
    return cargo

def buscarIdProveedor(prov):
    id = models.execute_kw(db,uid,password,'res.partner','search_read',[[['supplier','=',True],['name', '=',''+prov]]],{'fields':['id']})
    return id


def TraerUsuario(id):
    info = models.execute_kw(db,uid,password,'res.users','search_read',[[['id', '=',''+id]]],{'fields':['id','name',]})
    return info