# NumPy Kapsamlı Referans Rehberi

!!! info "NumPy Nedir?"
    NumPy (Numerical Python), Python'da bilimsel hesaplama için temel pakettir. Çok boyutlu diziler ve bu diziler üzerinde işlem yapmak için geniş bir fonksiyon koleksiyonu sunar.

## 📦 Kurulum ve İçe Aktarma

```python
# Kurulum
pip install numpy

# İçe aktarma
import numpy as np
```

## 🏗️ Dizi Oluşturma (Array Creation)

### Temel Dizi Oluşturma

```python
# Liste/tuple'dan dizi oluşturma
arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.array([[1, 2, 3], [4, 5, 6]])

# Belirli boyutlarda boş dizi
np.empty((3, 4))          # 3x4 boş dizi
np.zeros((2, 3))          # 2x3 sıfırlarla dolu dizi
np.ones((4, 4))           # 4x4 birlerle dolu dizi
np.full((2, 2), 7)        # 2x2 dizi, tüm elemanlar 7

# Birim matris
np.eye(3)                 # 3x3 birim matris
np.identity(4)            # 4x4 birim matris
```

### Aralık ve Adım Dizileri

```python
# Aralık dizileri
np.arange(10)             # 0'dan 9'a kadar
np.arange(1, 11)          # 1'den 10'a kadar
np.arange(0, 20, 2)       # 0'dan 20'ye 2'şer artarak

# Eşit aralıklı sayılar
np.linspace(0, 10, 50)    # 0 ile 10 arasında 50 eşit nokta
np.logspace(1, 3, 20)     # 10^1 ile 10^3 arasında logaritmik 20 nokta

# Meshgrid (Grid oluşturma)
x = np.linspace(0, 1, 3)
y = np.linspace(0, 1, 2)
X, Y = np.meshgrid(x, y)
```

### Rastgele Sayı Dizileri

```python
# Rastgele sayılar
np.random.random((2, 3))     # 0-1 arası rastgele
np.random.randint(1, 10, (2, 3))  # 1-9 arası tam sayı
np.random.normal(0, 1, (3, 3))    # Normal dağılım (ortalama=0, std=1)
np.random.uniform(-1, 1, 100)     # Uniform dağılım

# Seed ayarlama (tekrarlanabilir sonuçlar için)
np.random.seed(42)
```

## 📊 Dizi Özellikleri ve Bilgileri

```python
arr = np.array([[1, 2, 3], [4, 5, 6]])

# Temel özellikler
arr.shape          # (2, 3) - boyut
arr.size           # 6 - toplam eleman sayısı
arr.ndim           # 2 - boyut sayısı
arr.dtype          # int64 - veri tipi
arr.itemsize       # 8 - her elemanın byte cinsinden boyutu
arr.nbytes         # 48 - toplam bellek kullanımı

# Veri tipi dönüşümü
arr.astype(float)  # Float'a çevir
arr.astype('int32') # int32'ye çevir
```

## 🔧 Dizi Manipülasyonu

### Şekil Değiştirme (Reshaping)

```python
arr = np.arange(12)

# Şekil değiştirme
arr.reshape(3, 4)     # 3x4 matrise çevir
arr.reshape(2, 6)     # 2x6 matrise çevir
arr.reshape(-1, 3)    # Satır sayısını otomatik hesapla, 3 sütun

# Düzleştirme
arr_2d = np.array([[1, 2], [3, 4]])
arr_2d.flatten()      # [1, 2, 3, 4] - kopya oluşturur
arr_2d.ravel()        # [1, 2, 3, 4] - mümkünse kopya oluşturmaz

# Boyut ekleme/çıkarma
arr.squeeze()         # Boyutu 1 olan eksenleri kaldır
np.expand_dims(arr, axis=0)  # Yeni eksen ekle
```

### Birleştirme ve Ayırma

