# 💾 MarineMathDesktop - Veritabanı Mimarisi

## 🗃️ **1. Veritabanı Dosyası**

**Dosya Adı:** `your_database.db`
- **Format**: SQLite3 (.db uzantılı)
- **Konum**: Uygulama ana dizini

```python
with sqlite3.connect("your_database.db") as conn:
```

## 📊 **2. Tablo Sayısı ve İsimleri**

**Toplam 3 Tablo:**

| **Tablo Adı** | **Hesaplama Türü** | **Sütun Sayısı** |
|---------------|---------------------|-------------------|
| `table1` | Beton İskele Hesaplamaları | 19 sütun |
| `table2` | Metal İskele Hesaplamaları | 20 sütun |
| `table3` | Tork Denge Hesaplamaları | 7 sütun |

## 🏗️ **3. Tablo Yapıları**

### **📋 Table1 (Beton İskele) - 19 Sütun**

```sql
CREATE TABLE IF NOT EXISTS table1 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    length REAL,
    height REAL,
    width REAL,
    eps_length REAL,
    eps_width REAL,
    eps_height REAL,
    is_colon INTEGER,
    is_bottom_closed INTEGER,
    colon_count INTEGER,
    vertical_colon INTEGER,
    vertical_colon_count INTEGER,
    plus_weight REAL,
    total_weight REAL,
    freeboard REAL,
    bend_bar_weight REAL,
    straight_bars_weight REAL,
    concrete_volume REAL,
    wicker_area REAL
)
```

**Örnek Sütunlar:**
- `length REAL` - İskele uzunluğu (metre)
- `is_colon INTEGER` - Kolon varlığı (Boolean → 0/1)
- `total_weight REAL` - Toplam ağırlık (kg)
- `freeboard REAL` - Freeboard mesafesi (metre)

### **⚙️ Table2 (Metal İskele) - 20 Sütun**

```sql
CREATE TABLE IF NOT EXISTS table2 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    iskele_uzunluk REAL,
    iskele_genislik REAL,
    iskele_yukseklik REAL,
    steel_profile_length REAL,
    steel_profile_length_2 REAL,
    sandik_sayisi INTEGER,
    sandik_uzunluk REAL,
    sandik_genislik REAL,
    sandik_yukseklik REAL,
    ek_agirlik REAL,
    profil_secimi TEXT,
    profil_secimi_2 TEXT,
    u_profil_secimi TEXT,
    sac_levha_secimi TEXT,
    freeboard REAL,
    weight REAL,
    deck_count INTEGER,
    npu_length REAL,
    sac_m2 REAL
)
```

**Örnek Sütunlar:**
- `profil_secimi TEXT` - Çelik profil seçimi (örn: "30x50x2.00 mm")
- `sandik_sayisi INTEGER` - Sandık adedi
- `ek_agirlik REAL` - Ek ağırlık (kg)
- `sac_m2 REAL` - Sac levha alanı (m²)

### **⚖️ Table3 (Tork Denge) - 7 Sütun**

```sql
CREATE TABLE IF NOT EXISTS table3 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    left_weights REAL,
    left_distances REAL,
    right_weights REAL,
    right_distances REAL,
    unknown_distance REAL,
    unknown_weight REAL
)
```

**Örnek Sütunlar:**
- `left_weights REAL` - Sol ağırlıklar (CSV format: "100,200,150")
- `right_distances REAL` - Sağ mesafeler (CSV format: "1.5,3.5")
- `unknown_weight REAL` - Bilinmeyen ağırlık (kg)
- `unknown_distance REAL` - Bilinmeyen mesafe (metre)

## 🔢 **4. Veri Tipleri ve Formatlar**

| **SQLite Tipi** | **Python Karşılığı** | **Kullanım Alanı** | **Örnek Değer** |
|-----------------|----------------------|---------------------|------------------|
| `INTEGER` | `int` | ID, sayılar, boolean | `1`, `5`, `0/1` |
| `REAL` | `float` | Ölçüler, ağırlıklar | `5.25`, `1247.83` |
| `TEXT` | `str` | Profil seçimleri, CSV | `"NPU 100"`, `"100,200"` |

