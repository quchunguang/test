import redis

r = redis.StrictRedis(host='localhost', port=6379, db=0)
# r.set('foo', 'bar1')
print r.get('foo')

r.set('bing', 'baz')
pipe = r.pipeline()
pipe.set('foo', 'bar')
pipe.get('bing')
res = pipe.execute()
print res
print pipe.set('foo', 'bar').sadd('faz', 'baz').incr('auto_number').execute()
