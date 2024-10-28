//using ICMA_LEARNFRONTEND.DTO;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.RazorPages;
//using Newtonsoft.Json;
//using System.Net.Http.Headers;
//using System.Text;
//using System.Text.Json;

//namespace ICMA_LEARNFRONTEND.Pages
//{
//    public class EditCourseModel : PageModel
//    {
//        public IConfiguration _configuration;
//        private readonly IHttpClientFactory _httpClientFactory;

//        public EditCourseModel(IConfiguration config, IHttpClientFactory httpClientFactory)
//        {

//            _configuration = config;
//            _httpClientFactory = httpClientFactory;
//        }

//        public string Message { get; set; }

//        [BindProperty]
//        public EditCourse course { get; set; } = new();




//        public async Task<IActionResult> OnGetAsync(long id)
//        {

//            Message = TempData["Message"] as string;

//            course = GetCoursebyId(id);

//            return Page();
//        }



//        //        protected EditCourse GetCoursebyId(long id)
//        //        {


//        //            try
//        //            {


//        //                EditCourse editedcourse = new EditCourse();

//        //                using (var client = new HttpClient())
//        //                {

//        //                    string baseUrl = _configuration["APIUrl:BaseUrl"];
//        //                    client.BaseAddress = new Uri(baseUrl);
//        //                    client.DefaultRequestHeaders.Clear();
//        //                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

//        //                    HttpResponseMessage response = client.GetAsync($"api/Course/GetCoursebyID/{id}").Result;

//        //                    if (response.IsSuccessStatusCode)
//        //                    {

//        //                        //Storing the response details recieved from web api
//        //                        var AppointResponse = response.Content.ReadAsStringAsync().Result;
//        //                        //Deserializing the response recieved from web api and storing into the Employee list
//        //#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.

//        //                        editedcourse = JsonConvert.DeserializeObject<EditCourse>(AppointResponse);
//        //#pragma warning restore CS8600 // Converting null literal or possible null value to non-nullable type.
//        //                    }


//        //                    return editedcourse;

//        //                }

//        //            }
//        //            catch (Exception ex)
//        //            {
//        //                // _logger.LogError(ex, ex.Message);
//        //                return null;
//        //            }


//        //        }
//        //public async Task OnGetAsync(long id)
//        //{
//        //    EditCourse editedcourse = new EditCourse();
//        //    string baseUrl = _configuration["APIUrl:BaseUrl"];

//        //    var client = _httpClientFactory.CreateClient();
//        //    client.BaseAddress = new System.Uri(baseUrl);

//        //    HttpResponseMessage response = await client.GetAsync($"api/Course/GetCoursebyID/{id}");

//        //    if (response.IsSuccessStatusCode)
//        //    {
//        //        var jsonResponse = await response.Content.ReadAsStringAsync();
//        //        editedcourse = JsonSerializer.Deserialize<EditCourse>(jsonResponse, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
//        //    }
//        //    else
//        //    {
//        //        // Handle error
//        //        ModelState.AddModelError(string.Empty, "Error retrieving courses.");
//        //    }
//        //}
//        //public async Task<IActionResult> OnPostAsync()
//        //{
//        //    if (ModelState.IsValid)
//        //    {
//        //        string baseUrl = _configuration["APIUrl:BaseUrl"];
//        //        var client = _httpClientFactory.CreateClient();

//        //        var jsonContent = System.Text.Json.JsonSerializer.Serialize(course);
//        //        var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");

//        //        var response = await client.PostAsync(baseUrl + "api/Course/UpdateCourse", httpContent);

//        //        if (response.IsSuccessStatusCode)
//        //        {
//        //            // Redirect or update UI upon success
//        //            TempData["Message"] = "Course Updated Successfully.";
//        //            // return RedirectToPage("Index");
//        //            return RedirectToPage("CreateCourse");
//        //        }
//        //        else
//        //        {
//        //            // Handle error (log, display message, etc.)
//        //            TempData["Message"] = "Error occured Updating courses.";
//        //            ModelState.AddModelError(string.Empty, "There was an error updating the data.");
//        //            return Page();
//        //        }

//        //    }


//        //    return RedirectToPage("Index");
//        //}

//        public async Task<IActionResult> OnGetAsync(long id)
//        {
//            string baseUrl = _configuration["APIUrl:BaseUrl"];
//            var client = _httpClientFactory.CreateClient();
//            client.BaseAddress = new Uri(baseUrl);

//            HttpResponseMessage response = await client.GetAsync($"api/Course/GetCoursebyID/{id}");

//            if (response.IsSuccessStatusCode)
//            {
//                var jsonResponse = await response.Content.ReadAsStringAsync();
//                EditCourse editedCourse = JsonSerializer.Deserialize<EditCourse>(jsonResponse, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

//                // Assuming you want to pass the course data to the view for editing
//                ViewData["EditedCourse"] = editedCourse;
//                // return Page();
//                return editedCourse;
//            }
//            else
//            {
//                ModelState.AddModelError(string.Empty, "Error retrieving course.");
//                return Page();
//            }
//        }

//        public async Task<IActionResult> OnPostEditAsync(EditCourse editedCourse)
//        {
//            string baseUrl = _configuration["APIUrl:BaseUrl"];
//            var client = _httpClientFactory.CreateClient();
//            client.BaseAddress = new Uri(baseUrl);

//            // Serialize the course data to JSON
//            string jsonContent = JsonSerializer.Serialize(editedCourse);
//            var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

//            HttpResponseMessage response = await client.PutAsync($"api/Course/EditCourse/{editedCourse.Id}", content);

//            if (response.IsSuccessStatusCode)
//            {
//                return RedirectToPage("CourseList"); // Redirect after successful edit
//            }
//            else
//            {
//                ModelState.AddModelError(string.Empty, "Error updating course.");
//                return Page();
//            }
//        }

//    }
//}
