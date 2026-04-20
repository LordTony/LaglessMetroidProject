import sys
from collections import deque
from optimization_checks import CodeLine, OptimizationChecker

# Colors
HEADER = '\033[95m'
BLUE = '\033[94m'
CYAN = '\033[96m'
GREEN = '\033[92m'
WHITE = '\033[37m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'

opCodes = [
    'adc',
    'anc', # illigal
    'and',
    'asl',
    'asr', # illigal
    'bcc',
    'bcs',
    'beq',
    'bit',
    'bmi',
    'bne',
    'bpl',
    'bvc',
    'bvs',
    'clc',
    'cld',
    'cmp',
    'cpx',
    'cpy',
    'dcp', # illigal
    'dec',
    'dex',
    'dey',
    'eor',
    'inc',
    'inx',
    'iny',
    'isc', # illigal
    'jmp',
    'jsr',
    'lax',
    'lda', 
    'ldx', 
    'ldy',
    'lsr',
    'ora',
    'pha',
    'php',
    'pla',
    'plp',
    'rol',
    'ror',
    'rti',
    'rts',
    'sbc',
    'sbx',
    'sec',
    'sei',
    'sta', 
    'stx', 
    'sty',
    'tax',
    'tay',
    'txa',
    'tya'
]

if len(sys.argv) > 1:
    with open(sys.argv[1], 'r') as file:
        lineNumber = 0
        previousPrintedLine = -1
        window = deque(maxlen=10)
        for line in file:
            # strip out the comments
            lineNoComments = line.split(";", 1)[0]

            # strip out label markers "Label:" or "*"
            lineNoLabelsOrComments = lineNoComments.split(":", 1)[-1]
            lineNoLabelsOrComments = lineNoLabelsOrComments.split("*", 1)[-1]

            # lowercase
            lowerLine = lineNoLabelsOrComments.strip().lower();

            # trim the line
            trimLine = lineNoLabelsOrComments.strip();

            if(any(lowerLine.startswith(op) and trimLine != "" for op in opCodes)):
                opCode = lowerLine.split(" ")[0];
                window.append(CodeLine(lineNumber=lineNumber, raw=trimLine, opCode=opCode))
                OptimizationChecker.RunAllChecks(window)

            lineNumber = lineNumber + 1

else:
    print("Need to provide a file")