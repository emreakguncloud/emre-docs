# 🏗️ MarineMath Desktop – Yazılım Mimarisi

## 📱 Uygulama Akışı (User Journey)

```plaintext
BAŞLANGIÇ
   ↓
Ana Sayfa (start_page.py)
   ├── "Metal İskele Hesaplama" → FreeBoardHesaplama.py
   ├── "Beton İskele Hesaplama" → BetonFreeboardHesaplama.py
   ├── "Tork Denge Hesaplama" → DengeHesaplama.py
   └── "Hesaplama Geçmişi" → history_page.py
         ↓
Hesaplama Sayfası
   ├── Form Girişi
   ├── Parametre Seçimi
   ├── Hesaplama
   ├── Sonuç Gösterimi
   └── Otomatik Kayıt
         ↓
SQLite Veritabanına Kayıt → Geri Dön veya Geçmişi Görüntüle
```

---

## 🧩 Modüler Yapı (Module Responsibilities)

| Dosya                        | Görev         | Sorumluluk Alanı                    |
| ---------------------------- | ------------- | ----------------------------------- |
| `main.py`                    | Giriş Noktası | Uygulamayı başlatır                 |
| `start_page.py`              | Ana Menü      | Navigasyon merkezi                  |
| `FreeBoardHesaplama.py`      | Hesaplama     | Metal iskele freeboard analizleri   |
| `BetonFreeboardHesaplama.py` | Hesaplama     | Beton iskele hesaplamaları          |
| `DengeHesaplama.py`          | Hesaplama     | Tork denge analizleri               |
| `history_page.py`            | Görüntüleme   | Hesap geçmişini gösterir            |
| `database_manager.py`        | Veri Katmanı  | Veritabanı yönetimi, CRUD işlemleri |

**Örnek Kullanım**

```Python
from start_page import start_page

start_page()  # Ana sayfa başlatılır
```

---

## 💾 Veritabanı Yapısı ve Akışı

**Tablolar**

- table1 – Beton İskele (18 parametre)

- table2 – Metal İskele (19 parametre)

- table3 – Tork Denge (6 parametre)

**Veri Akışı**

```plaintext
Form Girişi → Hesaplama → Sonuç → Otomatik Kayıt → SQLite DB
                                          ↓
                               get_all_calculations_*() → Geçmiş Sayfası
```

**Kayıt Örneği**

```python
def save_calculation_concrete(calculation: List[Union[float, int, bool]]) -> None:
    with sqlite3.connect("your_database.db") as conn:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO table1 (...) VALUES (?, ?, ..., ?)", calculation[1:])
```

---

## 🧱 Katmanlı Mimari (Modified MVC)

👁️ **View Layer**
- start_page.py – Ana menü

- FreeBoardHesaplama.py – Metal hesaplama arayüzü

- BetonFreeboardHesaplama.py – Beton hesaplama arayüzü

- DengeHesaplama.py – Denge hesaplama arayüzü

- history_page.py – Geçmiş görüntüleme

⚙️ **Controller Layer**
- calculate_*() fonksiyonları – Mühendislik hesaplama algoritmaları

💽 **Model Layer**
- database_manager.py – Tüm veritabanı işlemleri

- Mimari Özellikler
- View & Controller iç içe entegre

- Ortak model sınıfları

- Event-driven yaklaşım (buton tıklama → hesaplama → kayıt)

- Tek sorumluluk prensibi (SRP)

## 📁 Dosya ve Klasör Yapısı

```plaintext
MarineMathDesktop/
│
├── 🚀 CORE APPLICATION
│   ├── main.py
│   ├── start_page.py
│   └── database_manager.py
│
├── 📊 CALCULATION MODULES
│   ├── FreeBoardHesaplama.py
│   ├── BetonFreeboardHesaplama.py
│   └── DengeHesaplama.py
│
├── 📝 DISPLAY MODULES
│   └── history_page.py
│
├── 💾 DATA STORAGE
│   └── your_database.db
│
├── 🎨 DESIGN ASSETS
│   ├── Tasarım/
│   │   ├── Untitled-1.psd
│   │   └── Ana Sayfa.jpg
│   └── pngwing_com_A7S_icon.ico
│
├── 📐 ENGINEERING DOCUMENTS
│   └── Hesaplamalar/
│       ├── Draw1.pdf
│       └── Draw1.SLDDRW
│
└── ⚙️ DEVELOPMENT
    ├── .git/
    ├── __pycache__/
    └── .gitattributes
```
!!! note "Not"
    Bu mimari yapı, modülerlik, sürdürülebilirlik ve bakım kolaylığı ilkelerine uygun olarak geliştirilmiştir. Her bileşen tek sorumluluk taşır ve yeniden kullanılabilir niteliktedir.