```python
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])

# Birleştirme
np.concatenate([arr1, arr2])           # [1, 2, 3, 4, 5, 6]
np.hstack([arr1, arr2])                # Yatay birleştirme
np.vstack([arr1, arr2])                # Dikey birleştirme
np.column_stack([arr1, arr2])          # Sütun olarak birleştir

# 2D diziler için
arr_2d1 = np.array([[1, 2], [3, 4]])
arr_2d2 = np.array([[5, 6], [7, 8]])
np.concatenate([arr_2d1, arr_2d2], axis=0)  # Satır boyunca birleştir
np.concatenate([arr_2d1, arr_2d2], axis=1)  # Sütun boyunca birleştir

# Ayırma
arr = np.arange(9)
np.split(arr, 3)                       # 3 eşit parçaya böl
np.array_split(arr, 4)                 # 4 parçaya böl (eşit olmayabilir)
```

## 🎯 İndeksleme ve Dilimleme

### Temel İndeksleme

```python
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

# Tek eleman erişimi
arr[0]           # İlk eleman
arr[-1]          # Son eleman

# Dilimleme
arr[1:4]         # 1, 2, 3 elemanları
arr[::2]         # Çift indeksli elemanlar
arr[::-1]        # Ters sıralama

# 2D diziler
arr_2d = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
arr_2d[0, 1]     # 1. satır, 2. sütun
arr_2d[1, :]     # 2. satırın tümü
arr_2d[:, 2]     # 3. sütunun tümü
arr_2d[0:2, 1:3] # Alt matris
```

### Gelişmiş İndeksleme

```python
arr = np.array([10, 20, 30, 40, 50])

# Fancy indexing (liste/dizi ile indeksleme)
indices = [0, 2, 4]
arr[indices]     # [10, 30, 50]

# Boolean indexing
mask = arr > 25
arr[mask]        # [30, 40, 50]
arr[arr > 25]    # Aynı sonuç

# Şartlı değer atama
arr[arr > 30] = 0
```

## 🧮 Matematiksel İşlemler

### Element-wise İşlemler

```python
arr1 = np.array([1, 2, 3, 4])
arr2 = np.array([5, 6, 7, 8])

# Temel aritmetik
arr1 + arr2      # [6, 8, 10, 12]
arr1 - arr2      # [-4, -4, -4, -4]
arr1 * arr2      # [5, 12, 21, 32]
arr1 / arr2      # [0.2, 0.33, 0.43, 0.5]
arr1 ** 2        # [1, 4, 9, 16]

# Skaler işlemler
arr1 + 10        # [11, 12, 13, 14]
arr1 * 2         # [2, 4, 6, 8]

# Karşılaştırma işlemleri
arr1 > arr2      # [False, False, False, False]
arr1 == 2        # [False, True, False, False]
```

### Matematiksel Fonksiyonlar

```python
arr = np.array([1, 4, 9, 16])

# Kök ve üs
np.sqrt(arr)     # [1, 2, 3, 4]
np.power(arr, 2) # [1, 16, 81, 256]
np.exp(arr)      # e^arr
np.log(arr)      # Doğal logaritma

# Trigonometrik
angles = np.array([0, np.pi/4, np.pi/2, np.pi])
np.sin(angles)   # Sinüs
np.cos(angles)   # Kosinüs
np.tan(angles)   # Tanjant

# Yuvarlama
arr_float = np.array([1.234, 2.567, 3.891])
np.round(arr_float, 2)    # 2 ondalık basamağa yuvarla
np.floor(arr_float)       # Aşağı yuvarla
np.ceil(arr_float)        # Yukarı yuvarla
```

## 📈 İstatistiksel Fonksiyonlar

