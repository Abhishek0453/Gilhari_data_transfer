
mongoimport --uri "mongodb://localhost:27017/Employee" --collection Employee --file "C:/Users/Abhishek/Desktop/data.json" --jsonArray


mongoexport --host localhost --port 27017 --db Employee --collection Employee --out C:/Users/Abhishek/Desktop/output.json

pause