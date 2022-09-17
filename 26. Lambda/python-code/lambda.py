import json
import os

print('Loading function')
functionName = os.environ['functionName']
createdBy = os.environ['createdBy']

def printValues(value1, value2, value3):
    print("Value = " + value)

def main(event, context):
    printValues(event['key1'])
    printValues(event['key2'])
    printValues(event['key3'])
    print("Env Variable - Function Name: " + functionName)
    return event['key1']
