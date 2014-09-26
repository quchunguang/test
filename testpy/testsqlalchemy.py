from sqlalchemy import *
from sqlalchemy.orm import *


class User(object):

    def __repr__(self):
        return '%s(%r, %r)' % (self.__class__.__name__, self.name, self.email)

# Create engine
# engine = create_engine('sqlite:///:memory:')
# echo=True for debug information
# engine = create_engine('sqlite:///./sqlalchemy.db', echo=True)
engine = create_engine('sqlite:///./sqlalchemy.db')
print engine.execute("select 1").scalar()

# Get meta data of engine
metadata = MetaData(engine)

# Insert new table
# users_table = Table('users', metadata,
#                     Column('id', Integer, primary_key=True),
#                     Column('name', String(40)),
#                     Column('email', String(120)))
# users_table.create()

# Insert some records
users_table = Table('users', metadata, autoload=True)
i = users_table.insert()
# i.execute(name='rsj217', email='rsj21@gmail.com')
# i.execute({'name': 'ghost'}, {'name': 'test'})

# Map class with table
mapper(User, users_table)
ul = User()
print ul

# Create session method 1
session = create_session()
query = session.query(User)
u = query.filter_by(name='rsj217').first()
print u.name

# Create session method 2
Session = sessionmaker(bind=engine)
session = Session()
u = User()
u.name = 'new'
session.add(u)
session.flush()
session.commit()
