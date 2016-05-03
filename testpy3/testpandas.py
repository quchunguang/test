""" http://pandas.pydata.org/pandas-docs/version/0.18.0/10min.html
"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# pd.test()

# Object Creation
s = pd.Series([1, 3, 5, np.NaN, 6, 8])
print(s)

dates = pd.date_range("2013-01-01", periods=6)
df = pd.DataFrame(np.random.randn(6, 4), index=dates, columns=list('ABCD'))
print(df)

df1 = pd.DataFrame({'A': 1.,
                    'B': pd.Timestamp('20130102'),
                    'C': pd.Series(1, index=list(range(4)), dtype='float32'),
                    'D': np.array([3] * 4, dtype='int32'),
                    'E': pd.Categorical(["test", "train", "test", "train"]),
                    'F': 'foo'})

# Selection
df.head()
df.tail(3)
df.index
df.columns
df.values
df.describe()
df.T
df.sort_index(axis=1, ascending=False)
df.sort_values(by='B')
df['A']
df[0:3]
df['20130102':'20130104']
df.loc[dates[0]]
df.loc[:, ['A', 'B']]
df.loc['20130102':'20130104', ['A', 'B']]
df.loc['20130102', ['A', 'B']]
df.loc[dates[0], 'A']
df.at[dates[0], 'A']
df.iloc[3]
df.iloc[3:5, 0:2]
df.iloc[[1, 2, 4], [0, 2]]
df.iloc[1:3, :]
df.iloc[:, 1:3]
df.iloc[1, 1]
df.iat[1, 1]  # fast than above
df[df.A > 0]
df[df > 0]
df[df < 0] = -df

df2 = df.copy()
df2['E'] = ['one', 'one', 'two', 'three', 'four', 'three']
df2[df2['E'].isin(['two', 'four'])]

s1 = pd.Series([1, 2, 3, 4, 5, 6], index=pd.date_range('20130102', periods=6))
df2['F'] = s1
df2.at[dates[0], 'A'] = 0
df2.iat[0, 1] = 0
df2.loc[:, 'D'] = np.array([5] * len(df))

# Missing Data
df1 = df.reindex(index=dates[0:4], columns=list(df.columns) + ['E'])
df1.loc[dates[0]:dates[1], 'E'] = 1
df1.dropna(how='any')
df1.fillna(value=5)
pd.isnull(df1)

# Operations
df.mean()
df.mean(1)
s = pd.Series([1, 3, 5, np.nan, 6, 8], index=dates).shift(2)
df.sub(s, axis='index')
df.apply(np.cumsum)
df.apply(lambda x: x.max() - x.min())
pd.Series(np.random.randint(0, 7, size=10))
s.value_counts()
s = pd.Series(['A', 'B', 'C', 'Aaba', 'Baca', np.nan, 'CABA', 'dog', 'cat'])
s.str.lower()
df = pd.DataFrame(np.random.randn(10, 4))
pieces = [df[:3], df[3:7], df[7:]]
pd.concat(pieces)
left = pd.DataFrame({'key': ['foo', 'foo'], 'lval': [1, 2]})
right = pd.DataFrame({'key': ['foo', 'foo'], 'rval': [4, 5]})
pd.merge(left, right, on='key')

df = pd.DataFrame(np.random.randn(8, 4), columns=['A', 'B', 'C', 'D'])
s = df.iloc[3]
df.append(s, ignore_index=True)

df = pd.DataFrame({'A': ['foo', 'bar', 'foo', 'bar',
                         'foo', 'bar', 'foo', 'foo'],
                   'B': ['one', 'one', 'two', 'three',
                         'two', 'two', 'one', 'three'],
                   'C': np.random.randn(8),
                   'D': np.random.randn(8)})
df.groupby('A').sum()
df.groupby(['A', 'B']).sum()

tuples = list(zip(*[['bar', 'bar', 'baz', 'baz',
                     'foo', 'foo', 'qux', 'qux'],
                    ['one', 'two', 'one', 'two',
                     'one', 'two', 'one', 'two']]))
index = pd.MultiIndex.from_tuples(tuples, names=['first', 'second'])
df = pd.DataFrame(np.random.randn(8, 2), index=index, columns=['A', 'B'])
df2 = df[:4]
stacked = df2.stack()
stacked.unstack()
stacked.unstack(1)
stacked.unstack(0)

df = pd.DataFrame({'A': ['one', 'one', 'two', 'three'] * 3,
                   'B': ['A', 'B', 'C'] * 4,
                   'C': ['foo', 'foo', 'foo', 'bar', 'bar', 'bar'] * 2,
                   'D': np.random.randn(12),
                   'E': np.random.randn(12)})
pd.pivot_table(df, values='D', index=['A', 'B'], columns=['C'])

# Time Series
rng = pd.date_range('1/1/2012', periods=100, freq='S')
ts = pd.Series(np.random.randint(0, 500, len(rng)), index=rng)
ts.resample('5Min').sum()
rng = pd.date_range('3/6/2012 00:00', periods=5, freq='D')
ts = pd.Series(np.random.randn(len(rng)), rng)
ts_utc = ts.tz_localize('UTC')
ts_utc.tz_convert('US/Eastern')
rng = pd.date_range('1/1/2012', periods=5, freq='M')
ts = pd.Series(np.random.randn(len(rng)), index=rng)
ps = ts.to_period()
ps.to_timestamp()
prng = pd.period_range('1990Q1', '2000Q4', freq='Q-NOV')
ts = pd.Series(np.random.randn(len(prng)), prng)
ts.index = (prng.asfreq('M', 'e') + 1).asfreq('H', 's') + 9
ts.head()

# Categoricals
df = pd.DataFrame(
    {"id": [1, 2, 3, 4, 5, 6], "raw_grade": ['a', 'b', 'b', 'a', 'a', 'e']})
df["grade"] = df["raw_grade"].astype("category")
df["grade"].cat.categories = ["very good", "good", "very bad"]
df["grade"] = df["grade"].cat.set_categories(
    ["very bad", "bad", "medium", "good", "very good"])
df.sort_values(by="grade")
df.groupby("grade").size()

# Plot
ts = pd.Series(
    np.random.randn(1000), index=pd.date_range('1/1/2000', periods=1000))
ts = ts.cumsum()
ts.plot()

df = pd.DataFrame(
    np.random.randn(1000, 4), index=ts.index, columns=['A', 'B', 'C', 'D'])
df = df.cumsum()
df.plot()
plt.legend(loc='best')

# plt.show()

# Getting Data In/Out
df.to_csv('foo.csv')
df = pd.read_csv('foo.csv')
# df.to_hdf('foo.h5', 'df')  # HDFStores need import `tables`
# df = pd.read_hdf('foo.h5', 'df')
# df.to_excel('foo.xlsx', sheet_name='Sheet1')  # Excel need import `xlrd`
# df = pd.read_excel('foo.xlsx', 'Sheet1', index_col=None, na_values=['NA'])

if pd.Series([False, True, False]) is not None:
    print("The array is not None")
