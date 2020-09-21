from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from products import products

app = Flask(__name__)

#MySQL Connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'josezerpa'
app.config['MYSQL_PASSWORD'] = '1a11aaaa'
app.config['MYSQL_DB'] = 'rooms_admin_db'
mysql = MySQL(app)

# settings
app.secret_key = 'mysecretkey'

#get all tenant first/last name and room price
'''
SELECT tenant.first_name, tenant.last_name, contract.price
FROM contract
INNER JOIN tenant ON contract.id_tenant=tenant.id_tenant;
'''



#get all contracts
@app.route('/contracts', methods=['GET'])
def getContracts():
  cur = mysql.connection.cursor()
  cur.execute('SELECT * FROM contract')
  data = cur.fetchall()
  lista = []
  for i in data: 
    di = {}
    di['id_contract'] = i[0]
    di['type']=i[1],
    di['start_date']=i[2],
    di['end_date']=i[3],
    di['price']=int(i[4])
    lista.append(di)
  
  return jsonify(lista)


#get a contract
@app.route('/contracts/<string:contract_id>')
def getProduct(contract_id):
  cur = mysql.connection.cursor()
  cur.execute('SELECT * FROM contract WHERE id_contract = %s', (contract_id))
  data = cur.fetchall()

  lista = []
  for i in data: 
    di = {}
    di['id_contract'] = i[0]
    di['type']=i[1],
    di['start_date']=i[2],
    di['end_date']=i[3],
    di['price']=int(i[4])
    lista.append(di)

  if(len(lista) > 0):
    return jsonify({"contract": lista })
  
  return jsonify({"message": "Product not found"})
  
#save a prod
@app.route('/products', methods=['POST'])
def addProduct():
  new_product = {
    "name" : request.json['name'],
    "price" : request.json['price'],
    "quantity" : request.json['quantity']
  }
  products.append(new_product)

@app.route('/products/<string:product_name>', methods=['PUT'])
def editProduct(product_name):
  productFound = [product for product in products if product['name'] == product_name]
  if (len(productFound) > 0):
    productFound[0]['name'] = request.json['name']
    productFound[0]['price'] = request.json['price']
    productFound[0]['quantity'] = request.json['quantity']
    return jsonify({
      "message": "Product Updated",
      "product": productFound[0]
    })
  else:
    return jsonify({
      "message": "Product Not found"
    })

  return jsonify({"message": "Product Added succesfully", "products": products})

@app.route('/products/<string:product_name>', methods=['DELETE'])
def deleteProducts(product_name):
  productFound = [product for product in products if product['name'] == product_name]
  if(len(productFound) > 0):
    products.remove(productFound[0])
    return jsonify({
      "message": "product deleted",
      "products": products
    })
  else:
    return jsonify({"message": "Product not found"})


if __name__ == "__main__":
  app.run(debug=True, port=4000)

