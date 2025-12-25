<%@ page import="com.college.model.StudentProfile" %>
<%@ page import="com.college.dao.StudentProfileDAO" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    StudentProfile profile = null;

    if (userId != null) {
        StudentProfileDAO dao = new StudentProfileDAO();
        profile = dao.getProfileByUserId(userId);
    }

%>

<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>


<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="main-content container-fluid">
<%
String error = request.getParameter("error");
if (error != null) {
%>
    <div class="alert alert-danger text-center mt-2 col-md-8 mx-auto">
        <%= error %>
    </div>
<%
}
%>  
    <h3>Student Personal Details</h3>
         <%
            String msg = request.getParameter("msg");
         %>

        <% if ("submitted".equals(msg)) { %>
           <div class="alert alert-success alert-dismissible fade show mt-3">
                Profile Submitted Successfully
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
           </div>
        <% } else if ("edited".equals(msg)) { %>
           <div class="alert alert-info alert-dismissible fade show mt-3">
                Profile Edited Successfully
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
           </div>
        <% } %>

    <form action="studentProfile" method="post" enctype="multipart/form-data">

        <div class="row">
            <div class="col-md-6">
                <label>Full Name</label>
                <input type="text" name="fullName" class="form-control" 
                       value="<%= profile != null ? profile.getFullName() : "" %>" required>
            </div>

            <div class="col-md-6">
                <label>Father's Name</label>
                <input type="text" name="fatherName" class="form-control"
                       value="<%= profile != null ? profile.getFatherName() : "" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>Mother's Name</label>
                <input type="text" name="motherName" class="form-control"
                       value="<%= profile != null ? profile.getMotherName() : "" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>Mobile Number</label>
                <input type="text" name="mobile" pattern="[0-9]{10}"
                       class="form-control" 
                       value="<%= profile != null ? profile.getMobile() : "" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>Date of Birth</label>
                <input type="date" name="dob" class="form-control"
                       value="<%= profile != null ? profile.getDob() : "" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>Gender</label>
                <select name="gender" class="form-control" required>
                    <option value="">Select</option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>

            <div class="col-md-6 mt-2">
                <label>Email (Gmail only)</label>
                <input type="email" name="email" class="form-control"
                       placeholder="example@gmail.com" 
                       value="<%= profile != null ? profile.getEmail() :"" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>10th Percentage</label>
                <input type="number" step="0.01" name="tenthPercentage"
                       class="form-control" 
                       value="<%= profile != null ? profile.getTenthPercentage() : "" %>" required>
            </div>

            <div class="col-md-6 mt-2">
                <label>10th Marksheet</label>
                <input type="file" name="tenthMarksheet"
                       class="form-control" required>
                <small class="text-muted">
                       Upload pdf format!
                </small>
            </div>

            <div class="col-md-6 mt-2">
                <label>12th Percentage</label>
                <input type="number" step="0.01" name="twelfthPercentage"
                       class="form-control" 
                       value="<%= profile != null ? profile.getTwelfthPercentage() : "" %>" required>
                
            </div>

            <div class="col-md-6 mt-2">
                <label>12th Marksheet</label>
                <input type="file" name="twelfthMarksheet"
                       class="form-control" required>
                <small class="text-muted">
                       Upload pdf format!
                </small>
            </div>
            <div class="col-md-6 mt-2">
                <label>Passport Size Photo</label>
                <input type="file"
                       name="passportPhoto"
                       class="form-control"
                       accept="image/png, image/jpeg, image/jpg"
                       onchange="previewPhoto(this)"
                       <%= (profile == null || profile.getPassportPhoto() == null) ? "required" : "" %>>
                
                <small class="text-muted">
                       Upload a passport-size photo (JPG / PNG only. Max 2MB)
                </small>
                
                <% if (profile != null && profile.getPassportPhoto() != null) { %>
                   <div class="mt-3">
                       <label>Uploaded Passport Photo</label><br>
                       <img src="<%= request.getContextPath() %>/photo?userId=<%= userId %>"
                              style="width:150px;height:200px;border:1px solid #ccc;">
                       
                   </div>
                <% } %>
                
            </div>
            
        </div>

        <button class="btn btn-success mt-3">Submit Profile</button>
        
        
    </form>
</div>
<script>
function previewPhoto(input) {
    const file = input.files[0];

    if (file.size > 2 * 1024 * 1024) {
        alert("Photo size must be less than 2MB");
        input.value = "";
        return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
        const img = document.getElementById("photoPreview");
        img.src = e.target.result;
        img.style.display = "block";
    };
    reader.readAsDataURL(file);
}
setTimeout(() => {
    const alert = document.querySelector('.alert');
    if (alert) alert.remove();
}, 3000);

</script>


<%@ include file="footer.jsp" %>
