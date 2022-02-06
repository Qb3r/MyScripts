import subprocess

data = subprocess.check_output(['netsh','wlan','show','profiles']).decode('utf-8').split('\n')

profiles = []

for x in data:

    if 'All User Profile' in x :
        x = x.split(":")

        x = x[1]

        x = x[1:-1]

        profiles.append(x)

print("{:<30}| {:<}".format("Wi-Fi Name", "Password"))

print("----------------------------------------------")

for x in profiles:
     
    try:
       
        results = subprocess.check_output(['netsh', 'wlan', 'show', 'profile', x, 'key=clear']).decode('utf-8').split('\n')
    
        results = [y.split(':')[1][1:-1] for y in results if 'Key Content' in y]
         
        
        try:
            output_file = open('Wifi_Data_Dump.txt','a')
            output_file.write("{:<30}| {:<} \n".format(x, results[0]))
            output_file.close()
         
        
        except IndexError:
            print("{:<30}| {:<}".format(x, ""))
             
    
    except subprocess.CalledProcessError:
        print("Encoding Error Occured")