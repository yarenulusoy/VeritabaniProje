

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
    public partial class KitapEkle : Form
    {
        public KitapEkle()
        {
            InitializeComponent();
        }
        NpgsqlConnection connection = new NpgsqlConnection("server=localhost;port=5432; user ID=postgres; password=12345; Database=Kutuphane");
        private string query;
        private int kategori_id,yazar_id,cevirmen_id,yayinevi_id;
        private int kitap_id;
        public Kitapİslemleri form1;


        private void btnKaydet_Click(object sender, EventArgs e)
        {
            Ekle();
            form1.Getir();
            this.Close();
        }

        private void Ekle()
        {
            try
            {

                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                query = "insert into kitaplar(kitap_ad,sayfa_sayisi,adet,basim_yili,yayinevi_id,cevirmen_id) values (@p1,@p2,@p3,@p4,@p5,@p6) RETURNING kitap_id";
                NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
          
                cmd.Parameters.AddWithValue("@p1", txtKitapAd.Text);
                cmd.Parameters.AddWithValue("@p2", int.Parse(txtSayfa.Text));
                cmd.Parameters.AddWithValue("@p3", int.Parse(numericUpAdet.Text));
                cmd.Parameters.AddWithValue("@p4", int.Parse(txtBasim.Text));
                cmd.Parameters.AddWithValue("@p5", yayinevi_id);
                cmd.Parameters.AddWithValue("@p6", cevirmen_id);
              
              

                NpgsqlDataReader dr = cmd.ExecuteReader();
                
                while (dr.Read())
                {
                    kitap_id = (int)dr["kitap_id"];

                }
                connection.Close();

                MessageBox.Show("Kayıt İşlemi Gerçekleşti...");
              
               
            }
            catch (Exception hata)
            {
                MessageBox.Show("İşlem Sırasında Hata Oluştu." + hata.Message);
            }


            connection.Open();
            string query2 = "insert into kitap_kategori(kitap_id,kategori_id) values (@p1,@p2)";
            NpgsqlCommand cmd2 = new NpgsqlCommand(query2, connection);
            cmd2.Parameters.AddWithValue("@p1", kitap_id);
            cmd2.Parameters.AddWithValue("@p2", kategori_id);
            NpgsqlDataReader dr2 = cmd2.ExecuteReader();
            connection.Close();

            connection.Open();
            string query3 = "insert into kitap_yazar(kitap_id,yazar_id) values (@p1,@p2)";
            NpgsqlCommand cmd3 = new NpgsqlCommand(query3, connection);
            cmd3.Parameters.AddWithValue("@p1", kitap_id);
            cmd3.Parameters.AddWithValue("@p2", yazar_id);
            NpgsqlDataReader dr3 = cmd3.ExecuteReader();
            connection.Close();

        }


        private void KitapEkle_Load(object sender, EventArgs e)
        {
            Getir();


        }
        public void Getir()
        {
            connection.Open();
            query = "Select yayinevi_ad from yayinevleri";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cmbYayinevi.Items.Add(dr["yayinevi_ad"]); 
            }

            connection.Close();

            connection.Open();
            string query2 = "Select kategori_ad from kategoriler";
            NpgsqlCommand cmd2 = new NpgsqlCommand(query2, connection);
            NpgsqlDataReader dr2 = cmd2.ExecuteReader();
            while (dr2.Read())
            {
                cmbKategori.Items.Add(dr2["kategori_ad"]); 
            }
            connection.Close();

      
            connection.Open();
            string query4 = "Select cevirmen_ad from cevirmenler";
            NpgsqlCommand cmd4 = new NpgsqlCommand(query4, connection);
            NpgsqlDataReader dr4 = cmd4.ExecuteReader();
            while (dr4.Read())
            {
                cmbCevir.Items.Add(dr4["cevirmen_ad"]); 

            }
            connection.Close();

            connection.Open();
            string query5 = "Select yazar_ad from yazarlar";
            NpgsqlCommand cmd5 = new NpgsqlCommand(query5, connection);
            NpgsqlDataReader dr5 = cmd5.ExecuteReader();
            while (dr5.Read())
            {
                cmbYazar.Items.Add(dr5["yazar_ad"]);

            }
            connection.Close();
        }

    
        private void cmbDil_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblCevirmenId.Text = cmbDil.SelectedItem.ToString();
        }

        private void cmbCevir_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            connection.Open();
            query = "Select cevirmen_id from cevirmenler where cevirmen_ad='"+cmbCevir.SelectedItem.ToString()+ "'"; 
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cevirmen_id = (int)dr["cevirmen_id"];
            }
            connection.Close();
           
        }
        private void cmbYayinevi_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select yayinevi_id from yayinevleri where yayinevi_ad='" + cmbYayinevi.SelectedItem.ToString() + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yayinevi_id = (int)dr["yayinevi_id"];
            }
            connection.Close();


        }

        private void cmbKategori_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select kategori_id from kategoriler where kategori_ad='" + cmbKategori.SelectedItem.ToString() + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                kategori_id= (int)dr["kategori_id"];
      
            }
            connection.Close();
        }

        private void cmbYazar_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            query = "Select yazar_id from yazarlar where yazar_ad='" + cmbYazar.SelectedItem.ToString() + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yazar_id = (int)dr["yazar_id"];
            }
            connection.Close();
        }
    }
}
