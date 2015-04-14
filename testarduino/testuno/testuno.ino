
char* myStrings[] = {"This is string 1", "This is string 2", "This is string 3",
                     "This is string 4", "This is string 5", "This is string 6"
                    };

void setup() {
    Serial.begin(9600);
}

void loop() {
    for (int i = 0; i < 6; i++) {
        Serial.println(myStrings[i]);
        delay(500);
    }
}
