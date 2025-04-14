#include <stdio.h>
#include <translate.h>

int main(void) {
  const char *text = "Hallo Welt!";
  // Loop over different languages
  const Language langs[] = {English, Japanese, Arabic, Italian};
  for (unsigned char idx = 0; idx < sizeof(langs) / sizeof(langs)[0]; ++idx) {
    char *translated = c_translate(text, Auto, langs[idx]);
    printf("%s\n", translated);
    c_translate_free(translated);
  }
}
