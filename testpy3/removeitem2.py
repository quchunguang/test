admins = {'Justin', 'John', 'Justin', 'Kevin', 'caterpillar'}

print(set() < admins)

# admins.remove("Justin")
admins = {s for s in admins if s not in {'Justin', 'caterpillar'}}
print(admins)

adminsdict1 = {s: s for s in admins if s not in {'Justin', 'caterpillar'}}
print(adminsdict1)

adminsdict2 = dict([(s, s) for s in admins])
print(adminsdict2)

adminsdict3 = dict(enumerate(admins))
print(adminsdict3)
