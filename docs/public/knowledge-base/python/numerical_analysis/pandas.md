# Pandas Kapsamlı Referans Rehberi

!!! info "Pandas Nedir?"
    Pandas (Python Data Analysis Library), Python'da veri analizi ve manipülasyonu için en güçlü kütüphanedir. Tablo şeklindeki verileri (DataFrame) ve tek boyutlu verileri (Series) işlemek için kapsamlı araçlar sunar.

## 📦 Kurulum ve İçe Aktarma

```python
# Kurulum
pip install pandas

# İçe aktarma
import pandas as pd
import numpy as np  # Genellikle birlikte kullanılır
```

## 🏗️ Temel Veri Yapıları

### Series (Tek Boyutlu Veri)

```python
# Liste/array'den Series oluşturma
s1 = pd.Series([1, 2, 3, 4, 5])
s2 = pd.Series([1, 2, 3, 4, 5], index=['a', 'b', 'c', 'd', 'e'])

# Sözlükten Series
data_dict = {'a': 1, 'b': 2, 'c': 3}
s3 = pd.Series(data_dict)

# NumPy array'den Series
import numpy as np
s4 = pd.Series(np.random.randn(5))

# Series özellikleri
s1.values      # NumPy array olarak değerler
s1.index       # İndeks bilgisi
s1.name = "sayılar"  # İsim atama
```

### DataFrame (İki Boyutlu Veri)

```python
# Sözlükten DataFrame
data = {
    'isim': ['Ali', 'Ayşe', 'Mehmet', 'Fatma'],
    'yaş': [25, 30, 35, 28],
    'şehir': ['İstanbul', 'Ankara', 'İzmir', 'Bursa'],
    'maaş': [5000, 6000, 7000, 5500]
}
df = pd.DataFrame(data)

# Listelerden DataFrame
df2 = pd.DataFrame([
    ['Ali', 25, 'İstanbul'],
    ['Ayşe', 30, 'Ankara']
], columns=['isim', 'yaş', 'şehir'])

# NumPy array'den DataFrame
arr = np.random.randn(4, 3)
df3 = pd.DataFrame(arr, columns=['A', 'B', 'C'])

# DataFrame özellikleri
df.shape       # (4, 4) - boyut
df.columns     # Sütun isimleri
df.index       # Satır indeksleri
df.dtypes      # Veri tipleri
df.info()      # Genel bilgi
df.describe()  # İstatistiksel özet
```

## 📊 Veri İnceleme ve Keşfi

### Temel İnceleme

```python
# İlk/son satırlar
df.head()          # İlk 5 satır
df.head(10)        # İlk 10 satır
df.tail()          # Son 5 satır
df.tail(3)         # Son 3 satır

# Rastgele örnekleme
df.sample(5)       # 5 rastgele satır
df.sample(frac=0.1)  # %10'unu rastgele al

# Boyut ve şekil bilgisi
df.shape           # (satır, sütun)
df.size            # Toplam eleman sayısı
len(df)            # Satır sayısı
df.ndim            # Boyut sayısı (her zaman 2)

# Veri tipleri
df.dtypes          # Her sütunun veri tipi
df.select_dtypes(include=['object'])    # Metin sütunları
df.select_dtypes(include=['number'])    # Sayısal sütunlar
```

### İstatistiksel Özet

```python
# Temel istatistikler
df.describe()                    # Sayısal sütunlar için özet
df.describe(include='all')       # Tüm sütunlar için özet
df.describe(include=['object'])  # Sadece metin sütunları

# Eksik veri kontrolü
df.isnull()        # Her hücre için True/False
df.isnull().sum()  # Her sütunda kaç eksik veri var
df.isna().sum()    # isnull() ile aynı
df.notnull().sum() # Dolu hücre sayısı

# Benzersiz değerler
df.nunique()       # Her sütunda kaç benzersiz değer var
df['şehir'].unique()      # Şehir sütunundaki benzersiz değerler
df['şehir'].value_counts()  # Her değerden kaç tane var
```

## 🎯 Veri Seçimi ve Filtreleme

### Sütun Seçimi

```python
# Tek sütun
df['isim']         # Series olarak
df[['isim']]       # DataFrame olarak

# Birden fazla sütun
df[['isim', 'yaş']]
sütunlar = ['isim', 'yaş', 'maaş']
df[sütunlar]

# Nokta notasyonu (eğer sütun adında boşluk yoksa)
df.isim            # df['isim'] ile aynı
```

