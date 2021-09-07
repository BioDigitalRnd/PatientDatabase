import sched, time

from random import randint
from pymongo import MongoClient
from pprint import pprint

from pymongo.message import update

client = MongoClient(host="localhost", port=27017)
db=client.get_database("admin")
coll = db.get_collection("PatientData")
# serverstatusresults=db.command("serverStatus")
# pprint(serverstatusresults)

datab = coll.find_one({"name": "Bob James"})

schedule = sched.scheduler(time.time, time.sleep)

def idtimeseq(isc):
    print("id")
    schedule.enter(5, 1, idtimeseq, (isc,))
    oid = datab["id"] #old id
    cid = {"id": oid} #cur id
    nid = {"$set": {"id": oid + 1}} #new id
    coll.update_one(cid,  nid) #supposed to increment id by 1 each time the function is ran

schedule.enter(5, 1, idtimeseq, (schedule,))

def agetimeseq(asc):
    print("age")
    schedule.enter(5, 1, agetimeseq, (asc,))
    oage = datab["age"] #old age
    print(oage)
    cage = {"age": oage} #cur age
    nage = {"$set": {"age": oage + 1}} #new age
    coll.update_one(cage,  nage) #supposed to increment age by 1 each time the function is ran

schedule.enter(5, 1, agetimeseq, (schedule,))
schedule.run()

