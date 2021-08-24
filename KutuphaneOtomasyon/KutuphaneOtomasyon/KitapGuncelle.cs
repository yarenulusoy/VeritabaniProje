using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace KutuphaneOtomasyon
{
    public partial class KitapGuncelle : Form
    {
        public KitapGuncelle()
        {
            InitializeComponent();
        }
        public Kitapİslemleri form1;
        NpgsqlConnection connection = new NpgsqlConnection("server=localhost;port=5432; user ID=postgres; password=12345; Database=Kutuphane");
        private string query;
        private int kategori_id, yazar_id, cevirmen_id, yayinevi_id;
        private int kitap_id;
        public  int secilen_id;


        private void KitapGuncelle_Load(object sender, EventArgs e)
        {
            Getir();  
        }

  

        private void cmbYayinevi_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select yayinevi_id from yayinevleri where yayinevi_ad='" + cmbYayinevi.Text + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yayinevi_id = (int)dr["yayinevi_id"];
            }
            connection.Close();
        }

        private void cmbCevir_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select cevirmen_id from cevirmenler where cevirmen_ad='" + cmbCevir.Text + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cevirmen_id = (int)dr["cevirmen_id"];
            }
            connection.Close();
        }

        private void cmbKategori_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select kategori_id from kategoriler where kategori_ad='" + cmbKategori.Text + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                kategori_id = (int)dr["kategori_id"];
            }
            connection.Close();
        }

        private void cmbYazar_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select yazar_id from yazarlar where yazar_ad='" + cmbYazar.Text + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yazar_id = (int)dr["yazar_id"];
            }
            connection.Close();
        }

        private void btnKaydet_Click_1(object sender, EventArgs e)
        {
            Guncelle();
            form1.Getir();
            
            this.Close();
        }

       
        public void Getir()
        {
            connection.Open();
            query = "Select kitap_ad,sayfa_sayisi,adet,basim_yili,yayinevi_id,cevirmen_id from kitaplar where kitap_id="+secilen_id+"";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                txtAd.Text=dr["kitap_ad"].ToString();
                txtSayfa.Text= dr["sayfa_sayisi"].ToString();
                numericUpAdet.Value= (int)dr["adet"];
                txtBasim.Text = dr["basim_yili"].ToString();
                yayinevi_id = (int)dr["yayinevi_id"];
                cevirmen_id = (int)dr["cevirmen_id"];

            }
            connection.Close();
            connection.Open();
            query = "Select yayinevi_ad from yayinevleri";
            NpgsqlCommand cmd2 = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr2 = cmd2.ExecuteReader();

            while (dr2.Read())
            {
                cmbYayinevi.Items.Add(dr2["yayinevi_ad"]);
            }
            dr2.Close();
            connection.Close();
        

            connection.Open();
            string query4 = "Select kategori_ad from kategoriler";
            NpgsqlCommand cmd4 = new NpgsqlCommand(query4, connection);
            NpgsqlDataReader dr4 = cmd4.ExecuteReader();
            while (dr4.Read())
            {
                cmbKategori.Items.Add(dr4["kategori_ad"]);
            }
            dr4.Close();
            connection.Close();
     
            connection.Open();
            string query6 = "Select cevirmen_ad from cevirmenler";
            NpgsqlCommand cmd6 = new NpgsqlCommand(query6, connection);
            NpgsqlDataReader dr6 = cmd6.ExecuteReader();
            while (dr6.Read())
            {
                cmbCevir.Items.Add(dr6["cevirmen_ad"]);

            }
            dr6.Close();
            connection.Close();
     
            connection.Open();
            string query8 = "Select yazar_ad from yazarlar";
            NpgsqlCommand cmd8 = new NpgsqlCommand(query8, connection);
            NpgsqlDataReader dr8 = cmd8.ExecuteReader();
            while (dr8.Read())
            {
                cmbYazar.Items.Add(dr8["yazar_ad"]);
            }
            dr8.Close();
            connection.Close();
   
        
        }
        private void Guncelle()
        {
            try
            {

                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                query = "update kitaplar set kitap_ad=@p1,sayfa_sayisi=@p2,adet=@p3,basim_yili=@p4,yayinevi_id=@p5,cevirmen_id=@p6 where kitap_id="+secilen_id+"";
                NpgsqlCommand cmd = new NpgsqlCommand(query, connection);

                cmd.Parameters.AddWithValue("@p1", txtAd.Text);
                cmd.Parameters.AddWithValue("@p2", int.Parse(txtSayfa.Text));
                cmd.Parameters.AddWithValue("@p3", int.Parse(numericUpAdet.Text));
                cmd.Parameters.AddWithValue("@p4", int.Parse(txtBasim.Text));
                cmd.Parameters.AddWithValue("@p5", yayinevi_id);
                cmd.Parameters.AddWithValue("@p6", cevirmen_id);

                cmd.ExecuteNonQuery();

                connection.Close();
                MessageBox.Show("Kayıt İşlemi Gerçekleşti...");
             
            }
            catch (Exception hata)
            {
                MessageBox.Show("İşlem Sırasında Hata Oluştu." + hata.Message);
            }

            connection.Open();
            string query2 = "update kitap_kategori set kategori_id=@p1 where kitap_id="+secilen_id+"";
            NpgsqlCommand cmd2 = new NpgsqlCommand(query2, connection);
            cmd2.Parameters.AddWithValue("@p1", kategori_id);
            cmd2.ExecuteNonQuery();
            connection.Close();

            connection.Open();
            string query3 = "update kitap_yazar set yazar_id=@p1 where kitap_id="+secilen_id+"";
            NpgsqlCommand cmd3 = new NpgsqlCommand(query3, connection);
            cmd3.Parameters.AddWithValue("@p1", yazar_id);
            cmd3.ExecuteNonQuery();
            connection.Close();

        }
    }
}
