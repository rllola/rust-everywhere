#include <stdint.h>
#include <stdio.h>

extern hello_world();

int main() {
  // Calling rust function
  hello_world();
  return 0;
}
