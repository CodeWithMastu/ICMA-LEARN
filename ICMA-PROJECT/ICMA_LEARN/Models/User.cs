namespace ICMA_LEARN.Models
{
    public class User
    {
        public int user_id { get; set; }
        public string? first_name { get; set; }
        public string? last_name { get; set; }
        public string? Email { get; set; }
        public string? password_hash { get; set; }
        public string? Role { get; set; }
        public string? Bio { get; set; }
        public DateTime registration_date { get; set; }
        public string? createdby { get; set; }
        public string? updatedby { get; set; }
        public DateTime? lastupdated { get; set; }
        public DateTime? deletedon { get; set; }
        public bool IsDeleted { get; set; } = false;
    }
}
