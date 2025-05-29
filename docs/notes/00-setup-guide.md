# Teknik Dökümantasyon Yapısı Kurulum Rehberi

> Bu sayfa, bu dokümantasyon sistemini nasıl kurduğumu, nasıl genişleteceğimi ve gelecek notlarımı nasıl ilişkilendireceğimi anlatır.  
> Gelecekte bir gün bunları neden yaptığımı unutursam, kendime selam olsun: *"Emre, işte bu yüzden yaptın!"*

---

## 🚀 Sistem Özeti

- **Alt Yapı**: [MkDocs](https://www.mkdocs.org/)
- **Tema**: [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- **Versiyon Kontrolü**: Git + Private GitHub Repo
- **Editör**: Visual Studio Code
- **Lokal Yayın**: `python -m mkdocs serve`
- **Canlı Yayın (Opsiyonel)**: GitHub Pages (gh-deploy)

---

## 📁 Örnek Klasör Yapısı

```plaintext
docs/
├── index.md
├── about.md
├── references.md
├── notes/
│ └── 00-setup-guide.md ← bu dosya
├── projects/
│ └── marinemath/
└── knowledge-base/
└── python/
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
`[MarineMath'a git](../projects/marinemath/index.md)`

[MarineMath'a git](../projects/marinemath/index.md)

Ya da:
`[Bkz: MarineMath](../projects/marinemath/index.md)`

[Bkz: MarineMath](../projects/marinemath/index.md)

Bağlantı verirken göreli yol kullanmaya dikkat ederim (../ üst klasöre çıkar).


## 📦 Admonition Kutuları

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

---

## 🎯 5. Fotoğraf Ekleme!

!!! note "Görsel Eklemek için:"

    `![Görsel açıklaması](../images/marinemath-akis.png){ width="400px" align="center" }`

![Görsel açıklaması](../images/örnek görsel.jpg){ width="400px" align="center" }

## & Son Not

Markdown dosyaları docs/ klasörü altından erişilir.

Menü sırasını belirlemek için dosya isimlerine 00-, 01- gibi ön ek koyabilirim.

`mkdocs serve` ile canlı sonucu görebilirim.

