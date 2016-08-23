while True:
    try:
        x = float(raw_input("Please enter the first number: "))
        y = float(raw_input("Please enter the second number: "))
        print "The sum of", x, "and", y, "is:", x+y
        break
    except ValueError:
        print "Please enter a NUMBER!"
        continue