### Satır Seçimi

```python
# İndeks tabanlı seçim (iloc)
df.iloc[0]         # İlk satır
df.iloc[0:3]       # İlk 3 satır
df.iloc[0:3, 1:3]  # İlk 3 satır, 2. ve 3. sütun
df.iloc[-1]        # Son satır

# Etiket tabanlı seçim (loc)
df.loc[0]          # İndeks 0'daki satır
df.loc[0:2]        # İndeks 0'dan 2'ye kadar (dahil)
df.loc[0:2, 'isim':'yaş']  # Belirli satır ve sütun aralığı

# Boolean indeksleme
df[df['yaş'] > 30]           # Yaşı 30'dan büyük olanlar
df[df['şehir'] == 'İstanbul']  # İstanbul'da yaşayanlar
df[(df['yaş'] > 25) & (df['maaş'] > 5500)]  # Birden fazla koşul
```

### Gelişmiş Filtreleme

```python
# isin() metodu 
şehirler = ['İstanbul', 'Ankara']
df[df['şehir'].isin(şehirler)] #İstanbul ve Ankara içeren verileri seç

# String metotları
df[df['isim'].str.contains('A')]     # İsmi A harfi içerenler
df[df['isim'].str.startswith('A')]   # A ile başlayanlar
df[df['isim'].str.endswith('t')]     # t ile bitenler

# query() metodu
df.query('yaş > 30')
df.query('yaş > 30 and maaş > 6000')
df.query('şehir in ["İstanbul", "Ankara"]')
```

## 🔧 Veri Manipülasyonu

### Yeni Sütun Ekleme

```python
# Sabit değer
df['ülke'] = 'Türkiye'

# Hesaplama ile
df['yaş_kategorisi'] = df['yaş'].apply(lambda x: 'Genç' if x < 30 else 'Orta Yaş')
df['maaş_bin'] = df['maaş'] * 1000  # Bin TL cinsinden

# Koşullu atama
df['deneyim'] = np.where(df['yaş'] > 30, 'Deneyimli', 'Yeni')

# Çoklu koşul
conditions = [
    df['yaş'] < 25,
    (df['yaş'] >= 25) & (df['yaş'] < 35),
    df['yaş'] >= 35
]
choices = ['Genç', 'Orta', 'Yaşlı']
df['yaş_grubu'] = np.select(conditions, choices, default='Bilinmiyor')
```

### Veri Değiştirme

```python
# Belirli değerleri değiştirme
df['şehir'] = df['şehir'].replace('İstanbul', 'Istanbul')
df.replace({'İstanbul': 'Istanbul', 'Ankara': 'Capital'})

# Mapping ile değiştirme
şehir_mapping = {'İstanbul': 'IST', 'Ankara': 'ANK', 'İzmir': 'IZM'}
df['şehir_kodu'] = df['şehir'].map(şehir_mapping)

# apply() fonksiyonu
df['isim_uzunluk'] = df['isim'].apply(len)
df['yaş_kare'] = df['yaş'].apply(lambda x: x**2)

# String işlemleri
df['isim_büyük'] = df['isim'].str.upper()
df['isim_küçük'] = df['isim'].str.lower()
df['isim_title'] = df['isim'].str.title()
```

### İndeks İşlemleri

```python
# İndeks sıfırlama
df.reset_index()                    # Eski indeksi sütun yap
df.reset_index(drop=True)           # Eski indeksi tamamen sil
df.reset_index(inplace=True)        # Yerinde değiştir
df.to_csv("dosya.csv", index=False) # İndeks görünmez olur

# Yeni indeks atama
df.index = ['satır1', 'satır2', 'satır3', 'satır4']
df.set_index('isim')                # Bir sütunu indeks yap
df.set_index('isim', inplace=True)  # Yerinde değiştir
df.set_index(['isim', 'şehir'])     # Çoklu indeks

# İndeks silme ve değiştirme
df.drop_level(0)                    # MultiIndex'te seviye sil
df.droplevel(0, axis=1)             # Sütun MultiIndex'te seviye sil

#Başlık değiştirme
df = pd.read_csv("dosya.csv", header=6)
df.columns = df.iloc[6]
```

### Satır ve Sütun Silme

