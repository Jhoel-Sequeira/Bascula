import xmlrpc.client
# PRIMERA PRUEBA
# CONEXION A LA BASE DE DATOS
# TENEMOS LOS DATOS DE LA API Y EL USUARIO CON SU CONTRASEÑA
url = 'https://recicladora-31012023-7116641.dev.odoo.com/'
db = 'recicladora-31012023-7116641'
username = 'it@crn.com.ni'
password = '123'
# HACEMOS EL LINK DE LA CONEXION CON LA API DE ODO FORMATEANDOLO
info = xmlrpc.client.ServerProxy(
    'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/common')
info.version()
uid = info.authenticate(db, username, password, {})

# PRUEBAS PARA INSERCION EN UNA TABLA
# PRUEBAS DE PERMISOS DE CADA USUARIO
# models = xmlrpc.client.ServerProxy('{}/xmlrpc/object'.format(url))
models = xmlrpc.client.ServerProxy(
    'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/object')
permisos = models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', [
                             'write'], {})  # esta seria como la consulta que mostraria
# CREACION DE REGISTRO DENTRO DE ODDO MEDIANTE LA API
# LAS CONSULTAS SE EJECclsUTAN SEGUN EL COMANDO
# -WRITE, READ, CREATE, SEARCH
# id = models.execute_kw(db, uid, password, 'res.partner', 'create', [{'name': "Prueba2"},{'vat': "123"}]) #ESTA ES LA CONSULTA OARA CREAR LOS REGISTROS
datos = models.execute_kw(db, uid, password, 'res.partner', 'search', [
                          [['name', '=', 'Prueba']]])  # ESTA ES PARA BUSCAR POR NOMBRE

# args = [[['1', '=', 1]]]
# ids = models.execute_kw(db, uid, password, 'res.partner', 'search', args)
# models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', ['read'], {'raise_exception': False})
print(datos)

# print(id)
# traer el cargo del empleado que se logueo


def Autenticar(user, contra):
    uid = info.authenticate(db, user, contra, {})
    cargo = models.execute_kw(db, uid, contra, 'res.users', 'search_read', [
                              [['login', '=', ''+user]]], {'fields': ['x_studio_field_xql4c']})
    # mandamos a llamar el cargo del usuario logueado
    return cargo


def buscarIdProveedor(prov):
    id = models.execute_kw(db, uid, password, 'res.partner', 'search_read', [
                           [['supplier', '=', True], ['name', '=', ''+prov]]], {'fields': ['id']})
    return id[0]['id']


def TraerUsuario(id):
    info = models.execute_kw(db, uid, password, 'res.users', 'search_read', [
                             [['id', '=', ''+id]]], {'fields': ['id', 'name',]})
    return info


def buscarProveedor(prov):
    proveedores = models.execute_kw(db, uid, password, 'res.partner', 'search_read', [
                                    [['supplier', '=', True], ['name', 'ilike', ''+prov+'%']]], {'fields': ['id', 'name'], 'limit': 5})

    return proveedores


def CrearOrdenCompra(proveedorId,puntoCompra,NoBoleta,rechazo,jumbo,liquido,rechazoPet,primera,segunda):
    
    
    print(jumbo)
    pOrder = models.execute_kw(db, uid, password, 'purchase.order',
                               'create', [{'picking_type_id': puntoCompra,
                                           'supplier': True,
                                           'partner_id': proveedorId,
                                           'x_studio_field_WLD1C':NoBoleta,
                                           'x_studio_rechazo_1': rechazo,
                                           'x_studio_jumbo': jumbo,
                                           'x_studio_lquido': liquido,
                                           'x_studio_rechazo_pet': 0,
                                           'x_studio_material_de_primera': primera,
                                           'x_studio_material_de_segunda': segunda}])
    
    
    return pOrder

def IngresarMaterialOrdenCompra(material,monto,pOrder):
    id = models.execute_kw(db, uid, password, 'product.product', 'search_read', [[['name', '=',material],['purchase_ok','=',True]]],{'fields':['pricelist_id']}) 
    print("id vacio")
    print(id)
    if id:
        idMaterial = id[0]['id']
    else:
        
        id = models.execute_kw(db, uid, password, 'product.product', 'search_read', [[['name', '=',material+' '],['purchase_ok','=',True]]],{'fields':['pricelist_id']}) 
        print(id)
        idMaterial = id[0]['id']


    precio = models.execute_kw(db, uid, password, 'product.pricelist.item', 'search_read', [[['product_tmpl_id','=',([material])]]],{'fields':['price'],'limit':1}) #AQUI AGARRAMOS EL PRICE LIST PUBLICO

    if precio:
        precioUnidad = precio[0]['price']
        Id = precio[0]['id']
        print(precio)
    else:
        precio = models.execute_kw(db, uid, password, 'product.pricelist.item', 'search_read', [[['product_tmpl_id','=',([material+' '])]]],{'fields':['price'],'limit':1}) #AQUI AGARRAMOS EL PRICE LIST PUBLICO
        precioUnidad = precio[0]['price']
        Id = precio[0]['id']


    #FORMATEAR EL STRING
    print(float(precioUnidad[0:10]))
    line_data = {
        'order_id':pOrder,
        'name':'PET Rap',
        'date_planned':'05/05/23',
        'product_uom':12, #valor de libras es constante
        'price_unit':float(precioUnidad[0:10]),
        'product_qty':monto, #aqui van las libras totales
        'company_id':1,
        'state':'done',
        'product_id':id[0]['id']
    }

    datos = models.execute_kw(db,uid,password,'purchase.order.line','create',[line_data])


