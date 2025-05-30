# Sayısal Analiz Kavramları

## 🧠 1. Regresyon – Genel trendi bulmak

🎯 Amaç:
Mevcut verilerden genelleme yapmak. Belirli bir model uydurulur (doğru, polinom, üstel vs.) ve bu model üzerinden gelecekteki değerler tahmin edilir.

🧪 **Örnek**:
10 yılın sıcaklık verileri elimizde:

```plaintext
2010: 13.1°C
2011: 13.3°C
...
2019: 14.0°C
```
Şimdi biz 2030 için sıcaklık tahmini yapmak istiyoruz. Bu durumda:

Regresyon modeli kurarız (örneğin doğrusal model: y = a*t + b)

En uygun a ve b değerlerini hataları minimize ederek buluruz ➡️ bu noktada optimizasyon girer!

## 📈 2. Interpolasyon – Eksik noktayı tahmin etmek
🎯 Amaç:
Veri arasında kalan eksik noktaları tahmin etmektir. Mevcut değerlerin dışına çıkılmaz.

🧪 **Örnek**:
Elimizde bir cihazın sıcaklık-karşılık değerleri var:

```plaintext
10°C → 2.3V
20°C → 3.1V
30°C → 4.0V
```
Ama 25°C'deki veri eksik.

Burada:
Doğrusal interpolasyon ile bu noktayı tahmin ederiz.

Gerekirse daha karmaşık spline ya da polinomsal interpolasyon yapılabilir.

Interpolasyon, veri noktalarına tam oturur; yani hata sıfırdır (teoride).

## 🔧 3. Optimizasyon / Minimizasyon – En iyi değeri veya sistemi bulmak
🎯 Amaç:
Bir fonksiyonu en küçük (veya büyük) yapan değeri bulmak.

🧪 **Örnek**:
Diyelim ki bir kutunun hacmi sabit, ama en az yüzey alanlı şekilde yapmak istiyoruz.

Yüzey alanını ifade eden fonksiyonu kurarız.

Sonra bu fonksiyonu minimize ederiz ➝ minimize(surface_area(x))

## 🔄 Bu Üçü Nasıl Bağlanır?
			

| 🔍 Kavram       |🎯 Amaç      | ⚙️ Yöntem    |   📌 İlişki |
|------------------|--------------|--------------|--------------|
| Regresyon       |Genel trendi bulmak| Hata fonksiyonunu minimize etmek |Optimizasyon içerir      |
| Interpolasyon   | Eksik noktayı tahmin etmek      | Veri noktalarına tam oturmma |Hata sıfır (optimum uyum)   |
| Optimizasyon   | En iyi değeri bulmak (min/max)  | Genellikle matematiksel model |Regresyon ve interpolasyon bunu içerir   |

## 🧩 Özetle:

Interpolasyon zaten bir tür "lokal optimizasyon" yapar ama sadece bilinen veriler arasında.

Regresyon bir modeli uydururken genellikle "hata fonksiyonunu minimize" eder. Bu doğrudan optimizasyon problemidir.

Optimizasyon ise daha genel bir çatıdır: hem regresyonun temelidir, hem de mühendislik sistemlerinin çözümüdür.