```python
# Satır silme (indeks ile)
df.drop(0)                          # 0 indeksli satırı sil
df.drop([0, 2])                     # Birden fazla satır sil
df.drop(index=[0, 2])               # Açık şekilde indeks belirt
df.drop(range(0, 8))  # 0,1,2,3,4,5,6,7 silinir

# Satır silme (koşula göre)
df.drop(df[df['yaş'] < 25].index)   # Yaşı 25'ten küçük olanları sil

# Sütun silme
df.drop('isim', axis=1)             # İsim sütununu sil
df.drop(['isim', 'şehir'], axis=1)  # Birden fazla sütun sil
df.drop(columns=['isim', 'şehir'])  # Alternatif yazım

# Yerinde silme
df.drop('isim', axis=1, inplace=True)  # Orijinal DataFrame'i değiştir

# İlk/son satırları silme
df.drop(df.head(2).index)          # İlk 2 satırı sil
df.drop(df.tail(3).index)          # Son 3 satırı sil

# Boş satırları silme
df.dropna()                         # Eksik değer olan satırları sil
df.dropna(subset=['maaş'])          # Sadece maaş sütununda eksik olanları sil
```

### Satır ve Sütun Ekleme

```python
# Yeni satır ekleme
yeni_satır = {'isim': 'Hasan', 'yaş': 27, 'şehir': 'Adana', 'maaş': 5200}
df = pd.concat([df, pd.DataFrame([yeni_satır])], ignore_index=True)

# Birden fazla satır ekleme
yeni_satırlar = [
    {'isim': 'Zeynep', 'yaş': 29, 'şehir': 'Antalya', 'maaş': 6800},
    {'isim': 'Can', 'yaş': 33, 'şehir': 'Eskişehir', 'maaş': 7500}
]
df = pd.concat([df, pd.DataFrame(yeni_satırlar)], ignore_index=True)

# Belirli pozisyona satır ekleme
df_üst = df.iloc[:2]                # İlk 2 satır
df_alt = df.iloc[2:]                # Kalan satırlar
yeni_df = pd.concat([df_üst, pd.DataFrame([yeni_satır]), df_alt], ignore_index=True)

# Sütun ekleme (önceden gösterildi)
df['yeni_sütun'] = 'varsayılan_değer'
df.insert(1, 'pozisyon_sütunu', 'değer')  # Belirli pozisyona ekle
```

### Sıralama

```python
# Tek sütuna göre sıralama
df.sort_values('yaş')                    # Artan sırada
df.sort_values('yaş', ascending=False)   # Azalan sırada

# Birden fazla sütuna göre sıralama
df.sort_values(['yaş', 'maaş'])
df.sort_values(['yaş', 'maaş'], ascending=[True, False])

# İndekse göre sıralama
df.sort_index()                          # İndeks sırasına göre
df.sort_index(ascending=False)           # Ters indeks sırası
df.sort_index(axis=1)                    # Sütun isimlerine göre sırala
```

## 📈 Gruplama ve Aggregation

### Temel Gruplama

```python
# Tek sütuna göre gruplama
df.groupby('şehir').mean()          # Her şehir için ortalama
df.groupby('şehir').sum()           # Her şehir için toplam
df.groupby('şehir').count()         # Her şehir için sayım
df.groupby('şehir').size()          # Grup boyutları

# Birden fazla sütuna göre gruplama
df.groupby(['şehir', 'yaş_grubu']).mean()

# Belirli sütunları gruplama
df.groupby('şehir')['maaş'].mean()  # Sadece maaş ortalaması
df.groupby('şehir')[['yaş', 'maaş']].mean()  # Yaş ve maaş ortalaması
```

### Gelişmiş Aggregation

```python
# Birden fazla fonksiyon uygulama
df.groupby('şehir').agg({
    'yaş': ['mean', 'min', 'max'],
    'maaş': ['mean', 'sum', 'std']
})

# Özel aggregation fonksiyonları
df.groupby('şehir').agg({
    'yaş': lambda x: x.max() - x.min(),  # Yaş aralığı
    'maaş': ['mean', 'count']
})

# transform() - grup bazlı dönüşüm
df['maaş_ort_şehir'] = df.groupby('şehir')['maaş'].transform('mean')
df['maaş_rank'] = df.groupby('şehir')['maaş'].rank(ascending=False)
```

## 🔄 Veri Birleştirme

### Concat İşlemi

