#include "MyFramework.h"

#include <stdio.h>

static int i = 0;

void say_hello() {
  printf("Hello, World!\n");
}

void increaseCount() {
  i++;
}

int getCount() {
  return i;
}

int add(int x, int y) {
  return x + y;
}