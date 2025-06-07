# 📚 Olasılık Dağılımları Özeti (İstatistik Fizik Finali)

## 🎲 1. Klasik Olasılık Dağılımı

**Ne zaman kullanılır?**  
Tüm olası sonuçların eşit olasılıkla gerçekleştiği durumlarda (zar, para, kart vs.).

**Olasılık Formülü:**  
P(A) = istenen durum sayısı / tüm durum sayısı

**Beklenen Değer (Ortalama):**  
E(X) = ∑ xᵢ · P(xᵢ)

**Varyans:**  
Var(X) = ∑ (xᵢ - μ)² · P(xᵢ)

---

## 📊 2. Binom Dağılımı (Binomial)

**Ne zaman kullanılır?**  
Başarı/başarısızlık gibi iki sonuçlu deneylerin sabit sayıda tekrarı için.

**Olasılık Fonksiyonu:**  
P(X = k) = C(n, k) · p^k · (1 - p)^(n - k)

**Beklenen Değer:**  
E(X) = n · p

**Varyans:**  
Var(X) = n · p · (1 - p)

---

## 📈 3. Poisson Dağılımı

**Ne zaman kullanılır?**  
Belirli bir zaman/uzayda nadir olayların sayısı (örneğin: bir saatte gelen çağrı sayısı).

**Olasılık Fonksiyonu:**  
P(X = k) = (λ^k · e^(-λ)) / k!

**Beklenen Değer:**  
E(X) = λ

**Varyans:**  
Var(X) = λ

---

## 🔁 4. Hipergeometrik Dağılım

**Ne zaman kullanılır?**  
Geri koymasız seçimlerde (örneğin torbadan renkli top seçme).

**Olasılık Fonksiyonu:**  
P(X = k) = [C(K, k) · C(N-K, n-k)] / C(N, n)

**Beklenen Değer:**  
E(X) = n · (K / N)

**Varyans:**  
Var(X) = n · (K/N) · (N-K)/N · (N-n)/(N-1)

---

## 🟰 5. Normal Dağılım (Gaussian)

**Ne zaman kullanılır?**  
Sürekli değişkenlerin ortalamaya yakın dağılımı (örn. ölçüm hataları, boy, ağırlık).

**Yoğunluk Fonksiyonu:**  
f(x) = (1 / √(2πσ²)) · e^(-(x - μ)² / (2σ²))

**Beklenen Değer:**  
E(X) = μ

**Varyans:**  
Var(X) = σ²

---

## ⏱️ 6. Üstel Dağılım (Exponential)

**Ne zaman kullanılır?**  
Bir olayın gerçekleşme süresi (örn. bir cihazın bozulma süresi, bozunma zamanı).

**Yoğunluk Fonksiyonu:**  
f(x) = λ · e^(-λx), x ≥ 0

**Beklenen Değer:**  
E(X) = 1 / λ

**Varyans:**  
Var(X) = 1 / λ²

---

## 📏 7. Sürekli Olasılık Dağılımı (Genel Tanım)

**Ne zaman kullanılır?**  
Değişken sürekli değerler alıyorsa (örn. sıcaklık, hız).

**Olasılık Yoğunluk Fonksiyonu:**  
∫ f(x) dx = 1

**Beklenen Değer:**  
E(X) = ∫ x · f(x) dx

**Varyans:**  
Var(X) = ∫ (x - μ)² · f(x) dx

---

## 🌡️ 8. Maxwell-Boltzmann Dağılımı

**Ne zaman kullanılır?**  
Gaz taneciklerinin hız dağılımını modellemek için.

**Hız Dağılımı Yoğunluk Fonksiyonu:**  
f(v) = (m / (2πkT))^(3/2) · 4πv² · e^(-mv² / 2kT)

**En Olası Hız (vₚ):**  
vₚ = √(2kT / m)

**Ortalama Hız (⟨v⟩):**  
⟨v⟩ = √(8kT / πm)

**Kök Ortalama Kare Hız (vᵣₘₛ):**  
vᵣₘₛ = √(3kT / m)

---

📝 **Not:**  
Bu dosya istatistik fizik sınavı için temel dağılımların kısa açıklamalarını ve formüllerini içerir. Daha iyi anlamak için grafiklerini incelemek ve örnek sorular çözmek önerilir.
