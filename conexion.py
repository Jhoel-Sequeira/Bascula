from io import BytesIO
import xmlrpc.client
from flask import send_file

#IMPORTS PARA GENERAR EL EXCEL
from openpyxl import Workbook
from openpyxl.drawing.image import Image
from openpyxl.styles import Alignment,Font,Border,Side
import datetime


#=======================================================
# PRIMERA PRUEBA
# CONEXION A LA BASE DE DATOS
# TENEMOS LOS DATOS DE LA API Y EL USUARIO CON SU CONTRASEÑA
url = 'https://recicladora-31012023-7116641.dev.odoo.com/'
db = 'recicladora-31012023-7116641'

username = 'jhoel.sequeira@crn.com.ni'
password = 'crn2023'
info = xmlrpc.client.ServerProxy(
        'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/common')

uid =  info.authenticate(db, username, password, {})
models= xmlrpc.client.ServerProxy(
        'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/object')
def conectar(user,contra):
    global username 
    username = ''+user
    global password 
    password = ''+contra
    # HACEMOS EL LINK DE LA CONEXION CON LA API DE ODO FORMATEANDOLO
    info1 = xmlrpc.client.ServerProxy(
        'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/common')
    info1.version()
    global info 
    info = info1
    uid1 = info1.authenticate(db, username, password, {})
    global uid 
    uid = uid1
    # PRUEBAS PARA INSERCION EN UNA TABLA
    # PRUEBAS DE PERMISOS DE CADA USUARIO
    # models = xmlrpc.client.ServerProxy('{}/xmlrpc/object'.format(url))
    models1 = xmlrpc.client.ServerProxy(
        'https://recicladora-31012023-7116641.dev.odoo.com/xmlrpc/object')
    global models 
    models = models1
    # permisos = models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', [
    #                              'write'], {})  # esta seria como la consulta que mostraria
    # CREACION DE REGISTRO DENTRO DE ODDO MEDIANTE LA API
    # LAS CONSULTAS SE EJECclsUTAN SEGUN EL COMANDO
    # -WRITE, READ, CREATE, SEARCH
    # id = models.execute_kw(db, uid, password, 'res.partner', 'create', [{'name': "Prueba2"},{'vat': "123"}]) #ESTA ES LA CONSULTA OARA CREAR LOS REGISTROS
    # datos = models1.execute_kw(db, uid, password, 'res.partner', 'search', [
    #                         [['name', '=', 'Prueba']]])  # ESTA ES PARA BUSCAR POR NOMBRE

    # args = [[['1', '=', 1]]]
    # ids = models.execute_kw(db, uid, password, 'res.partner', 'search', args)
    # models.execute_kw(db, uid, password, 'res.partner', 'check_access_rights', ['read'], {'raise_exception': False})
    #print(datos)

# print(id)
# traer el cargo del empleado que se logueo


def obtenerUid(user,contra):
    
    return info.authenticate(db, user, contra, {})


def Autenticar(user, contra,uid):
    cargo = models.execute_kw(db, uid, contra, 'res.users', 'search_read', 
                              [[['login', '=', ''+user]]], {'fields': ['x_studio_field_xql4c','almacen']})
    # mandamos a llamar el cargo del usuario logueado
    print(cargo)
    return cargo

def conectarTemp(user, contra,prov):
    # primero autenticamos como un usuario
    uidtemp = info.authenticate(db, user, contra, {})
    #BUSCAMOS EL PROVEEDOR
    proveedores = models.execute_kw(db, uidtemp, contra, 'res.partner', 'search_read', [
                                        [['supplier', '=', True], ['name', 'ilike', ''+prov+'%']]], {'fields': ['id', 'name'], 'limit': 5})
    models.execute_kw(db, uid, password, "res.users", "write", [[uidtemp], {'session_ids': [(1, uidtemp, {'active': False})]}])
    return proveedores




def buscarIdProveedor(prov):
    id = models.execute_kw(db, uid, password, 'res.partner', 'search_read', [
                           [['supplier', '=', True], ['name', '=', ''+prov]]], {'fields': ['id']})
    return id[0]['id']


def TraerUsuario(id,uid1,password1):
    print("adentro")
    print(uid1)
    print(password1)
    print(id)
    info = models.execute_kw(db, uid1, password1, 'res.users', 'search_read', [
                             [['id', '=', ''+id]]], {'fields': ['id', 'name',]})
    return info


