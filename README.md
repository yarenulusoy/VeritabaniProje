# VeritabaniProje

İŞ KURALLARI

Her personelin bir kullanıcı adı ve şifresi vardır. \
Her üyenin kimlik numarası adı soyadı mevcuttur. \
Her kitabın adı, yazarı, sayfa sayısı, kategorisi, yayınevi mevcuttur. \
Bir üye hiçbir kitap almayacağı gibi birden fazla kitap da alabilir. \
Bir kitap hiçbir üye tarafından alınmayabilir. \
Bir kitap birden fazla üye tarafından ödünç alınabilir. \
Bir yazarın birden fazla kitabı olabilir. \
Bir kitabın birden fazla yazarı olabilir. \
Üye istediği kütüphaneden kitap alabilir. \
Bir çevirmen birden fazla kitap çevirebilir. \
Bir kitap birden fazla çevirmene sahip olabilir. \
Bir kitabın bir kategorisi olabilir. \
Bir kategoriye ait birden çok kitap olabilir. \
Bir kütüphane bir ilçeye ait olabilir. \
Bir ilçeye ait birden fazla kütüphane olabilir. \
Bir ile ait birden çok ilçe olabilir. \
Bir ilçenin bir ili vardır. \
Bir ilçeye sahip birden çok üye olabilir. \
Bir üye bir ilçeye sahip olabilir. 

İLİŞKİSEL ŞEMA

Kutuphane{KutuphaneId:int, KutuphaneAd:nvarchar(100), IlceId:int} \
KitaplarKutuphane{KitapId:int, KutuphaneId:int, Adet;int} \
Yazarlar{YazarId:int, YazarAd:nvarchar(100)} \
KitapYazar{KitapId:int, YazarId:int} \
Kitaplar{KitapId:int, KitapAd:nvarchar(100), SayfaSayisi:int, Adet:int, BasimYili:int, YayineviId:int} \
Kategoriler{KategoriId:int, KategoriAd:nvarchar(100)} \
KitapKategori{KitapId:int, KategoriId:int} \
Yayinevleri{YayineviId:int, YayineviAd:nvarchar(100), IlceAd:nvarchar(100)} \
Cevirmenler{CevirmenId:int, CevirmenAd:nvarchar(100), KitapId:int} \
Iller{IlId:int, IlAd:nvarchar(100)} \
Ilceler{IlceId:int, IlceAd:nvarchar(100), IlId:int} \
OduncIslem{IslemId:int, UyeId:int, KitapId:int, AlinanTarih:datetime } \
Kisiler{KisiId:int, KisiAd:nvarchar(100), Telefon:char(11)} \
Uyeler{KisiId:int, Tc(char(11), IlceId:int} \
Personeller{KisiId:int,KullaniciAd:nvarchar(100), Sifre:nvarchar(100)} 


<img
  src="/images/1.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto;  width: 500px">
  
  
  <img
  src="/images/2.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto;  width: 500px">
  
  
  <img
  src="/images/3.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto;  width: 500px">
  
  
