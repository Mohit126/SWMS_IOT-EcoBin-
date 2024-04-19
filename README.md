# sample4

A new Flutter project created with FlutLab - https://flutlab.io

## Getting Started

A few resources to get you started if this is your first Flutter project:

- https://flutter.dev/docs/get-started/codelab
- https://flutter.dev/docs/cookbook

For help getting started with Flutter, view our
https://flutter.dev/docs, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents


### **System architecture**
The system is developed for smart and urban cities. The IoT structure of the waste collection system based on the cloud, including the cloud service provider to store the information. The central server deals with the volume of the accumulation information such as the number of waste loads. This information is accessible through secure network portals. This smart system consists of various components including the central server for the information regarding the waste location, the Arduino connected to sensors which consist of a precise control device for garbage collection system implementation, and the Android application. Description of the design Components: The main components of the design can be divided into three units. The use of IoT is seen where ESP32 is connected to the ultrasonic sensor to collect data from the waste bin and to send data back to the cloud. As for the android application, it is developed to monitor the container status at the client-side. And finally, a server is set to control the client notification and store the required data.


![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/dac24ee8-1c7a-40d3-93ee-05cc34378ec9)

**Fig 1. System Architecture for WMS**

### **A.Proposed System**
The connection between the hardware components of the proposed system. The ESP32 is connected to the ultrasonic sensor and sends a 40 kHz ultrasonic wave. The period it takes to hit the body and return to the sensor is important for the distance’s measurement in ESP32. The EPS32 sends the received data to the Internet database and is received through the mobile application. The hardware connection of the other bins is demonstrated. The ESP32 is used to achieve the processing process, the Ultrasonic Sensor to determine the remaining distance of the device volume, and ESP32 to transmit data. The GND is connected by ESP32, and two VCC and GND are connected to 5V. Each Arduino pin will be connected by an Echo and a trigonometric. The function AS of each pin is responsible for receiving and sending the signals. The RX and TX functions are connected to the Arduino through the EPS32 and operate only at 3.3V for each of the eight pins. For Wi-Fi enabled, the CH-PD and VCC are connected at the same voltage as ESP32.



![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/9d932298-bdd7-4049-b8b7-2816acef05e7)

**Fig 2. Proposed System for WMS**
		

**B.System Flow**
![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/6419a94d-bd14-4c7a-89cf-9bbd516ea9cc)

**Fig 3. Activity Diagram for WMS**


### **The Process Starts with Following Steps:**
Step 1: - Data Collection by IoT Device: The IoT device installed in waste bins measures the fill level using an ultrasonic sensor and retrieves the GPS coordinates using a GPS module. It sends this data along with the bin ID to the server via a SIM module.
Step 2: - Data Transmission to Firebase Server: The IoT device establishes a connection to the internet and sends the collected data to the Firebase server.
Step 3: - Data Storage in Firebase Database: The Firebase server receives the data and stores it in the database, associating each entry with the corresponding bin ID.
Step 4: - waste picker Interaction via Mobile App: waste picker accesses the mobile app where they can log in, register, or view their profile. They can also view the map screen displaying the locations of waste bins and their fill levels.
Step 5: - Displaying Bin Status on Mobile App: The mobile app retrieves bin data from the Firebase database and displays it on the map interface. waste picker can see which bins are full and need attention.
Step 6: - Routing Calculation for Waste Pickers: When waste pickers access the mobile app, they can view the bins' status and request the shortest route. The app calculates the optimal route based on the location and fill level of bins using a google map (API) routing algorithm.
Step 7: - Alerts for Waste Pickers: Waste pickers receive alerts or notifications through the mobile app about bins that are almost full or require immediate attention.
Step 8: - Waste Collection: Waste pickers follow the route provided by the app, collecting waste from bins efficiently.
Step 9: - Update Data in Firebase Server: After waste collection, the IoT devices may update the fill level of bins in real-time, reflecting the changes in the Firebase database.
Step 10: - Continuous Monitoring and Maintenance: The system is continuously monitored for any issues or anomalies. Regular maintenance and updates are performed to ensure the system operates smoothly and efficiently.

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/e6aa6ef4-9d50-4f7b-9b2f-4e9d456766e6)

