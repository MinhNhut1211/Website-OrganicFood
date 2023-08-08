using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebOrganicFood.Models;

namespace WebOrganicFood.Controllers
{
    public class DonHangController : Controller
    {
        OrganicEntities db= new OrganicEntities();
        // GET: DonHang
        public ActionResult Index()
        {
            if (Session["use"] == null || Session["use"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }
            NguoiDung kh = (NguoiDung)Session["use"];
            int maND = kh.MaNguoiDung;
            var donhangs = db.DonHangs.Include(d => d.NguoiDung).Where(d => d.MaNguoiDung == maND);
            return View(donhangs.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donhang = db.DonHangs.Find(id);
            var chitiet = db.ChiTietDonHangs.Where(d => d.MaDonHang == id).ToList();
            if (donhang == null)
            {
                return HttpNotFound();
            }
            return View(chitiet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}