import sys
 
def main():
    num_args = len(sys.argv) - 1
    if num_args == 1:
        sys.argv = [sys.argv[0]] + sys.argv[1:] * 4
    elif num_args == 2:
        sys.argv = [sys.argv[0]] + sys.argv[1:] * 2
    elif num_args != 4:
        print("Usage: python program.py <n1> [n2] [n3] [n4]")
        print("  1 arg:  same value used for all 4 parameters")
        print("  2 args: repeated twice (n1 n2 n1 n2)")
        print("  4 args: each parameter set individually")
        print("Each value must be an integer from 0 to 3.")
        sys.exit(1)
 
    values = []
    for arg in sys.argv[1:]:
        try:
            n = int(arg)
        except ValueError:
            print(f"Error: '{arg}' is not a valid integer.")
            sys.exit(1)
        if n < 0 or n > 3:
            print(f"Error: '{arg}' is out of range. Each value must be 0–3.")
            sys.exit(1)
        values.append(n)
 
    result = (values[0] << 6) | (values[1] << 4) | (values[2] << 2) | values[3]
    print(f"${result:02X}")
 
if __name__ == "__main__":
    main()
