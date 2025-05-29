import requests

url = "https://petstore.swagger.io/v2/pet/findByStatus?status=sold"

payload = {}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

print(response)
print(response.text)
print(response.json())
print(response.status_code)
print(response.reason)
print(response.cookies.get())
