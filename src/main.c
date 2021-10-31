#include <stdio.h>
#include "payment-api/payment.h"

int main() {
  printf("Calling payment API:\n");
  transfer(10);

  return 0;
}
