# Introduction to Machine Learning Concepts

Data scientists 'train' models
Devs use them to 'inference' new values

## Machine Learning Models

A ML model is an encapsulation of a function
Defining that function is known as training
Using the function is called inferencing

### Training 

Generally models are trained on past observations. This data includes the observed attributes, or 'features' of the thing being observed and the known value you want to predict, or the 'label'.

If we are feeling mathsy, then you would call all the features x and the label y. Given there are multiple x values, we would call it a vector (basically an array).

An algorithm is then applied to the data to try and determine a relationship between the features and the label. This involves generalising that relationship as a formula so that you can use x to calculate y. This process follows the principal that you are trying to fit the data to a function to calc the label. 

Eventaully you will distill this down into a function, y = f(x) and your training is complete. This inferenced value is generally called y with a ^ on top, or y-hat.

### Types of Models and Learning

#### Supervised Machine Learning

Supervised ML involved providing both feature values and label values. This eventually determines the relationship between the features and the labels, based on past observations. 

Types of Supervised ML:

- Taken to its logical conclusion, is a process called 'regression' which aims to predict a label that is a singular numeric value, such as house price or fuel efficiency. 
- Classification is when the label represents a class. It is further split into:
    - Binary classification, which determines if an item is or is not a member of a specific class. 'Does this person have cancer?'
    - Multiclass classification, predicts a lable based on multiple possible classes. 'What type of cancer is this?'

#### Unsupervised Machine Learning

Unsupervised ML is when you do not specify the label you want and only provide features. An unspervised algorithim will determine relationships between a variety of features in the data. 

The most common type of unspervised ML is clustering, which identifies similarities in the observations based on features and sorts them into clusters. Clusters are kinda like multiclass classifications, but without defining the classes beforehand. 
