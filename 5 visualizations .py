"""1) Katherine Guo: health condition & alcohol consumption"""
"""plot 1:"""
import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv('C:\\Users\\Katherine Guo\\Desktop\\info330\\Final-Project--Student-Alcohol-Consumption\\higher_education-1685750016061.csv')
grouped = data.groupby(['age', 'sex'])
mean_walc = grouped['Walc'].mean()
mean_walc_df = mean_walc.reset_index()

fig, ax = plt.subplots()
for sex in mean_walc_df['sex'].unique():
    sub_df = mean_walc_df[mean_walc_df['sex'] == sex]
    x = sub_df['age']
    y = sub_df['Walc']
    ax.plot(x, y, label=sex)
ax.set_xlabel('Age')
ax.set_ylabel('Mean Weekly Alcohol Consumption')
ax.legend()

"""plot 2"""
import numpy as np

data = data[['age', 'Walc', 'health', 'sex']]
health_counts = data.groupby('health').size()
size = [health_counts[x] for x in data['health']]
cmap = plt.cm.get_cmap('cool') 
norm = plt.Normalize(data['health'].min(), data['health'].max())
colors = cmap(norm(data['health']))

plt.scatter(data['age'], data['Walc'], s=size, c=colors, alpha=0.5)
plt.xlabel('Age')
plt.ylabel('Weekly alcohol consumption')
plt.title('Student alcohol consumption')
sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
sm.set_array([])
cbar = plt.colorbar(sm)
cbar.ax.set_title('Health score')

"""plot 3"""
age_mean = data.groupby('age')['Walc'].mean()
plt.plot(age_mean.index, age_mean.values)
plt.title('Relationship between Age and Weekly Alcohol Consumption')
plt.xlabel('Age')
plt.ylabel('Average Weekly Alcohol Consumption')


"""2. 
