import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r"C:\Users\Aixzyl\Documents\Python\machine-learning\db\demographics.xls")
df['Date'] = pd.to_datetime(df["Date"])
albany_df = df[ df['region'] == "Albany"]

# list(set(df['region'].values.tolist())) #Or
df['region'].unique()

graph_df = pd.DataFrame()

df['type'].unique()
print(df.tail(3))
df = df.copy()[df['type'] =="organic"]
df['Date'] = pd.to_datetime(df["Date"])

df.sort_values(by="Date", ascending=True, inplace=True)

for region in df['region'].unique()[:16]:
    print(region)
    region_df = df.copy()[df['region']== region]
    region_df.set_index("Date", inplace=True)
    region_df.sort_index(inplace=True)
    region_df[f'{region}_price25ma'] = region_df['AveragePrice'].rolling(25).mean()

    if graph_df.empty:
        graph_df = region_df[[f'{region}_price25ma']]

    else:
        graph_df = graph_df.join(region_df[f'{region}_price25ma'])

graph_df.plot()


plt.show()