```python
arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# Temel istatistikler
np.mean(arr)         # Ortalama
np.median(arr)       # Medyan
np.std(arr)          # Standart sapma
np.var(arr)          # Varyans
np.min(arr)          # Minimum
np.max(arr)          # Maksimum

# Eksene göre işlemler
np.mean(arr, axis=0)    # Sütun ortalamaları
np.mean(arr, axis=1)    # Satır ortalamaları
np.sum(arr, axis=0)     # Sütun toplamları

# Kümülatif işlemler
np.cumsum(arr)          # Kümülatif toplam (Dizideki elemanların sırayla toplanarak yeni bir dizi oluşturur.)
np.cumprod(arr)         # Kümülatif çarpım (Dizideki elemanları sırayla çarparak yeni bir dizi oluşturur.)

# Korelasyon ve kovaryans
np.corrcoef(arr)        # Korelasyon matrisi (Korelasyon, iki değişken arasındaki doğrusal ilişkiyi ölçer.)
np.cov(arr)             # Kovaryans matrisi (Kovaryans, iki değişkenin birlikte nasıl değiştiğini ölçer.)
```

| Fonksiyon | Ne yapar?                           | Ölçekten bağımsız mı? | Dönüş tipi |
| --------- | ----------------------------------- | --------------------- | ---------- |
| cumsum    | Sıralı toplam                       | Evet                  | 1D array   |
| cumprod   | Sıralı çarpım                       | Evet                  | 1D array   |
| corrcoef  | Doğrusal ilişki katsayısı (-1…1)    | Evet                  | 2D matris  |
| cov       | Birlikte değişim ölçüsü (kovaryans) | Hayır                 | 2D matris  |

## 🔍 Arama ve Sıralama

```python
arr = np.array([3, 1, 4, 1, 5, 9, 2, 6])

# Sıralama
np.sort(arr)            # [1, 1, 2, 3, 4, 5, 6, 9]
np.argsort(arr)         # Sıralanmış indeksler (Diziyi sıralamak için gerekli indeksleri verir.)
arr.sort()              # Yerinde sıralama (Diziyi yerinde (in-place) sıralar, orijinal dizi değişir.)

# Arama
np.where(arr > 3)       # Koşulu sağlayan indeksler
np.argmax(arr)          # Maksimum değerin indeksi
np.argmin(arr)          # Minimum değerin indeksi

# Benzersiz değerler
np.unique(arr)          # Benzersiz değerler
np.unique(arr, return_counts=True)  # Sayılarla birlikte

# Arama fonksiyonları
np.searchsorted(np.sort(arr), 4)  # Sıralı dizide 4'ün konumu
```

## 🏗️ Lineer Cebir İşlemleri

```python
# Matris çarpımı
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

np.dot(A, B)            # Matris çarpımı
A @ B                   # Python 3.5 sonrası matris çarpımı (kısa yol)
np.matmul(A, B)         # Matris çarpımı fonksiyonu ( 1D girdi kabul etmez, önce 2D’ye genişletir ayrıca broadcasting desteği ile 3D ve üstü tensörlerde toplu matris çarpımı yapabilir.)

# Matris işlemleri
np.transpose(A)         # Transpoz
A.T                     # Transpoz (kısa yol)
np.linalg.det(A)        # Determinant
np.linalg.inv(A)        # Ters matris
np.trace(A)             # İz (köşegen elemanlar toplamı)

# Eigenvalues ve eigenvectors
eigenvalues, eigenvectors = np.linalg.eig(A)

# Denklem sistemi çözme (Ax = b)
b = np.array([1, 2])
x = np.linalg.solve(A, b)

# SVD (Singular Value Decomposition (SVD), bir matrisin üç özel matrise ayrıştırılmasıdır.)
U, s, Vt = np.linalg.svd(A)

#SVD nerelerde kullanılır?

#Boyut indirgeme (PCA gibi tekniklerin temeli)
#Gürültü azaltma (resim/sinyal)
#Doğrusal denklem çözümleri (kararlı çözüm bulma)
#Veri sıkıştırma (JPEG gibi tekniklerde)
```

## 🔄 Broadcasting

!!! tip "Broadcasting Nedir?"
    NumPy'da farklı boyutlardaki dizilerin aritmetik işlemlerde nasıl davrandığını belirleyen kurallar sistemidir.