```python
# Dikey birleştirme (satır bazlı)
df1 = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
df2 = pd.DataFrame({'A': [5, 6], 'B': [7, 8]})
pd.concat([df1, df2])                    # Alt alta birleştir
pd.concat([df1, df2], ignore_index=True) # İndeksleri sıfırla

# Yatay birleştirme (sütun bazlı)
df3 = pd.DataFrame({'C': [9, 10], 'D': [11, 12]})
pd.concat([df1, df3], axis=1)  # Yan yana birleştir
```

### Join İşlemleri

```python
# Örnek veriler
df_sol = pd.DataFrame({
    'anahtar': ['A', 'B', 'C'],
    'değer1': [1, 2, 3]
})
df_sağ = pd.DataFrame({
    'anahtar': ['A', 'B', 'D'],
    'değer2': [4, 5, 6]
})

# Inner join (kesişim)
pd.merge(df_sol, df_sağ, on='anahtar', how='inner')

# Left join (sol tablo tam)
pd.merge(df_sol, df_sağ, on='anahtar', how='left')

# Right join (sağ tablo tam)
pd.merge(df_sol, df_sağ, on='anahtar', how='right')

# Outer join (birleşim)
pd.merge(df_sol, df_sağ, on='anahtar', how='outer')

# Farklı sütun isimleri
pd.merge(df_sol, df_sağ, left_on='anahtar', right_on='key')

# İndeks bazlı join
df_sol.join(df_sağ, lsuffix='_sol', rsuffix='_sağ')
```

## 🗂️ Pivot ve Reshaping

### Pivot Tabloları

```python
# Basit pivot
df_pivot = df.pivot_table(
    values='maaş',
    index='şehir',
    columns='yaş_grubu',
    aggfunc='mean'
)

# Birden fazla değer sütunu
df.pivot_table(
    values=['maaş', 'yaş'],
    index='şehir',
    aggfunc={'maaş': 'mean', 'yaş': 'count'}
)

# Pivot ile crosstab
pd.crosstab(df['şehir'], df['yaş_grubu'])
pd.crosstab(df['şehir'], df['yaş_grubu'], margins=True)  # Toplamlarla
```

### Melt ve Wide/Long Format

```python
# Wide'dan Long'a (melt)
df_wide = pd.DataFrame({
    'kişi': ['Ali', 'Ayşe'],
    '2020': [5000, 6000],
    '2021': [5500, 6500],
    '2022': [6000, 7000]
})

df_long = pd.melt(
    df_wide,
    id_vars=['kişi'],
    value_vars=['2020', '2021', '2022'],
    var_name='yıl',
    value_name='maaş'
)

# Long'dan Wide'a (pivot)
df_wide_back = df_long.pivot(
    index='kişi',
    columns='yıl',
    values='maaş'
)
```

## 📅 Tarih ve Zaman İşlemleri

### Datetime Dönüşümü

```python
# String'den datetime'a
df['tarih'] = pd.to_datetime(['2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04'])

# Farklı formatlar
df['tarih2'] = pd.to_datetime(['01/01/2023', '02/01/2023'], format='%d/%m/%Y')

# Datetime bilgilerini çıkarma
df['yıl'] = df['tarih'].dt.year
df['ay'] = df['tarih'].dt.month
df['gün'] = df['tarih'].dt.day
df['haftanın_günü'] = df['tarih'].dt.dayofweek
df['haftanın_günü_isim'] = df['tarih'].dt.day_name()
```

### Zaman Serisi İşlemleri

```python
# Tarih indeksi
df_zaman = df.set_index('tarih')

# Zaman aralığı oluşturma
tarih_aralığı = pd.date_range('2023-01-01', '2023-12-31', freq='D')  # Günlük
tarih_aralığı_ay = pd.date_range('2023-01-01', '2023-12-31', freq='M')  # Aylık

# Resample (zaman bazlı gruplama)
df_günlük = pd.DataFrame({
    'tarih': pd.date_range('2023-01-01', periods=365, freq='D'),
    'değer': np.random.randn(365)
}).set_index('tarih')

df_aylık = df_günlük.resample('M').mean()    # Aylık ortalama
df_haftalık = df_günlük.resample('W').sum()  # Haftalık toplam
```

## 💾 Dosya İşlemleri

### CSV İşlemleri

