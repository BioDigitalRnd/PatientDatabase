

from random import randint
from re import X
from pymongo import MongoClient
from pprint import pprint

from pymongo.message import update

client = MongoClient(host="localhost", port=27017)
db=client.get_database("BioDigital")
coll = db.get_collection("PatientData")
# serverstatusresults=db.command("serverStatus")
# pprint(serverstatusresults)

datab = coll.find_one({"first_name": "Bob"})
print(datab['weight']['value'])
coll.update_one({"id": "01010"},
 {"$set": {"id": 575}})

