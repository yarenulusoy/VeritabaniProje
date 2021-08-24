using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;
namespace KutuphaneOtomasyon
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private string query;
        NpgsqlConnection connection= new NpgsqlConnection("server=localhost;port=5432; user ID=postgres; password=12345; Database=Kutuphane");
      
        private void button1_Click(object sender, EventArgs e)

        {
          
            query = "select *from personeller where kullanici_adi= '" + txtKullaniciAdi.Text + "' and sifre='" + txtSifre.Text + "'";
            connection.Open();
            NpgsqlCommand cmd = new NpgsqlCommand(query, connection);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read()) //verilerimiz sorgudaki şartları sağlıyorsa menu ye geçiş yapar
            {
                Menu menu = new Menu();
                menu.Show();
                this.Hide();

            }
            else //şartları sağlamıyorsa programımız uyarı verir
            {
                MessageBox.Show("HATALI GİRİŞ");
            }
            fnc_Clear();// textbox temizleme fonksiyonu
            connection.Close(); //baglantı kapatılır

        }

        #region clear
        private void fnc_Clear()
        {
            foreach (Control obje in this.Controls)  //tüm texboxların sayısı kadar temizle
            {
                if (obje is TextBox)
                {
                    TextBox textbox = (TextBox)obje;
                    textbox.Clear();
                }
            }
        }
        #endregion
    }
}
