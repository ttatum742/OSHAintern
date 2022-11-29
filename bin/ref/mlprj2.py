# -*- coding: utf-8 -*-
"""
Created on Sun Oct 24 13:26:46 2021

@author: ThomasTatum
"""

import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import numpy as np # linear algebra 
from sklearn import preprocessing  # features changing
from matplotlib import pyplot as plt # data visualization

##################### Data Input ###############################

df = pd.read_csv("F:\Thomas Tatum\Documents\Grad School\Machine Learning\Project 2\clarksville-housing.csv")
df.sample(5)
df.head(5)


#################  Feature scaling ##############################
scalerx = preprocessing.MinMaxScaler()
scalery = preprocessing.MinMaxScaler()

newX = scalerx.fit_transform(df.drop('price', axis='columns')) # 2D data frame is okay in fit_transform
newX.ndim
newy = scalery.fit_transform(df['price'].values.reshape(24,1)) # 1D data frame is not okay in fit_transform

# so we first have 1D array, we reshape it in 2D array before using fit_transform.


#################################################################
#################### Batch Gradient Descent ####################
#################################################################
def batch_gradient_descent(X, yobs, epoch_num, alpha = 0.01):
    number_of_features = X.shape[1]
    w = np.ones(shape=(number_of_features)) 
    w0 = 0
    m = X.shape[0] # number of rows in X or number of data samples
    
    price_list = [] 
    epoch_list = [] 
     
    for i in range(epoch_num): 
        for j in range(m):
            hypothesis = w0 + np.dot(w, X.T)
            
            price = (1/2)*np.mean(np.square(hypothesis-yobs)) # MSE (Mean Squared Error)

            w0 = w0 - (alpha/m) * np.sum(hypothesis - yobs)  #for j=0
            w = w - (alpha/m)* np.sum(hypothesis - yobs) * X[j] # for j>0
        
        price_list.append(price)
        epoch_list.append(i)
        
    return w, w0, price, price_list, epoch_list

w, w0, price, price_list, epoch_list = batch_gradient_descent(newX, newy.reshape(newy.shape[0],),500)
# we need to make newy as 1D array before we pass it in the function.
w, w0, price

price_list
epoch_list
 
pd.DataFrame(epoch_list, price_list)
 
 
for k in range(1,25):
     print("At epoch ", epoch_list[k], " the price is: ", price_list[k])


#w =w.flatten()

#################################################################
########## plot price vs. epoch #####################################
plt.xlabel("epoch")
plt.ylabel("price")
plt.plot(epoch_list,price_list)

###################################################################
########################## Prediction ##############################
def predict(area,bedrooms,bath,lot,zipcode,year,w,w0):
    newX = scalerx.transform([[area,bedrooms,bath,lot,zipcode,year]])[0]
    scaledpred_y = w0+ np.dot(w, newX.T)
   
    return scalery.inverse_transform([[scaledpred_y]])[0][0]

print("The prediction of house price is:",predict(2500,4,2,7500,37043,2021,w,w0))
####################################################################