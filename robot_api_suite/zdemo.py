import requests
base_url='https://petstore.swagger.io/v2/'
end_point='pet/101/uploadImage'
headers={}
payload={}
srcfiles = [
    {'filekey':'file','path':r'D:\Balaji\Company\Vivriti\AutomationProject\files\demo.png','type':'image/png'},
    {'filekey':'file','path':r'D:\Balaji\Company\Vivriti\AutomationProject\files\demo.png','type':'image/png'}
         ]
files=[]
for file in list(srcfiles):
    f1 = dict(file)
    temp = (f1['filekey'], (f1['path'].split('AutomationProject\\files\\')[1], open(f1['path'], 'rb'), f1['type']))
    files.append(temp)

response = requests.request('POST', base_url + end_point, headers=dict(headers), data=dict(payload), files=files)

print(response)
print(response.status_code)
