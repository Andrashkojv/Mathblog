using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using Newtonsoft.Json;

namespace AppMathBlog.Examples
{
    public partial class Files : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button0_Click(object sender, EventArgs e)
        {
            if(FileUpload0.HasFile)
            {
                output0.InnerHtml = string.Format("<p>Назва файлу: {0}", FileUpload0.PostedFile.FileName);
                output0.InnerHtml += string.Format("<p>Тип файлу: {0}", FileUpload0.PostedFile.ContentType);
                output0.InnerHtml += string.Format("<p>Розмір файлу: {0} Byte", FileUpload0.PostedFile.ContentLength);
            }
            else
            {
                output0.InnerText = "Файл не вибрано";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                using (StreamReader sr = new StreamReader(FileUpload1.PostedFile.InputStream))
                {
                    var line = sr.ReadLine();
                    var array = line.Split(' ');
                    if (array.Length > 0)
                    {                      
                        Table1.Rows.Add(new TableRow());
                        foreach (var value in array)
                        {
                            var cell = new TableCell();                            
                            cell.Text = value;
                            Table1.Rows[0].Cells.Add(cell);
                        }
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                using (StreamReader sr = new StreamReader(FileUpload2.PostedFile.InputStream))
                {
                    var n = Convert.ToInt32(sr.ReadLine());
                    var m = Convert.ToInt32(sr.ReadLine());
                    for (int i = 0; i < n; i++)
                    {
                        Table2.Rows.Add(new TableRow());
                        var row = sr.ReadLine().Split(' ');
                        for (int j = 0; j < m; j++)
                        {
                            var cell = new TableCell();
                            cell.Text = row[j];
                            Table2.Rows[i].Cells.Add(cell);
                        }
                    }                   
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if(FileUpload3.HasFile)
            {                
                var document = new XmlDocument();
                document.Load(FileUpload3.PostedFile.InputStream);
                foreach(XmlElement item in document.DocumentElement.GetElementsByTagName("item"))
                {
                    var row = new TableRow();
                    var cell1 = new TableCell(); cell1.Text = item.GetAttribute("id"); row.Cells.Add(cell1);
                    var cell2 = new TableCell(); cell2.Text = item.GetElementsByTagName("model")[0].InnerText; row.Cells.Add(cell2);
                    var cell3 = new TableCell(); cell3.Text = item.GetElementsByTagName("price")[0].InnerText; row.Cells.Add(cell3);
                    Table3.Rows.Add(row);
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (FileUpload4.HasFile)
            {
                using (StreamReader sr = new StreamReader(FileUpload4.PostedFile.InputStream))
                {
                    var items = JsonConvert.DeserializeObject<dynamic>(sr.ReadToEnd());
                    foreach (var item in items)
                    {
                        var row = new TableRow();
                        var cell1 = new TableCell(); cell1.Text = item.id; row.Cells.Add(cell1);
                        var cell2 = new TableCell(); cell2.Text = item.model; row.Cells.Add(cell2);
                        var cell3 = new TableCell(); cell3.Text = item.price; row.Cells.Add(cell3);
                        Table4.Rows.Add(row);
                    }
                }
            }
        }
    }
}