**Fig 4. Circuit Diagram for WMS**

### **RESULTS**
![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/4c142ad0-43a1-4e0d-a745-a86257dbc545)

**Fig 5. Hardware Prototype for WMS**

The prototype has been created by connecting all the components i.e. the ESP32, Ultrasonic Sensor, GPS together. The ESP32 microcontroller efficiently manages the communication between the ultrasonic sensor and GPS module. The ultrasonic sensor accurately measured the waste levels in the Dustbin, providing valuable data for waste management. The GPS module contributed to location tracking, allowing for a comprehensive waste management system that can monitor waste levels at specific geographical locations.
The Sign-up Screen serves as the initial interface that users encounter when they open the waste management application. Elements describe the design elements incorporated, such as the sign-up Screen is used login in existing user to the application by validating the credentials.

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/c1cfb6a6-e8bb-47bf-8399-275466a6be39)

**Fig 6. Sign-Up Screen for WMS**

The Registration Screen enables new users to create an account for accessing the waste management system. The design elements present, such as registration fields (e.g., name, email, password), validation checks, and submission controls. The about page display user I'd and name in the text filed with a sign out button at the bottom for signing out the user.
The about page display user I'd and name in the text filed with a sign out button at the bottom for signing out the user.
The home page contains list bin bin card title each repenting a bin with unique I'd according to different bin placed in the locality.

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/e93616e4-76db-4488-9d10-b213ba0a2974)

**Fig 7. Registration Screen for WMS**

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/91b792b0-f374-4e21-a42b-f3e2ab9f6d1f)

**Fig 8. About Screen for WSM**

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/2872431c-c8f8-4fbf-b39c-7765a83d43ff)

**Fig 9. Home Screen for WSM**

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/206f1dd2-a983-4f66-95d4-a2668aa3d3f6)

**Fig 10. Single Bin Screen for WSM**

The single bin page detail view of list tile with bin I'd 101 with display battery status and fill level of the bin to the user real time and a map button to navigate to the map screen
The map screen contains the overall location of the bin marked with a marker to identify the location where the bin in installed and a direction navigation buttons at the bottom right side
After clicking the navigation buttons the user in redirect to the map application which help the user to find the shorted path /route form the current user location till the bin by showing life traffic status to the driver

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/e56a11dd-1ada-493b-a49a-3fef6237c806)

**Fig 11. Map Screen for WSM**

![image](https://github.com/Mohit126/SMWMS_IOT-EcoBin-/assets/81141220/cbe5851d-9374-499c-8711-c2d9844bb32e)

**Fig 12. Navigation Map Screen for WSM**

### **RTDB for WSM**
RTDB Server: It is used for sorting the data received via the bin module installed in a dustbin in Realtime via cloud functionality 
Authentication Server DB: It the auth service provided by firebase to save n authenticated every user sign in or register to the application help in managing user credentials.



### V.CONCLUSION
We presented an intelligent waste Management system. The IoT-based smart bin system specifically tailored for waste collectors, seamlessly integrated with a mobile application. By harnessing ESP32 hardware, ultrasonic sensors, GPS modules, and Firebase integration, the system has demonstrated exceptional efficacy in waste collection optimization, real-time monitoring, and cost-effectiveness. This review underscores the critical role of IoT solutions in addressing the mounting challenges accompanying urbanization and increased waste generation. This research significantly advances waste management practices by amalgamating IoT technology, Firebase communication, and mobile application integration. Notably, the proposed system is meticulously designed to cater exclusively to waste collectors, streamlining their operations and enhancing efficiency. By focusing solely on waste collector needs, the system offers tailored functionalities to optimize routes, improve resource allocation, and minimize operational costs. Our specialized approach underscores the paper's contribution to advancing waste management practices while emphasizing the importance of customized solutions in addressing industry-specific requirements