```python
# CSV okuma
df = pd.read_csv('dosya.csv')
df = pd.read_csv('dosya.csv', sep=';')           # Farklı ayırıcı
df = pd.read_csv('dosya.csv', index_col=0)       # İlk sütunu indeks yap
df = pd.read_csv('dosya.csv', usecols=['A', 'B']) # Sadece belirli sütunları oku

# CSV yazma
df.to_csv('çıktı.csv')
df.to_csv('çıktı.csv', index=False)      # İndeks olmadan
df.to_csv('çıktı.csv', sep=';')          # Farklı ayırıcı
```

### Excel İşlemleri

```python
# Excel okuma
df = pd.read_excel('dosya.xlsx')
df = pd.read_excel('dosya.xlsx', sheet_name='Sayfa1')
df = pd.read_excel('dosya.xlsx', sheet_name=None)  # Tüm sayfalar

# Excel yazma
df.to_excel('çıktı.xlsx')
df.to_excel('çıktı.xlsx', sheet_name='VerilerIM')

# Birden fazla sayfa
with pd.ExcelWriter('çıktı.xlsx') as writer:
    df1.to_excel(writer, sheet_name='Sayfa1')
    df2.to_excel(writer, sheet_name='Sayfa2')
```

### Diğer Formatlar

```python
# JSON
df.to_json('dosya.json')
df = pd.read_json('dosya.json')

# Parquet
df.to_parquet('dosya.parquet')
df = pd.read_parquet('dosya.parquet')

# SQL
import sqlite3
conn = sqlite3.connect('veritabanı.db')
df.to_sql('tablo_adı', conn)
df = pd.read_sql('SELECT * FROM tablo_adı', conn)
```

## 🧹 Veri Temizleme

### Eksik Veri İşleme

```python
# Eksik verileri tespit etme
df.isnull().sum()
df.isna().any()

# Eksik verileri doldurma
df.fillna(0)                    # 0 ile doldur
df.fillna(df.mean())            # Ortalama ile doldur
df.fillna(method='ffill')       # Önceki değerle doldur
df.fillna(method='bfill')       # Sonraki değerle doldur

# Sütun bazlı doldurma
df['maaş'].fillna(df['maaş'].median())

# Eksik verileri silme
df.dropna()                     # Eksik veri olan satırları sil
df = df.dropna()                # DataFrame'i kalıcı olarak güncelle
df.dropna(axis=1)               # Eksik veri olan sütunları sil
df = df.dropna(axis=1)          # Sütun silmeyi kalıcı yap
df.dropna(thresh=2)             # En az 2 dolu değer olan satırları tut
df = df.dropna(thresh=2)        # Thresh işlemini kalıcı yap
df.dropna(subset=['maaş'])      # Sadece maaş sütununda eksik olanları sil
df = df.dropna(subset=['maaş']) # Subset işlemini kalıcı yap
df.dropna(how='all')            # Tüm değerleri eksik olan satırları sil
df = df.dropna(how='all')       # 'how=all' işlemini kalıcı yap
```

### Duplicate (Tekrar Eden) Veriler

```python
# Tekrar eden satırları bulma
df.duplicated()                 # Boolean Series
df.duplicated().sum()           # Kaç tekrar var

# Tekrar eden satırları görme
df[df.duplicated()]

# Tekrar eden satırları silme
df.drop_duplicates()            # İlkini tut
df.drop_duplicates(keep='last') # Sonuncusunu tut
df.drop_duplicates(subset=['isim'])  # Sadece isim sütununa göre
```

### Veri Tipi Dönüşümleri

```python
# Veri tipi değiştirme
df['yaş'] = df['yaş'].astype(int)
df['maaş'] = df['maaş'].astype(float)
df['şehir'] = df['şehir'].astype('category')

# Sayısal dönüşüm (hatalar için)
df['sayı'] = pd.to_numeric(df['metin_sayı'], errors='coerce')  # Hata varsa NaN

# String işlemleri
df['isim'] = df['isim'].str.strip()        # Boşlukları temizle
df['isim'] = df['isim'].str.replace(' ', '_')  # Boşlukları _ ile değiştir
```

## 📊 İstatistiksel İşlemler

### Korelasyon ve Kovaryans

```python
# Korelasyon matrisi
df.corr()                       # Pearson korelasyonu
df.corr(method='spearman')      # Spearman korelasyonu
df.corr(method='kendall')       # Kendall korelasyonu

# İki sütun arası korelasyon
df['yaş'].corr(df['maaş'])

# Kovaryans
df.cov()
```

