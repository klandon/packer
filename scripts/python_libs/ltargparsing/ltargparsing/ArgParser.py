import sys  

class ArgParser:
    parsedargs = {}
           
    def __init__(self,SystemArgs):
        for i in range(len(sys.argv)):
            if i != 0:
                k,v = str(sys.argv[i]).split("=")
                self.parsedargs[k] = v
            
            
            
 
    