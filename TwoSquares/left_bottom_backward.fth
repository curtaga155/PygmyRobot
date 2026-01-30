CODE LEFTBOTTOMBACKWARD
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    GPIO.setup(37, GPIO.OUT)
    GPIO.setup(35, GPIO.OUT)
    GPIO.setup(31, GPIO.OUT)
    pgl=GPIO.PWM(31,100)
    pgl.start(0)

    GPIO.output(31,False )
    GPIO.output(35,False )
    GPIO.output(37,True )
    pgl.ChangeDutyCycle(50)
    GPIO.output(31, True)
    sleep(.01)

    GPIO.output(31, True)
    pgl.stop()
    GPIO.cleanup()
END-CODE
