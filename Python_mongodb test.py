

from os import name, read
from re import L
import itertools
import sched, time
import pandas as pd

from random import randint
from pymongo import MongoClient, collection
from pprint import pprint

from pymongo.message import update

client = MongoClient(host="localhost", port=27017)
db=client.get_database("admin")
coll = db.get_collection("PatientData")
# serverstatusresults=db.command("serverStatus")
# pprint(serverstatusresults)

datab = coll.find_one({"id": 1})

schedule = sched.scheduler(time.time, time.sleep)

# Time sequence to iterrate id and age every 5 seconds

# def idtimeseq(isc):
#     print("id")
#     schedule.enter(5, 1, idtimeseq, (isc,))
#     oid = datab["id"] #old id
#     cid = {"id": oid} #cur id
#     nid = {"$set": {"id": oid + 1}} #new id
#     coll.update_one(cid,  nid) #supposed to increment id by 1 each time the function is ran

# schedule.enter(5, 1, idtimeseq, (schedule,))

# def agetimeseq(asc):
#     print("age")
#     schedule.enter(5, 1, agetimeseq, (asc,))
#     oage = datab["age"] #old age
#     cage = {"age": oage} #cur age
#     nage = {"$set": {"age": oage + 1}} #new age
#     coll.update_one(cage,  nage) #supposed to increment age by 1 each time the function is ran
  
# schedule.enter(5, 1, agetimeseq, (schedule,))

# def linefunc(num):
#     list_of_lines = []
#     count = 0
#     file = open("Test_data.txt", "r")
#     for line in file:
#         stripped_line = line.strip()
#         line_list = stripped_line.split()
#         list_of_lines.append(line_list)
#         count += 1  
#     return list_of_lines

# num = 0
# ntsqRan = False

# def nametimeseq(nsc): #Changes the Name every interval currently 5 sec
#     global num
#     global ntsqRan
#     print("name")
#     func = linefunc(0)
#     if num <= (len(func) - 1):
#         sname = ""
#         for x in func[num]:
#             sname += "" + x
#         print(sname)
#         schedule.enter(5, 1, nametimeseq, (nsc,))
#         if ntsqRan is False:        
#             oname = datab["name"] #old name        ||  once changed data is no longer retrievable fix by checking the array instead
#             ntsqRan = True
#         else:
#             curname = ""
#             for x in func[num - 1]:
#                 curname += "" + x
#                 oname =  curname
#         cname = {"name": oname} #cur name
#         nname = {"$set": {"name": sname}} # set new name
#         coll.update_one(cname, nname)
#         num += 1
  
# schedule.enter(5, 1, nametimeseq, (schedule,))
# schedule.run()

# newid = itertools.count()

# patient1 = {
#     "id" : next(newid),
#     "name" : "Jane",
#     "sex" : "Female",
#     "age" : "24",
#     "date_of_birth" : "1997-08-14",
#     "race_and_ethnicity" : "Asian British"
# }


# patient2 = {
#     "id" : next(newid),
#     "name" : "Fiona",
#     "sex" : "Female",
#     "age" : "24",
#     "date_of_birth" : "1997-04-10",
#     "race_and_ethnicity" : "White British"
# }

# if (datab == coll.find_one({"id": next(newid)})) != (datab == coll.find_one({"id": 1})):
#     coll.insert_many([patient1,patient2])

dat = pd.read_excel (r'C:\Users\BioGuest\test\DataTest.xlsx')
df = pd.DataFrame(dat, columns= ['age'])
l = pd.array
for n in df:
    print ('l')
print(df)

# print(datab['weight']['value'])
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


