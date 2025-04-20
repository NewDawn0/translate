# 🦀 translate

<!--toc:start-->

- [🦀 translate](#🦀-translate)
  - [🧱 What's In The Box?](#🧱-whats-in-the-box)
  - [🛠️ How To Build It](#🛠️-how-to-build-it)
  - [✨ How To Use It](#how-to-use-it)
    - [🔥 CLI Mode (a.k.a. Hacker Mode)](#🔥-cli-mode-aka-hacker-mode)
    - [🦀 In Rust](#🦀-in-rust)
    - [💾 In C](#💾-in-c)
  - [🧪 Want to Try the C Example?](#🧪-want-to-try-the-c-example)
  - [🧠 Why Use This?](#🧠-why-use-this)
  - [🤝 Contributing](#🤝-contributing)
  - [📜 License](#📜-license)
  - [🎉 Final Thoughts](#🎉-final-thoughts)
  <!--toc:end-->

> ✨ Translate things. In Rust. With style. 🕶️

Welcome to **libtranslate**, the multilingual powerhouse you didn't know you needed but absolutely deserve.

Think:

- 🧠 Rust-level safety
- 🤝 C-level compatibility
- 🔁 Nix-level reproducibility
- 🚀 CLI speed and simplicity

---

## 🧱 What's In The Box?

| Path                   | What it is                                        |
| ---------------------- | ------------------------------------------------- |
| `result/lib/`          | `libtranslate.so` – the spicy translation core 🌶️ |
| `result/include/`      | `translate.h` – a warm hug for your 90s code 👴   |
| `result/bin/translate` | CLI tool that slaps 🚀                            |
| `examples/c-example/`  | Actual C code that runs 🤯                        |

---

## 🛠️ How To Build It

Built with 💜 by Nix.

```bash
nix build
```

🎁 Your goodies will appear in `./result` like a perfectly-wrapped holiday gift.

---

## ✨ How To Use It

### 🔥 CLI Mode (a.k.a. Hacker Mode)

```bash
./result/bin/translate hello --to=fr
# > Croissant noises intensify 🥐
```

Supports:

- Input text
- Target language
- Your ego

---

### 🦀 In Rust

```rust
use translate::{translate, Language};

let fancy = translate("hello", Language::Auto, Language::Italian);
assert_eq!(fancy, "ciao");
```

✨ Safety. ✨ Speed. ✨ No segfaults.

---

### 💾 In C

```c
#include <translate.h>

char* word = c_translate("hello", Auto, German);
printf("%s\n", word); // prints: hallo
c_translate_free(word);
```

👴 Yes, this works. Yes, it's glorious. ✨

---

## 🧪 Want to Try the C Example?

Fire up the time machine:

```bash
nix run .#c-example
```

And boom 💥 you're in a working C world with Rust wizardry behind the scenes.

---

## 🧠 Why Use This?

- ✅ Written in Rust (a.k.a. the good part of the internet)
- ✅ Easy FFI with C
- ✅ Drop-in CLI tool
- ✅ Fully reproducible builds with Nix
- ✅ Makes you look cooler on your GitHub profile

---

## 🤝 Contributing

- Found a bug? Fix it and become legend.
- Got a feature idea? Send it like a carrier pigeon.
- Just here for memes? Open a PR with a README edit.

> Bonus points for commits with 🔥 emoji.

---

## 📜 License

MIT – Because we believe in freedom and not making lawyers cry.

---

## 🎉 Final Thoughts

If your translation stack isn't Nix-built, Rust-powered, and C-compatible...
Are you even translating, bro?

> _libtranslate: bridging languages, platforms, and developer moods_ 🕊️
