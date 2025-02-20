library;



final List<Map<String,String>> userName=[
  {
      'username':'Parikshit kathe',
      'custNo':'21333',
      'address':'A-102,Shivam Apartment,Shivam Nagar,Indore',
      'phone':'9876543210',
    
  }
];

// Sample product data
final Set<Map<String, Object>> sampleProduct = {
  {
    "id": "101",
    "name": "White Putty",
    "description": "High-quality white putty powder",
    "imageUrl": "proditem.jpeg",
    "variants": [
      { "size": ".5KG", "price": 259.0, },
      { "size": "1KG", "price": 899.0, },
      { "size": "5KG", "price": 4299.0, },
      { "size": "10KG", "price": 8499.0, },
      { "size": "20KG", "price": 16499.0, },
    ]
  },
  {
    "id": "102",
    "name": "Wall Putty",
    "description": "High-quality white putty powder",
    "imageUrl": "proditem.jpeg",
    "variants": [
      { "size": ".5KG", "price": 399.0, },
      { "size": "1KG", "price": 899.0, },
      { "size": "5KG", "price": 4299.0, },
      { "size": "10KG", "price": 8499.0, },
      { "size": "20KG", "price": 16499.0, },
    ]
  },
};  
 
final List<Map<String,String>> cartitems=[
    
      {
        "prod_id": "101",
        "name": "White Putty",
        "price": "249.0",
        "quantity": "1",
        "imageUrl": "proditem1.jpeg"
      },
      {
        "prod_id": "102",
        "name": "WAll Putty",
        "price": "399.0",
        "quantity": "1",
        "imageUrl": "proditem1.jpeg"
      },
      {
        "prod_id": "103",
        "name": "Water Proof Putty",
        "price": "319.0",
        "quantity": "1",
        "imageUrl": "proditem1.jpeg"
      }
    ]   ;

final List<Map<String,String>> orderProductsItems=[
  {
      'prodNumb':'100',
      'productName':'White-Putty',
      'productQty':'7',
      'productTotalPrice':'70000',
  },
  {
      'prodNumb':'101',
      'productName':'Putty',
      'productQty':'5',
      'productTotalPrice':'50000',
  },
  {
        'prodNumb':'102',    
      'productName':'Adhesive',
      'productQty':'10',
      'productTotalPrice':'100000',
  }
];


final List<Map<String, dynamic>> orderItems=[

        {
          
          'status': '1',
         'productName':'White Putty',
         'Qty':'7',  
         'Price':'70000',
          'orderNumber': '12345777',
          'scheduled date': '11/16/2024',
          'placed date': '11/10/2024',

        },
        {
          
          'status': '3',
         'productName':'Adhesive',  
         'Qty':'5',          
         'Price':'50000',
          'orderNumber': '12345778',
          'scheduled date': '11/11/2024',
          'placed date': '11/10/2024',

        },
        {
          
          'status': '2',
         'productName':'White Cement',  
         'Qty':'10',     
         'Price':'100000',   
          'orderNumber': '12345779',
          'scheduled date': '11/1/2024',
          'placed date': '11/10/2024'
        },
      ];