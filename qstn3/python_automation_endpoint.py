import requests
import json
from socket import timeout
import logging

url = "https://ipapi.co/json"

if(url!="null"):
        try:
            data = requests.get(url,timeout=10)
            dump = data.json()
            print(dump)

            dict_values_api=json.loads(data.text)
        
            IP=dict_values_api.get("ip")
            print(f"IP is: {IP}")
            print("Location details:")
            city=dict_values_api.get("city")
            region=dict_values_api.get("region")
            country=dict_values_api.get("country")
            timezone=dict_values_api.get("timezone")
            print(f"City is: {city}")
            print(f"Region is: {region}")
            print(f"Country is: {country}" )
            print(f"Timezone is: {timezone}" )

        except requests.exceptions.RequestException as e:
            print(f"Error: {e}")
        except requests.exceptions.Timeout:
           logging.error("timeout")

else:
     print("INVALID URL")