namespace ICMA_LEARN.Models
{
    public class Course
    {
        public int course_id { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public DateTime created_at { get; set; }
        public DateTime? updated_at { get; set; }
        public string? category { get; set; }
        public int? CategoryId { get; set; }
        public int? InstructorId { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? registration_date { get; set; }
        public string? UpdatedBy { get; set; }
        public string? DeletedBy { get; set; }
        public DateTime? DeletedOn { get; set; }
        public bool? IsDeleted { get; set; }

        // Navigation properties for Foreign Keys
        //public required Category Category { get; set; }
        public required Instructor Instructor { get; set; }
    }
}
