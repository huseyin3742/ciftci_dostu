# Çiftçi Dostu - Hava Durumuna Göre Tarımsal Öneri Uygulaması 🌾🌤️

**Çiftçi Dostu**, hava durumu verilerini analiz ederek çiftçilere özel öneriler sunan bir uygulamadır. Uygulama sayesinde çiftçiler; sulama, ilaçlama ve ekim gibi işlemleri doğru zamanlarda yaparak verimliliği artırabilir ve kaynak israfını önleyebilir.

## 🚀 Özellikler

- 🌤️ **Gerçek Zamanlı Hava Durumu**: OpenWeatherMap API ile güncel hava durumu bilgileri alınır.
- 🧠 **Yapay Zeka Destekli Öneriler**: Hava durumuna göre uygun tarımsal faaliyetler önerilir (sulama, ilaçlama, ekim vs.).
- 📲 **Kullanıcı Dostu Arayüz**: Basit, sade ve çiftçilerin kolayca kullanabileceği bir mobil arayüz.
- 🔔 **Uyarı Sistemi**: Ani hava değişikliklerine karşı uyarılar gösterilir.
- 📍 **Konum Bazlı Hizmet**: Bulunduğunuz konuma göre öneriler sunar.

## 🛠️ Kullanılan Teknolojiler

- **Flutter / Dart** - Mobil uygulama geliştirme
- **OpenWeatherMap API** - Hava durumu verileri için
- **Python (FastAPI / TensorFlow / Scikit-learn)** - Yapay zeka öneri motoru ve API servisi

## 🔍 Nasıl Çalışır?

1. Kullanıcı, uygulamayı açarak konumunu seçer.
2. Sistem, OpenWeatherMap API üzerinden güncel hava durumu verilerini çeker.
3. Yapay zeka modeli, bu verileri analiz ederek öneri motorunu çalıştırır.
4. Elde edilen öneriler kullanıcıya anlaşılır şekilde sunulur (örneğin: "Bugün rüzgar az, ilaçlama yapabilirsiniz").

## 🧪 Kurulum ve Başlatma

```bash
git clone https://github.com/kullaniciadi/ciftci-dostu.git
cd ciftci-dostu
flutter pub get
flutter run
