#! -*- encoding: utf-8 -*-
import json
from datetime import datetime, timedelta


date_handler = lambda obj: (
    obj.isoformat() if isinstance(obj, datetime) or isinstance(obj, date)
    else None
)


def main():
    o = {
        "startDate": datetime.now(),
        "endDate": datetime.now() + timedelta(minutes=10),
        "taskName": "E Job",
        "status": "RUNNING"
    }
    s = json.dumps(o, default=date_handler)
    oo = json.loads(s)
    print s
    print oo


if __name__ == '__main__':
    main()