```python
# Skaler ile dizi
arr = np.array([1, 2, 3, 4])
result = arr + 10        # [11, 12, 13, 14]

# Farklı boyutlu diziler
arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
arr_1d = np.array([10, 20, 30])
result = arr_2d + arr_1d  # Her satıra arr_1d eklenir, (2,2) sonuç

# Broadcasting kuralları örneği
a = np.array([[1], [2], [3]])  # (3, 1)
b = np.array([10, 20, 30])     # (3,)
result = a + b                  # (3, 3) sonuç
```

## 💾 Dosya İşlemleri

```python
# NumPy formatında kaydetme/yükleme
arr = np.array([1, 2, 3, 4, 5])
np.save('array.npy', arr)       # .npy formatında kaydet
loaded_arr = np.load('array.npy')  # Yükle

# Birden fazla dizi kaydetme
np.savez('arrays.npz', arr1=arr, arr2=arr*2)
data = np.load('arrays.npz')
arr1_loaded = data['arr1']

# Metin formatında kaydetme/yükleme
np.savetxt('array.txt', arr)
loaded_txt = np.loadtxt('array.txt')

# CSV dosyaları
np.savetxt('data.csv', arr_2d, delimiter=',')
csv_data = np.loadtxt('data.csv', delimiter=',')
```

## 🛠️ Gelişmiş Özellikler

### Koşullu İşlemler

```python
arr = np.array([1, 2, 3, 4, 5])

# Koşullu değer atama
np.where(arr > 3, arr, 0)       # 3'ten büyükse kendisi, değilse 0
np.where(arr > 3, 'büyük', 'küçük')  # String değerler

# Çoklu koşul
np.select([arr < 2, arr > 4], [arr*10, arr*100], default=arr)
```

### Veri Tipi İşlemleri

```python
# Structured arrays (yapısal diziler)
dt = np.dtype([('name', 'U10'), ('age', 'i4'), ('weight', 'f8')])
data = np.array([('Alice', 25, 55.5), ('Bob', 30, 75.2)], dtype=dt)
data['name']        # İsimlere erişim
data['age']         # Yaşlara erişim

# Record arrays
data_rec = np.rec.array(data)
data_rec.name       # Nokta notasyonu ile erişim
```

### Bellek Düzeni

```python
# C-style (satır odaklı) vs Fortran-style (sütun odaklı)
arr_c = np.array([[1, 2, 3], [4, 5, 6]], order='C')
arr_f = np.array([[1, 2, 3], [4, 5, 6]], order='F')

# Bellek bilgisi
arr.flags           # Bellek düzeni bilgileri
arr.strides         # Stride bilgisi
```

## ⚡ Performans İpuçları

!!! warning "Performans"
    - Mümkün olduğunca vectorized işlemler kullanın
    - Python döngüleri yerine NumPy fonksiyonlarını tercih edin
    - Gereksiz kopya oluşturmaktan kaçının

```python
# İyi: Vectorized işlem
arr = np.arange(1000000)
result = arr ** 2

# Kötü: Python döngüsü
result = []
for i in arr:
    result.append(i ** 2)

# Bellek verimliliği
arr.view()          # View oluştur (kopya değil)
arr.copy()          # Kopya oluştur

# In-place işlemler
arr += 1            # Yerinde toplama
np.add(arr, 1, out=arr)  # Yerinde işlem
```

## 🎨 Yaygın Kullanım Örnekleri

### Görüntü İşleme

```python
# Görüntüyü numpy dizisi olarak düşünme
image = np.random.randint(0, 256, (100, 100, 3), dtype=np.uint8)  # RGB görüntü

# Gri tonlama
gray = np.mean(image, axis=2)

# Görüntü filtreleme
kernel = np.array([[0, -1, 0], [-1, 5, -1], [0, -1, 0]])  # Keskinleştirme filtresi
```

### Sinyal İşleme

