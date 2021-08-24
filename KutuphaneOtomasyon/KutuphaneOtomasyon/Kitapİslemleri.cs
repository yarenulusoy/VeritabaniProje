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
    public partial class Kitapİslemleri : Form
    {
        public Kitapİslemleri()
        {
            InitializeComponent();
        }
       
        public static int secilen_id;
        public static string query;

        NpgsqlConnection connection = new NpgsqlConnection("server=localhost;port=5432; user ID=postgres; password=12345; Database=Kutuphane");


        private void kitapEkle_Click(object sender, EventArgs e)
        {
            //panel1.Controls.Clear(); // Panel'in içini temizliyoruz
            KitapEkle frmKitapEkle = new KitapEkle();

            //frmKitapEkle.TopLevel = false;
            //panel1.Controls.Add(frmKitapEkle); // panel1 içerisinde formu ekledik
            frmKitapEkle.form1 = this;
            frmKitapEkle.Show(); // formu gösterdik. 
          
            //frmKitapEkle.Dock = DockStyle.Fill; // Açılan formun paneli doldurmasını sağladık.
            //frmKitapEkle.BringToFront(); // formu panel içinde en öne getirdik
        }

        private void btnGeri_Click(object sender, EventArgs e)
        {
            Menu menu = new Menu();
            menu.Show();
            this.Close();
      

        }

        private void Kitapİslemleri_Load(object sender, EventArgs e)
        {
            Getir();
        }

     
        private void button2_Click(object sender, EventArgs e)
        {

            connection.Open();
            query = "delete from kitaplar where kitap_id=@p1";
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@p1", int.Parse(dataGridView1.CurrentRow.Cells[0].Value.ToString()));
            cmd.ExecuteNonQuery();
            connection.Close();

            if (dataGridView1.SelectedRows.Count > 0)
            {
                dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index); //data grid viewden seçilen satırı sil
            }

            else
            {
                MessageBox.Show("Lüffen silinecek satırı seçin."); //seçilen satır yoksa
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            connection.Open();
            query = "select * from kitaplar where  kitap_ad like '%" + txtAra.Text + "%'";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(query, connection);
            DataTable tablo = new DataTable();
            da.Fill(tablo);
            dataGridView1.DataSource = tablo;
            connection.Close();
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            secilen_id = Convert.ToInt32(dataGridView1.CurrentRow.Cells["kitap_id"].Value.ToString());

            KitapGuncelle frmGnc = new KitapGuncelle();
       
            frmGnc.txtId.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            frmGnc.txtAd.Text=dataGridView1.CurrentRow.Cells[1].Value.ToString();
            frmGnc.cmbYazar.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString(); 
            frmGnc.cmbKategori.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            frmGnc.cmbYayinevi.Text= dataGridView1.CurrentRow.Cells[4].Value.ToString();  
            frmGnc.cmbCevir.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            frmGnc.txtSayfa.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            frmGnc.numericUpAdet.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
            frmGnc.txtBasim.Text = dataGridView1.CurrentRow.Cells[8].Value.ToString();
            frmGnc.secilen_id = secilen_id;
            frmGnc.form1 = this;
            frmGnc.Show();

        }

        public void Getir()
        {
            connection.Open();
            query = "select kitaplar.kitap_id,kitaplar.kitap_ad,yazarlar.yazar_ad,kategoriler.kategori_ad,yayinevleri.yayinevi_ad,cevirmenler.cevirmen_ad,kitaplar.sayfa_sayisi,kitaplar.adet,kitaplar.basim_yili from yazarlar,kitaplar,kategoriler,kitap_kategori,yayinevleri,cevirmenler,kitap_yazar where kitaplar.kitap_id=kitap_yazar.kitap_id and yazarlar.yazar_id=kitap_yazar.yazar_id and kitap_kategori.kitap_id=kitaplar.kitap_id and kategoriler.kategori_id=kitap_kategori.kategori_id and kitaplar.cevirmen_id=cevirmenler.cevirmen_id and kitaplar.yayinevi_id=yayinevleri.yayinevi_id";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(query, connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            connection.Close();
        }

        private void txtAra_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
