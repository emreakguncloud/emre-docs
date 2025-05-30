# Teknik Dökümantasyon Yapısı Rehberi

> Bu sayfa, bu dokümantasyon sistemini nasıl kurduğumu, nasıl genişleteceğimi ve gelecek notlarımı nasıl ilişkilendireceğimi anlatır.  
> Gelecekte bir gün bunları neden yaptığımı unutursam, kendime selam olsun: *"Emre, işte bu yüzden yaptın!"*

---

## 🚀 Sistem Özeti

- **Alt Yapı**: [MkDocs](https://www.mkdocs.org/)
- **Tema**: [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- **Versiyon Kontrolü**: GitHub
- **Editör**: Visual Studio Code
- **Lokal Yayın**: Gizli dosyalarla birlikte tüm arşive erişim
- **Canlı Yayın (Opsiyonel)**: GitHub Pages (gh-deploy) ile sıırlı erişim
- **Bulut Sistemi**: GitHub Repository ile ekstra evrak yönetimi

---

## 📁 Örnek Klasör Yapısı

```plaintext
docs/
├── index.md                          ← Ana Sayfa
├── public/
│   ├── about.md                      ← Hakkımda
│   ├── references.md                 ← Referanslar
│   ├── notes/                        ← Genel Notlar (kişisel, gelişim süreci)
│   │   └── index.md
│   ├── projects/                     ← Açık Projeler
│   │   └── index.md
│   └── knowledge-base/              ← Bilgi Bankası (rehber, teknik içerik)
│       ├── 00-setup-guide.md        ← Kullanım Rehberi
│       └── python/
│           └── numerical_analysis/
│               └── numerical_analysis_modelleme.md
├── private/
│   ├── gizli.md                     ← Gizli Not
│   └── projects/
│       └── marinemath/
│           └── index.md            ← MarineMath özel proje sayfası
```

## 📌 Yeni Sayfa ve Menü Ekleme Rehberi

Aşağıdaki adımları takip ederek yeni içerikler ekleyebilirim:

---

### 🔹 1. Yeni Sayfa Oluştur (Markdown)

Örnek: Yeni bir Python notu yazacağım

Örnek dosya yolu şöyle olmalı: docs/knowledge-base/python/02-numpy-array-methods.md

Başlık Yapısı oluşturmak istersem:

`## → ikinci seviye başlık (büyük başlık)`

`### → üçüncü seviye başlık (alt başlık)`

Yani her "Hashtag" için bir alt indisi oluşturabilirsin ve ilk koydugun sembol başlığa atanır.

### 🔹 2. Menüye Tanıt

mkdocs.yml dosyasında ilgili menüye bunu şu şekilde eklerim:

nav:
  - Bilgi Bankası:
      - Python:
          - NumPy Array Metotları: knowledge-base/python/02-numpy-array-methods.md

### 🔹 3. Proje Sayfası Ekleme

Yeni bir proje için şu klasörü açarım: docs/projects/yeni-projem/
Ve içerisine index.md koyarım. Menüye şu şekilde eklerim:

nav:
  - Projeler:
      - Yeni Projem: projects/yeni-projem/index.md

### 🔹 4. Linkleme (İçeriden İçeriğe)

Proje veya bilgi notları arasında bağlantı vermek için:
`[Referanslar'a git](../references.md)`

[Referanslar'a git](../references.md)

Ya da:
`[Bkz: Referanslar](../references.md)`

[Bkz: Referanslar](../references.md)

Bağlantı verirken göreli yol kullanmaya dikkat ederim (../ üst klasöre çıkar).


## 🎯 5. Fotoğraf Ekleme!

!!! note "Görsel Eklemek için:"

    ```
        ![Görsel açıklaması](../images/marinemath-akis.png){ width="400px" align="center" }
        > 📝 *Yukarıdaki şema MarineMath projesinde hesaplama sıralamasını gösterir.*
        Bu şekilde açıklaman görselin hemen altında "not" gibi görünür 💬
    ```

![Görsel açıklaması](../images/örnek görsel.jpg){ width="400px" align="center" }
> 📝 *Yukarıdaki render ürün yerleştirme gösterir.*


## & Son Not

Markdown dosyaları docs/ klasörü altından erişilir.

Menü sırasını belirlemek için dosya isimlerine 00-, 01- gibi ön ek koyabilirim.

`mkdocs serve` ile canlı sonucu görebilirim.

## Markdown Not Alma Rehberi

Bu doküman, MkDocs Material temasında desteklenen not alma ve içerik biçimlendirme özelliklerinin kullanımını örneklerle açıklar.  
İlk satırda Markdown kodu gösterilir, altında ise nasıl göründüğü.

---

## ✅ Admonitions (Uyarı Kutuları)

```
!!! note
    Bu bir not kutusudur.
```

!!! note
    Bu bir not kutusudur.

```
!!! warning
    Bu bir uyarı kutusudur!
```

!!! warning
    Bu bir uyarı kutusudur!

```
Tümü şu şekildedir:

!!! note "Not"
    Bu bir bilgilendirme kutusudur. İçeriğe genel bilgi eklemek için kullanılır.

!!! tip "İpucu"
    Bu kutular öğrenme sırasında küçük ama değerli bilgiler verir. Genelde mavi tonlarda görünür 💡

!!! warning "Uyarı"
    Bu kutu dikkat edilmesi gereken durumları belirtmek için kullanılır. Renkleri sarı-turuncudur ⚠️

!!! danger "Tehlike"
    Bu, potansiyel hata veya riskli adımları belirtmek için kullanılan **en sert** uyarıdır 🚨

!!! example "Örnek"
    Bu, bir konsepti açıklarken örnek vermek için kullanılabilir. Örnekler öğrenmenin anahtarıdır 🔑

```

---



## ✅ Kod Bloğu (Highlight ve Line Number)

```
```python hl_lines="2"
print("Hello")
print("World")
```
```

```python hl_lines="2"
print("Hello")
print("World")
```

---

## ✅ Satır İçi Kod

```
Bunu `print("hello world")` gibi kullanabilirsin.
```

Bunu `print("hello world")` gibi kullanabilirsin.

---

## ✅ Görev Listesi (Tasklist)

```
- [x] Bu tamamlandı
- [ ] Bu henüz tamamlanmadı
```

- [x] Bu tamamlandı  
- [ ] Bu henüz tamamlanmadı

---

## ✅ Başlıklar (TOC için)

```
# Başlık 1
## Başlık 2
### Başlık 3
```

# Başlık 1
## Başlık 2
### Başlık 3

---

## ✅ İçindekiler Bağlantısı (Permalink)

Bu özellik otomatik olarak başlıkların yanına bağlantı simgesi ekler.

---

## ✅ Çok Satırlı Kod Blokları (Superfences)

```
```js
console.log("Merhaba dünya");
```
```

```js
console.log("Merhaba dünya");
```

---

## ✅ Kod Dili Yakalama

Kod bloklarının sağ üstüne dili belirtirsen dile özel renklendirme yapar:

```python
print("kopyalanabilir kod")
```

---

## ✅ Özel Nitelikler (attr_list)

```
### Başlık {.custom-class}
```

### Başlık {.custom-class}

> Bu özellik özel CSS sınıfları eklemeni sağlar.

---

## ✅ Kod Renk Algılamayı Kapatmak

```
```text
Bu metin sadece düz yazı.
```
```

```text
Bu metin sadece düz yazı.
```

---

## ✅ YAML Özelliklerinden Etkilenmeyen Notlar

MkDocs navigasyonu, logolar, faviconlar ve tema renkleri dokümantasyon içinde görünmez. Ancak `logo` veya `favicon` gibi şeyler tema bütünlüğünü etkiler.

---

## 🔍 Arama Özellikleri

- Otomatik tamamlayıcı (`search.suggest`)
- Vurgulama (`search.highlight`)
- Anlık arama (`navigation.instant`)
- Sayfa içi takip (`navigation.tracking`)

Bu özellikler YAML içinde aktiftir, doğrudan Markdown içinde görünmez ama işlevsellik sağlar.

---