```python
# Sinyal oluşturma
t = np.linspace(0, 1, 1000)
frequency = 5
signal = np.sin(2 * np.pi * frequency * t)

# Gürültü ekleme
noise = np.random.normal(0, 0.1, len(signal))
noisy_signal = signal + noise

# Hareketli ortalama filtresi
window_size = 10
filtered = np.convolve(noisy_signal, np.ones(window_size)/window_size, mode='valid')
```

### Veri Analizi

```python
# Örnek veri seti
data = np.random.normal(100, 15, (1000, 5))  # 1000 örnek, 5 özellik

# Normalizasyon
normalized = (data - np.mean(data, axis=0)) / np.std(data, axis=0)

# Outlier tespiti
z_scores = np.abs((data - np.mean(data)) / np.std(data))
outliers = data[z_scores > 3]

# Korelasyon analizi
correlation_matrix = np.corrcoef(data.T)
```

## 📚 Hata Ayıklama ve İpuçları

### Yaygın Hatalar

```python
# Boyut uyumsuzluğu
try:
    a = np.array([1, 2, 3])
    b = np.array([[1, 2], [3, 4]])
    result = a + b  # Broadcasting hatası olabilir
except ValueError as e:
    print(f"Boyut hatası: {e}")

# Veri tipi problemleri
int_arr = np.array([1, 2, 3])
int_arr[0] = 1.5  # 1.5 -> 1 (kesme)

# View vs Copy
arr = np.array([1, 2, 3, 4])
view = arr[::2]     # View
view[0] = 100       # Orijinal diziyi de değiştirir
```

### Debugging İpuçları

```python
# Dizi bilgilerini kontrol etme
def debug_array(arr):
    print(f"Shape: {arr.shape}")
    print(f"Dtype: {arr.dtype}")
    print(f"Size: {arr.size}")
    print(f"Ndim: {arr.ndim}")
    print(f"Min: {np.min(arr)}, Max: {np.max(arr)}")
    print(f"Memory usage: {arr.nbytes} bytes")

# NaN ve Inf kontrolü
np.isnan(arr).any()     # NaN var mı?
np.isinf(arr).any()     # Inf var mı?
np.isfinite(arr).all()  # Tüm değerler sonlu mu?
```

## 🔗 Diğer Kütüphanelerle Entegrasyon

### Pandas ile

```python
import pandas as pd

# NumPy'dan Pandas'a
arr = np.array([[1, 2, 3], [4, 5, 6]])
df = pd.DataFrame(arr, columns=['A', 'B', 'C'])

# Pandas'dan NumPy'a
values = df.values  # NumPy array
```

### Matplotlib ile

```python
import matplotlib.pyplot as plt

# Grafik çizimi
x = np.linspace(0, 2*np.pi, 100)
y = np.sin(x)
plt.plot(x, y)
plt.show()
```

## 📖 Hızlı Referans Tablosu

| İşlem | Fonksiyon | Örnek |
|-------|-----------|-------|
| Dizi oluşturma | `np.array()` | `np.array([1,2,3])` |
| Sıfır dizi | `np.zeros()` | `np.zeros((2,3))` |
| Bir dizi | `np.ones()` | `np.ones((2,3))` |
| Aralık | `np.arange()` | `np.arange(0,10,2)` |
| Şekil değiştirme | `.reshape()` | `arr.reshape(2,3)` |
| Birleştirme | `np.concatenate()` | `np.concatenate([a,b])` |
| Ortalama | `np.mean()` | `np.mean(arr)` |
| Standart sapma | `np.std()` | `np.std(arr)` |
| Maksimum | `np.max()` | `np.max(arr)` |
| Minimum | `np.min()` | `np.min(arr)` |
| Sıralama | `np.sort()` | `np.sort(arr)` |
| Benzersiz | `np.unique()` | `np.unique(arr)` |

!!! success "Başarı İpucu"
    Bu referans dokümanını sık sık gözden geçirin ve pratik yaparak pekiştirin. NumPy'ın gücü, bu fonksiyonları kombine ederek karmaşık işlemleri basit şekilde yapabilmesinde yatar.

---

*Son güncelleme: Ağustos 2025*