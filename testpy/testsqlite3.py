from decimal import Decimal
import sqlite3


def decimal2float(val):
    return float(str(val))
sqlite3.register_adapter(Decimal, decimal2float)


def float2decimal(val):
    return Decimal(str(val))
sqlite3.register_converter("decimal", float2decimal)


conn = sqlite3.connect(":memory:", detect_types=sqlite3.PARSE_DECLTYPES)
conn.execute("CREATE TABLE numbers (number decimal)")
conn.execute("INSERT INTO numbers(number) values (?)",
             (Decimal('123.456789'),))
conn.commit()
cur = conn.cursor()
cur.execute("SELECT * FROM numbers")
print cur.fetchone()
conn.close()
