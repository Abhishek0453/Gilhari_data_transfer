
cbimport json -c couchbase://localhost:8091 -u username -p username -b Employee -d file://C:/Users/Abhishek/Desktop/data.json -f list -g %%id%%


cbexport json -c couchbase://localhost:8091 -u username -p username -b Employee -f list -o C:/Users/Abhishek/Desktop/output.json

pause