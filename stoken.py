from itsdangerous import URLSafeTimedSerializer
Secret_key='Code@789'
def endata(data):
    obj=URLSafeTimedSerializer(Secret_key)
    return obj.dumps(data)
def dndata(data):
    obj=URLSafeTimedSerializer(Secret_key)
    return obj.loads(data,max_age=180)