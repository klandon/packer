import sys
from ltargparsing import ArgParser
import xml.etree.ElementTree as ET

version = 0.1
parse = ArgParser.ArgParser(sys.argv)

print('Ec2Config Plugin Control Windows Python Script %g' % (version))
print('Looking in File %s for plugin %s to set to %s' % (parse.parsedargs['File'],parse.parsedargs['SettingName'],parse.parsedargs['SettingValue']))

tree = ET.parse(parse.parsedargs['File'])
root = tree.getroot()

for plugChild in root.iter('Plugin'):
    if plugChild.find('Name').text == parse.parsedargs['SettingName']:
            print('Current value "%s" replacing with value passed in "%s" ' % (plugChild.find('State').text,parse.parsedargs['SettingValue']))
            plugChild.find('State').text = parse.parsedargs['SettingValue']
            tree.write(parse.parsedargs['File'])
            print('Change successfull')
            break
