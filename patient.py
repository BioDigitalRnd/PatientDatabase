from pymongo import MongoClient

client = MongoClient(host='localhost', port=27017)
database = client.get_database('admin')
collection = database.get_collection('patient')

patient = collection.find_one({'name': 'Bob James'})
print(patient['id'])

collection.update_one(
    {'id': 426},
    {'$set': {'id': 684}}
)
print(patient['id'])