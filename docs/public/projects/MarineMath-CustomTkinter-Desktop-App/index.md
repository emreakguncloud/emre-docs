# MarineMath Desktop

## 🧭 Proje Tanımı

MarineMath Desktop, **FCP Marine** şirketinin üretim öncesi mühendislik süreçlerini desteklemek üzere geliştirilmiş Python tabanlı bir masaüstü uygulamadır. Proje, sahada yapılan fabrika ziyaretlerinde tespit edilen bir ihtiyaca doğrudan çözüm olarak doğmuştur: Yüzer yapıların üretilmeden önce **su üstü fiziksel özellikleri**, **mühendislik dengeleri** ve **malzeme ihtiyaçları** gibi kritik veriler, hızlı ve güvenilir şekilde hesaplanabilmektedir.

## 🔧 Özellikler

- **Yüzer beton iskele hesaplama modülü**
- **Yüzer çelik iskele hesaplama modülü**
- **Tork/Denge analiz modülü (tek eksenli)**
- **Hesap geçmişi görüntüleme ve kaydetme**
- **Malzeme listesi otomatik çıkarımı**

## 🛠️ Teknolojik Altyapı

### Ana Platform
- Python 3.x
- `CustomTkinter` – modern görünümlü GUI
- Cross-platform destek (Windows, macOS, Linux)

### Arayüz ve Medya
- `CustomTkinter` – kullanıcı dostu modern UI
- `PIL` – görsel işleme desteği
- `.psd`, `.SLDDRW` ve PDF medya entegrasyonu

### Veri Yönetimi
- `sqlite3` – dosya tabanlı veritabanı
- Tip güvenliği için `type hints`
- Veritabanı yapısı:
  - `table1`: Beton iskele hesapları
  - `table2`: Metal iskele hesapları
  - `table3`: Tork denge hesapları

### Hesaplama Motoru
- `FreeBoardHesaplama.py`: Metal iskele hesapları
- `BetonFreeboardHesaplama.py`: Beton iskele hesapları
- `DengeHesaplama.py`: Denge analizleri
- CRUD destekli hesap geçmişi sistemi

### Paketleme
- `PyInstaller` desteği ile tek dosya `.exe`
- `sys.MEIPASS` ile dinamik path kontrolü
- Üretim & geliştirme ortamlarına uygun yapı

## 👥 Hedef Kitle

MarineMath Desktop, **firma içi mühendislik ekipleri** için geliştirilmiştir. Saha mühendisleri ve tasarım ekipleri, üretim öncesi hızlı değerlendirme yapabilmekte; hesap sonuçlarına göre malzeme planlaması ve fizibilite çalışmaları yürütebilmektedir.

## 🎯 Projenin Amacı

Bu proje, hem kuruma stratejik bir katkı sağlamak hem de kurumsal hesaplamaları dijitalleştirmek amacıyla bireysel inisiyatifle başlatılmıştır. Geliştiricinin proje üretme motivasyonuyla ortaya çıkan bu uygulama, manuel hesaplama süreçlerine modern bir çözüm sunmuştur.

## 🔄 Sürüm Durumu

MarineMath Desktop, günümüzde yerini React tabanlı web sürümüne bırakmıştır. Ancak masaüstü sürüm, **tüm algoritmaların ilk yazıldığı ve doğrulandığı mihenk taşı** olmuştur. Geliştirilen hesaplama mantıkları, bugünkü web uygulamasının temelini oluşturmuştur.

---

