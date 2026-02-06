CODE RIGHTBOTTOMBACKWARD
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    GPIO.setup(38, GPIO.OUT)
    GPIO.setup(36, GPIO.OUT)
    GPIO.setup(32, GPIO.OUT)
    pgl=GPIO.PWM(32,100)
    pgl.start(0)
    GPIO.output(32, False)
    GPIO.output(36,True )
    GPIO.output(38, False )
    pgl.ChangeDutyCycle(50)
    GPIO.output(32, True)
    sleep(.01)
    GPIO.output(32, True)
    pgl.stop()
    GPIO.cleanup()
END-CODE
