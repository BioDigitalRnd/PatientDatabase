from numpy.core.numeric import cross
import pandas as pd
import quandl
import math, datetime
import numpy as np
from sklearn import preprocessing, svm, model_selection
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from matplotlib import style
import pickle

style.use('ggplot')

quandl.ApiConfig.api_key= "iMXwtMoPrsEpyQz5U7-X"
df = quandl.get('WIKI/GOOGL')

df = df[['Adj. Open', 'Adj. High', 'Adj. Low', 'Adj. Close', 'Adj. Volume']]
df['HL_PCT'] = (df['Adj. High'] - df['Adj. Low']) / df ['Adj. Low'] * 100 #High - low / close price
df['PCT_Change'] = (df['Adj. Close'] - df['Adj. Open']) / df ['Adj. Open'] * 100 #New - Old / Old price 

df = df[['Adj. Close','HL_PCT','PCT_Change','Adj. Volume']] #List all the variables we anted to check

forecast_col = 'Adj. Close'
df.fillna(-99999, inplace=True)  #Fill not available

forecast_out = int(math.ceil(0.01*len(df))) # take anything and get to the ceiling/ rounds up to the nearest whole
# Predicts out 0.1 or 10% of the future data | next 10 days
#shift the column up
df['label'] = df[forecast_col].shift(-forecast_out)

X = np.array(df.drop(['label'], 1))
X = X[:-forecast_out]
X = preprocessing.scale(X)
X_lately = X[-forecast_out:]

df.dropna(inplace=True)
y = np.array(df['label'])

X_train, X_test, y_train, y_test = model_selection.train_test_split(X,y,test_size=0.2)

#Save the model as a pickle
# clf = LinearRegression(n_jobs=-1)
# clf.fit(X_train,y_train)
# with open('linearregression.pickle', 'wb') as f:
#     pickle.dump(clf, f)

#Open the last previous model
pickle_in = open(r'C:\Users\Aixzyl\Documents\Python\machine-learning\db\demographics.xls')
clf = pickle.load(pickle_in)

accuracy = clf.score(X_test,y_test)

forecast_set = clf.predict(X_lately)

print(forecast_set, accuracy, forecast_out)
df['Forecast'] = np.nan

last_date = df.iloc[-1].name
last_unix = last_date.timestamp()
one_day = 86400
next_unix = last_unix + one_day

for i in forecast_set:
    next_date = datetime.datetime.fromtimestamp(next_unix)
    next_unix += one_day
    df.loc[next_date] = [np.nan for _ in range(len(df.columns) -1)] + [i]

df['Adj. Close'].plot()
df['Forecast'].plot()
plt.legend(loc=4)
plt.xlabel('Date')
plt.ylabel('Price')

plt.show()

