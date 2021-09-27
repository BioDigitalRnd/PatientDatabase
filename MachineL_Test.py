# on Cmd:
# pip install pydotplus
# pip install -U scikit-learn
# pip install ipython
# pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
# pip install -U matplotlib

from math import gamma
from numpy.core.numeric import cross
import pydotplus
from sklearn.datasets import load_iris
from sklearn import tree
from IPython.display import Image, display

# Load libraries
#Visualize the data
from pandas import read_csv
from pandas.plotting import scatter_matrix
from matplotlib import pyplot

from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC

# Load dataset
# url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
# names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# dataset = read_csv(url, names=names)

path = r"C:\Users\BioGuest\test\Sample.csv"
tag = ['Slept well yesterday?', 'Yesterday was stressful?','Weight (kg)', 'Height (cm)']
datset = read_csv(path, names=tag)

# Split-out validation dataset
array = datset.values
X = array[:, 1]
y = array[1,:]
X_train, X_validation, Y_train, Y_validation = train_test_split(X, y, test_size=0.20, random_state=1)



# # Spot Check Algorithms
# models = []
# models.append(('LR', LogisticRegression(solver='liblinear', multi_class='ovr'))) # Logistic Regression (LR)
# models.append(('LDA', LinearDiscriminantAnalysis())) # Linear Discriminant Analysis (LDA)
# models.append(('KNN', KNeighborsClassifier())) # K-Nearest Neighbors (KNN).
# models.append(('CART', DecisionTreeClassifier())) # Classification and Regression Trees (CART).
# models.append(('NB', GaussianNB())) # Gaussian Naive Bayes (NB).
# models.append(('SVM', SVC(gamma='auto'))) # Support Vector Machines (SVM).


# # Make predictions on validation dataset
# model = SVC(gamma='auto')
# model.fit(X_train, Y_train)
# predictions = model.predict(X_validation)

# # Evaluate Predictions
# print(accuracy_score(Y_validation, predictions))
# print(confusion_matrix(Y_validation, predictions))
# print(classification_report(Y_validation, predictions))


# #Evaluate each model in turn
# results = []
# names = []
# for name, model in models:
#     kfold = StratifiedKFold(n_splits=10, random_state=1, shuffle=True)
#     cv_results = cross_val_score(model, X_train, Y_train, cv=kfold, scoring='accuracy')
#     results.append(cv_results)
#     names.append(name)
#     print('%s: %f (%f)' % (name, cv_results.mean(), cv_results.std()))

# #Compare Algorithms
# pyplot.boxplot(results, labels=names)
# pyplot.title('Algorithm Comparison')
# pyplot.show()

# # Scatter plot matrix
# scatter_matrix(dataset)
# pyplot.show()

# #histograms
# dataset.hist()
# pyplot.show()

# # Box and Whisker plots
# dataset.plot(kind='box', subplots =True, layout=(2,2), sharex=False, sharey=False)
# pyplot.show()

# # shape
# print(dataset.shape)
# # head
# print(dataset.head(20))
# # descriptions
# print(dataset.describe())
# # class distribution
# print(dataset.groupby('class').size())
