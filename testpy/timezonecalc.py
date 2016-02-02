from datetime import datetime
from datetime import timedelta


date = datetime.utcnow()
print "PC's Local Time is", datetime.now()
print "CN Beijing Time is", date+timedelta(hours=8)
print "US Pacific Time is", date+timedelta(hours=-8)