**Boolean Handling:**
```python
# Boolean değerler INTEGER olarak saklanır
is_colon INTEGER,           # 0 = False, 1 = True
is_bottom_closed INTEGER,   # 0 = False, 1 = True
vertical_colon INTEGER,     # 0 = False, 1 = True
```

**CSV Format (Table3):**
```python
# Liste verileri virgülle ayrılmış string olarak saklanır
data = (
    ','.join(map(str, balance_data[1])),  # "100,200,150"
    ','.join(map(str, balance_data[2])),  # "2,3,4"
    # ...
)
```

## 💾 **5. Kayıt Yöntemi**

**Otomatik Kayıt Sistemi:**

- ✅ **Hesaplama sonrası anında kayıt**

- ✅ **Her hesap modülünde `create_tables()` çağrılır**

- ✅ **Birincil anahtar**: AUTO_INCREMENT ID (her tabloda)

- ❌ **Manuel kayıt butonu YOK**

**Kayıt Akışı:**
```python
def hesaplamafonk():
    # 1. Hesaplama yap
    freeboard, weight = calculate_freeboard(...)
    
    # 2. Tabloları oluştur (ilk çalışma için)
    create_tables()
    
    # 3. Anında kaydet
    save_calculation_metal([None, uzunluk, genislik, ...])
```

**Primary Key Yapısı:**
```sql
id INTEGER PRIMARY KEY AUTOINCREMENT
```
- Her tabloda benzersiz ID
- Otomatik artan
- Geçmiş sayfasında referans için kullanılır

## 🔄 **6. CRUD Desteği**

| **İşlem** | **Durum** | **Fonksiyon** | **Kullanım Yeri** |
|-----------|-----------|---------------|-------------------|
| **CREATE** | ✅ Tam | `save_calculation_*()` | Her hesaplama sonrası |
| **READ** | ✅ Tam | `get_all_calculations_*()` | Geçmiş sayfası |
| **UPDATE** | ❌ Yok | - | Desteklenmiyor |
| **DELETE** | ✅ Kısmi | `confirm_and_delete()` | Geçmiş sayfasında |

**Read Operasyonları:**
```python
# Tüm kayıtları çek
get_all_calculations_concrete() -> List[Tuple]
get_all_calculations_metal() -> List[Tuple]
get_all_calculations_balance() -> List[Tuple]

# ID ile tekil kayıt
get_calculation_by_id(calc_id: int, table_name: str) -> Optional[Tuple]
```

**Delete Operasyonu:**
```python
def confirm_and_delete(table_name):
    # MessageBox ile onay al
    # SQL DELETE çalıştır
    # Listeyi yenile
```

**UPDATE İşlemi:**
- ❌ **Desteklenmiyor**
- ❌ **Düzenleme özelliği yok**
- ✅ **Read-only detail view** (salt okunur detay görünümü)

## 🚀 **7. Veritabanı Başlatma**

**Schema Oluşturma:**
- ✅ **Runtime'da oluşturulur** (önceden değil)
- ✅ **Her modül çağrısında `create_tables()`**
- ✅ **`CREATE TABLE IF NOT EXISTS`** pattern'i kullanır
- ✅ **İlk çalıştırmada otomatik setup**

**Başlatma Noktaları:**
```python
# Her hesaplama modülünde
create_tables()  # Tabloları kontrol et/oluştur
save_calculation_*()  # Veriyi kaydet

# Geçmiş sayfasında
create_tables()  # Sayfa açılışında
```

**Timing:**

1. **Uygulama başlatıldığında**: Veritabanı yoksa oluşturulur

2. **Her hesaplama öncesi**: `create_tables()` çağrısı

3. **Her modül geçişinde**: Tablo varlığı garantisi

**Error Handling:**
```python
try:
    cursor.execute("INSERT INTO...", calculation[1:])
except sqlite3.Error as e:
    print(f"Error saving calculation: {e}")
```

**Dosya Yönetimi:**

- ✅ **Context manager**: `with sqlite3.connect()`

- ✅ **Otomatik connection close**

- ✅ **Thread-safe** operasyonlar

- ✅ **Minimal locking** (SQLite default)

!!! note "Not"
    Bu veritabanı mimarisi **basitlik**, **güvenilirlik** ve **performans** dengesi kurarak uygulamanın veri ihtiyaçlarını etkin şekilde karşılar.

