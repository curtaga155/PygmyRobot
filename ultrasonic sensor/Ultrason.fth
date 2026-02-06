CODE US
    import RPi.GPIO as GPIO
    GPIO.setwarnings(False)
    import time
    GPIO.setmode(GPIO.BOARD) 
    trigPin = 16
    echoPin = 18
    GPIO.setup(trigPin,GPIO.OUT)
    GPIO.setup(echoPin,GPIO.IN)
    GPIO.output(trigPin, False)
    time.sleep(.3)
    GPIO.output(trigPin, True)
    time.sleep(0.00001)
    GPIO.output(trigPin, False)

    while GPIO.input(echoPin)==0:
        debutImpulsion = time.time()
    while GPIO.input(echoPin)==1:
        finImpulsion = time.time()
    distance = round((finImpulsion - debutImpulsion) *  340  * 1000 , 1)
    dpush(int(distance))
    #print (int(distance))
END-CODE
( " Ultrason.fth" LOAD )