### Betimsel İstatistikler

```python
# Temel istatistikler
df.mean()          # Ortalama
df.median()        # Medyan
df.mode()          # Mod
df.std()           # Standart sapma
df.var()           # Varyans
df.min()           # Minimum
df.max()           # Maksimum
df.idxmin()        # Minimum değerin indeksi
df.idxmax()        # Maksimum değerin indeksi
df.quantile(0.25)  # %25 çeyreklik
df.quantile([0.25, 0.5, 0.75])  # Çeyreklikler

# Sütun bazlı indeks bulma
df['yaş'].idxmin()    # En küçük yaşın indeksi
df['yaş'].idxmax()    # En büyük yaşın indeksi
df['maaş'].idxmin()   # En düşük maaşın indeksi
df['maaş'].idxmax()   # En yüksek maaşın indeksi

# Çarpıklık ve basıklık
df.skew()          # Çarpıklık
df.kurt()          # Basıklık (kurtosis)
```

## 🎯 Gelişmiş Özellikler

### MultiIndex (Çok Seviyeli İndeks)

```python
# MultiIndex oluşturma
arrays = [['A', 'A', 'B', 'B'], [1, 2, 1, 2]]
df_multi = pd.DataFrame(np.random.randn(4, 2), 
                       index=arrays, 
                       columns=['X', 'Y'])

# Seviye bazlı işlemler
df_multi.xs('A')                    # A seviyesindeki veriler
df_multi.loc[('A', 1)]              # Belirli indeks
df_multi.sum(level=0)               # İlk seviye bazlı toplam
```

### Kategorik Veriler

```python
# Kategorik veri oluşturma
df['şehir_cat'] = df['şehir'].astype('category')
df['seviye'] = pd.Categorical(['düşük', 'orta', 'yüksek', 'orta'], 
                              categories=['düşük', 'orta', 'yüksek'], 
                              ordered=True)

# Kategorik işlemler
df['şehir_cat'].cat.categories      # Kategorileri göster
df['şehir_cat'].cat.add_categories(['Adana'])  # Kategori ekle
```

### Rolling ve Expanding Windows

```python
# Hareketli pencere (rolling)
df['maaş_3günlük_ort'] = df['maaş'].rolling(window=3).mean()
df['maaş_7günlük_std'] = df['maaş'].rolling(window=7).std()

# Genişleyen pencere (expanding)
df['maaş_kümülatif_ort'] = df['maaş'].expanding().mean()
df['maaş_kümülatif_max'] = df['maaş'].expanding().max()
```

## ⚡ Performans Optimizasyonu

### Memory Usage

```python
# Bellek kullanımını kontrol etme
df.info(memory_usage='deep')
df.memory_usage(deep=True)

# Veri tipini optimize etme
df_optimized = df.copy()
df_optimized['yaş'] = df_optimized['yaş'].astype('int8')  # Küçük int
df_optimized['şehir'] = df_optimized['şehir'].astype('category')  # Kategori
```

### Vectorized İşlemler

```python
# İyi: Vectorized işlem
df['yeni_sütun'] = df['yaş'] * 2

# Kötü: Apply ile döngü
df['yeni_sütun'] = df['yaş'].apply(lambda x: x * 2)

# Çok iyi: NumPy ile
df['yeni_sütun'] = np.multiply(df['yaş'], 2)
```

### Chaining İşlemleri

```python
# Method chaining
sonuç = (df
         .query('yaş > 25')
         .groupby('şehir')
         .agg({'maaş': 'mean'})
         .sort_values('maaş', ascending=False)
         .head(3))
```

## 🎨 Görselleştirme Entegrasyonu

### Pandas ile Plotting

```python
import matplotlib.pyplot as plt

# Basit grafikler
df['yaş'].plot(kind='hist')         # Histogram
df['yaş'].plot(kind='box')          # Box plot
df.plot.scatter(x='yaş', y='maaş')  # Scatter plot

# Grup bazlı grafikler
df.groupby('şehir')['maaş'].mean().plot(kind='bar')
```

### Seaborn Entegrasyonu

```python
import seaborn as sns

# Korelasyon matrisi heatmap
plt.figure(figsize=(10, 8))
sns.heatmap(df.corr(), annot=True, cmap='coolwarm')

# Pair plot
sns.pairplot(df, hue='şehir')
```

