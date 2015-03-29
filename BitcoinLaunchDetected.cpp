#define lib_domain "bitcoin-launch-detected.herokuapp.com" 
TCPClient client;

// Define the pins
int sensorPin = A0;  // The potentiometers sensor pin
int ledPin = D0;     // The LED that will be lit by the sensor pin
int ledIsOn = D7;
int threshold = 900; // The variable storing the threshold of when to turn on the potentiometers value


void setup() {
    pinMode(ledPin, OUTPUT);   // Declare the ledPin as an OUTPUT
    pinMode(ledIsOn, OUTPUT);
    pinMode(sensorPin, INPUT);    
}

void loop() {
    digitalWrite(ledIsOn, HIGH);   // Turn ON the LED pins
    if(analogRead(sensorPin) > threshold) {
        digitalWrite(ledPin, HIGH);

        client.println("GET / HTTP/1.1");
        client.println("Host: " lib_domain);

        digitalWrite(ledIsOn, LOW);

        while (analogRead(sensorPin) <= threshold) SPARK_WLAN_Loop();
    } else {
        digitalWrite(ledPin, LOW);
    }
}
