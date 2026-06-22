from collections import deque
from dataclasses import dataclass

@dataclass
class CodeLine:
    lineNumber: int
    raw: str
    opCode: str

opCodesThatAlwaysInterrupt = ['rts', 'jsr', 'jmp', 'bne', 'beq', 'bcs', 'bpl']

class OptimizationChecker:

    @staticmethod
    def RunAllChecks(window: deque[CodeLine]):
        OptimizationChecker.GeneralCheck("dcp", window, "cmp", "dec", ["lda"])
        OptimizationChecker.GeneralCheck("lax", window, "lda", "ldx", [])
        OptimizationChecker.GeneralCheck("lax", window, "ldx", "lda", [])
    
    @staticmethod
    def MiddleOfWindowContainsAny(window: list[CodeLine], opcodes: set[str]):
        if (len(window) <= 2):
            return False
        for line in window[1:-1]:
            if(line.opCode in opcodes):
                return True
        return False

    @staticmethod
    def GeneralCheck(optimizedOpCode: str, window: list[CodeLine], startOpCode: str, endOpCode: str, interruptingOpCodes: list[str]):
        currentLine = window[-1]
        if(currentLine.opCode == startOpCode):
            for i in range(len(window) - 1):
                prevLine = window[i]
                if(prevLine.opCode == endOpCode):
                    window_slice = list(window)[i:]
                    interuptingOpCodes = set(opCodesThatAlwaysInterrupt + interruptingOpCodes + [startOpCode] + [endOpCode])
                    if(not OptimizationChecker.MiddleOfWindowContainsAny(window_slice, interuptingOpCodes)):
                        print('='*10 + " Posible " + optimizedOpCode.upper() + " Replacement" + "="*10)
                        for line in window_slice:
                            print(str(line.lineNumber).zfill(4) + ": " + line.raw)
                        return