## 🔧 Debugging ve İpuçları

### Yaygın Hatalar ve Çözümler

```python
# KeyError: Sütun bulunamadı
try:
    result = df['olmayan_sütun']
except KeyError:
    print("Sütun bulunamadı!")
    print("Mevcut sütunlar:", df.columns.tolist())

# SettingWithCopyWarning
# Kötü
subset = df[df['yaş'] > 30]
subset['yeni_sütun'] = 1  # Uyarı verir

# İyi
subset = df[df['yaş'] > 30].copy()
subset['yeni_sütun'] = 1
```

### Debugging Araçları

```python
# DataFrame hakkında detaylı bilgi
def debug_dataframe(df):
    print(f"Shape: {df.shape}")
    print(f"Columns: {df.columns.tolist()}")
    print(f"Data types:\n{df.dtypes}")
    print(f"Memory usage: {df.memory_usage().sum()} bytes")
    print(f"Null values:\n{df.isnull().sum()}")
    print(f"Duplicate rows: {df.duplicated().sum()}")

# Belirli sütunları inceleme
def inspect_column(df, col):
    print(f"Column: {col}")
    print(f"Type: {df[col].dtype}")
    print(f"Unique values: {df[col].nunique()}")
    print(f"Null values: {df[col].isnull().sum()}")
    if df[col].dtype in ['object']:
        print(f"Value counts:\n{df[col].value_counts()}")
    else:
        print(f"Statistics:\n{df[col].describe()}")
```

## 🔗 Diğer Kütüphanelerle Entegrasyon

### NumPy ile

```python
# DataFrame'den NumPy array'e
numpy_array = df.values
numpy_array = df.to_numpy()  # Pandas 0.24+

# NumPy array'den DataFrame'e
df_from_numpy = pd.DataFrame(numpy_array, columns=['A', 'B', 'C'])
```

### Scikit-learn ile

```python
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Veri hazırlama
X = df[['yaş', 'maaş']]
y = df['şehir']

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Scaling
scaler = StandardScaler()
X_scaled = pd.DataFrame(scaler.fit_transform(X), columns=X.columns)
```

## 📖 Hızlı Referans Tablosu

| İşlem | Fonksiyon | Örnek |
|-------|-----------|-------|
| Dosya okuma | `pd.read_csv()` | `pd.read_csv('file.csv')` |
| Dosya yazma | `df.to_csv()` | `df.to_csv('output.csv')` |
| İlk satırlar | `df.head()` | `df.head(10)` |
| Temel bilgi | `df.info()` | `df.info()` |
| İstatistik | `df.describe()` | `df.describe()` |
| Filtreleme | `df[condition]` | `df[df['age'] > 30]` |
| Gruplama | `df.groupby()` | `df.groupby('city').mean()` |
| Sıralama | `df.sort_values()` | `df.sort_values('age')` |
| Eksik veri | `df.fillna()` | `df.fillna(0)` |
| Birleştirme | `pd.merge()` | `pd.merge(df1, df2, on='key')` |
| Pivot | `df.pivot_table()` | `df.pivot_table(values='sales')` |

## 🎯 İleri Seviye Konular

### Query Optimizasyonu

```python
# Büyük veriler için memory-efficient okuma
df_chunks = pd.read_csv('büyük_dosya.csv', chunksize=10000)
for chunk in df_chunks:
    # Chunk bazlı işlemler
    processed_chunk = chunk[chunk['değer'] > 100]
    processed_chunk.to_csv('işlenmiş.csv', mode='a', header=False)
```

### Custom Functions

```python
# Özel aggregation fonksiyonu
def özel_agg(x):
    return {
        'count': x.count(),
        'mean': x.mean(),
        'std': x.std(),
        'range': x.max() - x.min()
    }

df.groupby('şehir')['maaş'].agg(özel_agg)
```

!!! success "Başarı İpucu"
    Pandas'ın gücü, bu fonksiyonları kombine ederek karmaşık veri analizi görevlerini basit şekilde yapabilmesinde yatar. Bu referansı sık sık kullanarak pratik yapın!

!!! warning "Performans Uyarısı"
    Büyük veri setleriyle çalışırken:
    - Chunksize kullanın
    - Gereksiz sütunları okumayın
    - Uygun veri tiplerini seçin
    - Vectorized işlemleri tercih edin

---

*Son güncelleme: Ağustos 2025*