def buscarProveedor(prov,cargo):
    if cargo != 2:
        proveedores = models.execute_kw(db, uid, password, 'res.partner', 'search_read', [
                                        [['supplier', '=', True], ['name', 'ilike', ''+prov+'%']]], {'fields': ['id', 'name'], 'limit': 5})

        return proveedores
    else:
        proveedores = conectarTemp('doris.fonseca@crn.com.ni','123',prov)
        return proveedores


def CrearOrdenCompra(proveedorId,puntoCompra,NoBoleta,rechazo,jumbo,liquido,rechazoPet,primera,segunda,uid1,contra1):
    
    
    print(jumbo)
    pOrder = models.execute_kw(db, uid1, contra1, 'purchase.order',
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
    
    models.execute_kw(db, uid1, contra1, 'purchase.order', 'write', [pOrder, {'state': 'done'}])
    return pOrder

def IngresarMaterialOrdenCompra(material,monto,pOrder,uid1,contra1):
    print(material)
    id = models.execute_kw(db, uid1, contra1, 'product.product', 'search_read', [[['name', '=',material],['purchase_ok','=',True]]],{'fields':['pricelist_id']}) 
    print("id vacio")
    print(id)
    if id:
        idMaterial = id[0]['id']
    else:
        
        id = models.execute_kw(db, uid1, contra1, 'product.product', 'search_read', [[['name', '=',material+' '],['purchase_ok','=',True]]],{'fields':['pricelist_id']}) 
        print(id)
        idMaterial = id[0]['id']


    precio = models.execute_kw(db, uid1, contra1, 'product.pricelist.item', 'search_read', [[['product_tmpl_id','=',([material])]]],{'fields':['price'],'limit':1}) #AQUI AGARRAMOS EL PRICE LIST PUBLICO

    if precio:
        precioUnidad = precio[0]['price']
        Id = precio[0]['id']
        print(precio)
    else:
        precio = models.execute_kw(db, uid1, contra1, 'product.pricelist.item', 'search_read', [[['product_tmpl_id','=',([material+' '])]]],{'fields':['price'],'limit':1}) #AQUI AGARRAMOS EL PRICE LIST PUBLICO
        precioUnidad = precio[0]['price']
        Id = precio[0]['id']


    #FORMATEAR EL STRING
    print(float(precioUnidad[0:10]))
    line_data = {
        'order_id':pOrder,
        'name':material,
        'date_planned':'05/05/23',
        'product_uom':12, #valor de libras es constante
        'price_unit':float(precioUnidad[0:10]),
        'product_qty':monto, #aqui van las libras totales
        'company_id':1,
        'state':'done',
        'product_id':id[0]['id']
    }

    datos = models.execute_kw(db,uid1,contra1,'purchase.order.line','create',[line_data])

def traerPo(idOrden):
    po = models.execute_kw(db, uid, password, 'purchase.order', 'search_read', [[['id', '=',''+str(idOrden)]]],{'fields':['name']})
    return po

def GenerarExcel_1(contra,ids,uid1):
    # #GENERANDO UN EXCEL CON LA INFORMACION DE ODDO
    # Crea un libro de trabajo y una hoja de trabajo
    wb = Workbook()
    ws = wb.active
    ws.title = "Reporte"

    # Añade el texto en la celda A1
    ws['A1'] = 'COMPAÑÍA RECICLADORA DE NICARAGUA - REPORTE DE GRANEL PLANTA'

    # Obtiene la celda A1
    celda = ws['A1']


    # Crea un objeto Font y ajusta la propiedad bold a True para establecer el texto en negritas
    fuente = Font(bold=True)
    celda.font = fuente

    # Crea un objeto Alignment y ajusta la propiedad vertical a 'top'
    alineacion = Alignment(horizontal='center', vertical='center', wrap_text=True)
    celda.alignment = alineacion

    # Asignamos bordes a la celda
    border = Border(left=Side(style='thin'), right=Side(style='thin'), top=Side(style='thin'), bottom=Side(style='thin'))
    celda.border = border

    # Une las tres celdas para crear una celda combinada
    ws.merge_cells('A1:O1')


    # Inserta la imagen en la celda combinada B2:D4
    img = Image('static/img/logo.png')
    img.width = 50
    img.height = 50
    ws.add_image(img, 'A1')



    # Añade los nombres y apellidos a la hoja de trabajo en dos columnas separadas
    ws['A2'] = '#PO'
    ws['B2'] = 'PROVEEDOR'
    ws['C2'] = '#BOLETA'
    ws['D2'] = 'PESO PLANTA'
    ws['E2'] = 'RECHAZO'
    ws['F2'] = 'JUMBO'
    ws['G2'] = 'LIQUIDO'
    ws['H2'] = 'DEVOLUCION PET'
    ws['I2'] = 'DESTARE LBS'
    ws['J2'] = 'PESO TOTAL'
    ws['K2'] = 'PESO BÁSCULA'
    ws['L2'] = 'DIFERENCIA'
    ws['M2'] = '%'
    ws['N2'] = 'MATERIAL'
    ws['O2'] = 'TURNO'

    ws.column_dimensions['A'].width = 11
    ws.column_dimensions['B'].width = 14
    ws.column_dimensions['C'].width = 11
    ws.column_dimensions['D'].width = 15
    ws.column_dimensions['E'].width = 11
    ws.column_dimensions['F'].width = 11
    ws.column_dimensions['G'].width = 11
    ws.column_dimensions['H'].width = 19
    ws.column_dimensions['I'].width = 15
    ws.column_dimensions['J'].width = 22
    ws.column_dimensions['K'].width = 14
    ws.column_dimensions['L'].width = 15
    ws.column_dimensions['M'].width = 11
    ws.column_dimensions['N'].width = 11
    ws.column_dimensions['O'].width = 11

    ws.row_dimensions[2].height = 15
    ws.row_dimensions[1].height = 44

    columnas = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O']
    #APLICAMOS EL FORMATO A LAS CELDAS DEL FOR ENCABEZADOS

    for col in columnas:
        border = Border(left=Side(style='thin'), right=Side(style='thin'), top=Side(style='thin'), bottom=Side(style='thin'))
        ws[col+'2'].border = border
        ws[col+'2'].alignment = alineacion
        ws[col+'2'].font = fuente
        


    filaCont = 3
    # Añade los datos a la hoja de trabajo
    for id in ids:
        potemp = models.execute_kw(db, uid1, contra, 'purchase.order', 'search_read', [[['name', '=',''+str(id)]]])
        # Recuperar las líneas de pedido de compra asociadas a la orden de compra
        print(potemp[0]['id'])
        order_lines = models.execute_kw(db, uid1, contra, 'purchase.order.line', 'search_read', [[('order_id', '=', potemp[0]['id'])]], {'fields': ['product_qty']})
        
        # Sumar las cantidades de cada línea de pedido de compra
        total_cantidad = sum(line['product_qty'] for line in order_lines)
        for row_num, fila in enumerate(potemp, filaCont):
            # Une las tres celdas para crear una celda combinada
            #ws.merge_cells('A'+str(row_num)+':C7')
            ws.cell(row=row_num, column=1, value=fila['name'])
            ws.cell(row=row_num, column=2, value=fila['partner_id'][1])
            ws.cell(row=row_num, column=3, value=fila['x_studio_field_WLD1C'])
            ws.cell(row=row_num, column=4, value=total_cantidad)
            ws.cell(row=row_num, column=5, value=fila['x_studio_rechazo_1'])
            ws.cell(row=row_num, column=6, value=fila['x_studio_jumbo'])
            ws.cell(row=row_num, column=7, value=fila['x_studio_lquido'])

            ws.cell(row=row_num, column=8, value='0')
            ws.cell(row=row_num, column=9, value='0')
            ws.cell(row=row_num, column=10, value='=SUMA(D'+str(row_num)+',E'+str(row_num)+',F'+str(row_num)+',G'+str(row_num)+')')
            ws.cell(row=row_num, column=11, value='0')
            ws.cell(row=row_num, column=12, value='0')
            ws.cell(row=row_num, column=13, value='0')
            ws.cell(row=row_num, column=14, value='0')
            ws.cell(row=row_num, column=15, value='0')
        filaCont += 1




    # Guarda el archivo de Excel
    # Obtener la fecha actual
    fecha_hora_actual = datetime.datetime.now()
    fecha_hora_actual_formateada = fecha_hora_actual.strftime("%d-%m-%y_%H%M%S")
    

    
    # output = BytesIO()
    # wb.save(output)
    # output.seek(0)
    nombre = "static/Reportes/Reporte_"+str(fecha_hora_actual_formateada)+".xlsx"
    wb.save(nombre)
    return nombre
    #return output