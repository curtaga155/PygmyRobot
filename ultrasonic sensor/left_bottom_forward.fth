CODE LEFTBOTTOMFORWARD
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    GPIO.setup(35, GPIO.OUT)
    GPIO.setup(37, GPIO.OUT)
    GPIO.setup(31, GPIO.OUT)
    pgl=GPIO.PWM(31,100)
    pgl.start(0)
    GPIO.output(35, True)
    GPIO.output(37, False)
    pgl.ChangeDutyCycle(100)
    GPIO.output(31, True)
    sleep(.01)
    GPIO.output(31, False)
    pgl.stop()
    GPIO.cleanup()
END-CODE
