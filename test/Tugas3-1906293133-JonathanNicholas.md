Pada minggu ini, saya mempelajari hal" paling berat selama ini, yaitu konsep curry and uncurry. Entah kenapa saya butuh waktu yang cukup lama untuk memproses konsep curry ini.

1. curry -> menyatakn setiap fungsi pada dasarnya hanya menerima sebuah parameter. Implementasi myCurry pun dapat terlihat seperti berikut:
   `myCurry f x y = f (x, y)`
2. uncurry -> kebalikan dary curry
   `myUncurry = f (x,y) = f x y`

selain itu saya juga mempelajari partial evaluation, hal ini dapat dilakukan jika tidak ada fungsi lain yang mempengaruhi sebuah nilai argumen
contoh:
`f x = g (x + 2) y x`
ini tidak dapat dijadikan `f = g (x + 2) y`, karena ada kebergantungan `x`
sebaliknya,

`f x = e x` dapat dijadikan `f = e`, jika `x` tidak muncul di `e`.

Selain itu, saya juga mempelajari conditional addition, contohnya pada soal menghitung bilangan genap

```
sumEven [] = 0
sumEven (x : xs) = if even x then x + sumEven xs else sumEven xs
```

Pada soal membuat kalkulator investasi, saya juga belajar membuat helper function rekursif

```
invest_ :: Integer -> Double -> Integer -> Double
invest_ nominal percentage 0 = toDouble nominal
invest_ nominal percentage duration = invest_ nominal percentage (duration - 1) * (1 + percentage / 100) + toDouble nominal

invest :: Integer -> Double -> Integer -> Double
invest nominal percentage duration = invest_ nominal percentage duration - toDouble nominal
```

Selain itu, di kelas saya juga belajar `foldr` dan `foldl` dimana akan dipelajari lebih lanjut di minggu 4.
