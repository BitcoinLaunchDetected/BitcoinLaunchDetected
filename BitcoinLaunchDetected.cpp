TCPClient client;

// Define the pins
int sensorPin = A0;  // The potentiometers sensor pin
int ledPinG = D0;    // The Green LED
int ledPinR = D1;    // The Red LED
int ledIsOn = D7;	 // The is on LED
int threshold = 700; // The variable storing the threshold of when the potentiometers is turned


void setup() {
	pinMode(ledPinG, OUTPUT);  // Declare the Green Pin
	pinMode(ledPinR, OUTPUT);  // Declare the Red Pin
	pinMode(ledIsOn, OUTPUT);  // Declare the Is On Pin
	pinMode(sensorPin, INPUT); // Declare the potentiometer input pin
}

void loop() {
	if (!client.connected()) {		  // If it disconnects from the internet
		client.stop();				  // Close the connection
		digitalWrite(ledIsOn, LOW);   // Turn OFF the Is On LED
	}
	else {
		digitalWrite(ledIsOn, HIGH);   // Turn ON the Is On LED
	}

	if (analogRead(sensorPin) > threshold) {	// If the key has been turned ON
		digitalWrite(ledPinG, LOW);				// Display data got transfering
		digitalWrite(ledPinR, HIGH);			// Display

		/*
		 *	Preform the get request on the site showing the key has been turned
		 */
		if (client.connect("bitcoin-launch-detected.herokuapp.com", 80))
		{
			client.println("GET /transactions/affirm?id=4 HTTP/1.0");
			client.println("Host: bitcoin-launch-detected.herokuapp.com");
			client.println("Content-Length: 0");
			client.println();
		}

		delay(2000);					// Delay
	}
	else {								// If the key has not been turned
		digitalWrite(ledPinG, HIGH);	// Display it's on standby
		digitalWrite(ledPinR, LOW);		// Display
	}
}
