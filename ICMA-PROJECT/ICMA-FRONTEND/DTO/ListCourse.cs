namespace ICMA_LEARNFRONTEND.DTO
{
    public class ListCourse
    {
        public int course_id { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? Category { get; set; }
        public DateTime? registration_date { get; set; }
    }
}
