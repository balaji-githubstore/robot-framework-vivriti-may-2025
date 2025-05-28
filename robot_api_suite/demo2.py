import requests
from pywin.Demos.guidemo import demos

url = "https://petstore.swagger.io/v2/pet/101/uploadImage"

payload = {'additionalMetadata': 'image/png'}
file_path1=r"D:\Balaji\Company\Vivriti\AutomationProject\files\demo.png"
file_path2=r"D:\Balaji\Company\Vivriti\AutomationProject\files\demo.png"
files=[
  ('file',('demo.png',open(file_path1,'rb'),'image/png')),
  ('file',('demo.png',open(file_path1,'rb'),'image/png'))
]
headers = {}

response = requests.request("POST", url, headers=headers, data=payload, files=files)

print(response.text)