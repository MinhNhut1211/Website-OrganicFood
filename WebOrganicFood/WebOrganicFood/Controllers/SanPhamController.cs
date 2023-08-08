using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebOrganicFood.Models;
using PagedList;

namespace WebOrganicFood.Controllers
{
    public class SanPhamController : Controller
    {
        OrganicEntities db = new OrganicEntities();
        // GET: SanPham
        public ActionResult SanPhamPartial()
        {
           
            var listSP = db.SanPhams.Take(12).ToList();
            return View(listSP);
        }

        public ActionResult xemChiTiet(int masp = 0)
        {
            var chiTiet = db.SanPhams.SingleOrDefault(n => n.MaSanPham == masp);
            if (chiTiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chiTiet);
        }

        public ActionResult SanPhamTheoLoai(int IDLoai = 0)
        {
            List<SanPham> sp= db.SanPhams.Where(n=>n.IDLoai == IDLoai).ToList();
            if(sp.Count==0)
            {
                ViewBag.IDLoai = "Không có sản phẩm thuộc loại này";
            }
            return View(sp);
        }

        public ActionResult SanPhamPartialFull()
        {
            var listSP = db.SanPhams.ToList();
            return View(listSP);
        }

        public ActionResult Index(string searching)
        {
            var lstSP = db.SanPhams.Where(n => n.TenSanPham.Contains(searching)).ToList();
            return View(lstSP);
        }


    }
}