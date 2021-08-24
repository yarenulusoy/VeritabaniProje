using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace KutuphaneOtomasyon
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            Uyeİslemleri frmUye = new Uyeİslemleri();
            frmUye.Show();
            this.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Kitapİslemleri frmKitap = new Kitapİslemleri();
            frmKitap.Show();
            this.Close();
           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Oduncİslemler frmOdunc = new Oduncİslemler();
            frmOdunc.Show();
            this.Close();
        }
    }
}
