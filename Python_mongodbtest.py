
# from typing import Coroutine


# def test(patientid, patientname):
    
#     if patientid == patientname:
#         print("match")

# patientid = "f1"
# patientname = "f1"

# import time

# a = 0

# while True:
#         time.sleep(3)
#         a = a+1
#         print(a)

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
# update(datab['weight']['value'])

# first_name = ['bob', 'sarah', 'george']
# last_name = ['James', 'jones', 'william']
# sex = ['male', 'female', 'other']

# for x in range(1, 10):
#     Patientdata = {
#         'name' : first_name[randint(0, (len(first_name)-1))] + ' ' + last_name[randint(0, (len(last_name)-1))],
#         'sex' : sex[randint(0, (len(sex)-1))]
#     }

# result = db.reviews.insert_one(Patientdata)

# print('Created {0} of 500 as{1}'.format(x,result.inserted_id))
