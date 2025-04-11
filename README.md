# 🌱 Çiftçi Dostu - Hava Durumuna Göre Tarımsal Öneri Uygulaması

**Çiftçi Dostu**, çiftçilere özel geliştirilmiş Flutter tabanlı bir mobil uygulamadır. Uygulama, güncel hava durumu verilerini analiz ederek sulama, ilaçlama ve don riski gibi önemli konularda çiftçiye öneriler sunar. Hedef, tarımda verimliliği artırmak ve doğal kaynak kullanımını optimize etmektir.

---

## 📱 Özellikler

- ☁️ OpenWeatherMap API'den alınan **hava durumu verileri**
- 📍 Kullanıcıdan alınan şehir bilgisine göre veri sorgulama
- 🌾 Tarım faaliyetleri için **otomatik öneri sistemi**:
  - Yağmur varsa ilaçlama yapma
  - Don riski varsa uyarı
  - Yüksek sıcaklıklarda sulama zamanı önerisi
- 🎨 Şık ve sade arayüz (arkaplan görselli)
- 📷 Hava durumu ikonları ve animasyonlu bilgi kartları

---

## 🧠 Öneri Sistemi Nasıl Çalışır?

Uygulama, sıcaklık ve hava durumu koşullarını değerlendirerek öneri sunar:

| Koşul               | Öneri                                       | Renk      | İkon  |
|---------------------|----------------------------------------------|-----------|--------|
| Yağmur              | İlaçlama yapmayın.                          | Mavi      | 🌧️     |
| Kar / Soğuk (<5°C)  | Don riski olabilir!                         | Kırmızı   | ❄️     |
| Sıcak (>30°C)       | Sulamayı sabah erken yapın.                | Turuncu   | 🔥     |
| Normal hava         | Tarım faaliyetlerine devam edebilirsiniz.  | Yeşil     | 🌤️     |

---

## 🧰 Kullanılan Teknolojiler

- **Flutter** (Mobil uygulama geliştirme)
- **Dart** (Flutter dil altyapısı)
- **HTTP Paketi** (`http: ^0.13.5`)
- **OpenWeatherMap API** (Gerçek zamanlı hava verisi)
- **Material Design** öğeleri
- **Asset image** (Tarla görseli arka plan olarak kullanıldı)

---

## 📂 Proje Yapısı

```bash
/lib
  └── main.dart                # Ana uygulama dosyası (arayüz ve mantık)
/services
  └── weather_service.dart     # Hava durumu verisi API bağlantısı
/assets/images
  └── yesil_tarla.jpg          # Uygulama arka plan görseli
/pubspec.yaml                  # Bağımlılıklar ve varlıklar
