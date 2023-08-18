using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using DemoTemplateMVC.Models;

namespace DemoTemplateMVC.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    //GET .../Home/Index
    public IActionResult Index()
    {
        return View();
    }
    //GET .../Home/Privacy
    public IActionResult Privacy()
    {
        return View();
    }
    //GET .../Home/Error
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
