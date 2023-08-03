def percent(part, whole, *, decimals=2):
    return str(100 * float(part)/float(whole))[:2 + decimals]
