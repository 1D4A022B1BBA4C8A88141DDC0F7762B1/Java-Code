<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Apply For Course</title>
</head>
<body>

<div class="main-content container mt-4">

    <h3 class="mb-4">Student Admission Application</h3>

    <form method="post" action="apply" enctype="multipart/form-data">

        <div class="row g-3">

            <!-- Student Name -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Student Full Name</label>
                <input type="text" name="studentName" class="form-control" placeholder="Enter student's full name" required>
            </div>

            <!-- Father's Name -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Father's Name</label>
                <input type="text" name="fatherName" class="form-control" placeholder="Enter father's name" required>
            </div>

            <!-- Contact Number -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Contact Number</label>
                <input type="text" name="contactNo" class="form-control" placeholder="Enter mobile number" required>
            </div>

            <!-- DOB -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Date of Birth</label>
                <input type="date" name="dob" class="form-control" required>
            </div>

            <!-- Permanent Address -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Permanent Address</label>
                <textarea name="permanentAddress" class="form-control" rows="3"
                          placeholder="Enter permanent address" required></textarea>
            </div>

            <!-- Local Address -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Local / Communication Address</label>
                <textarea name="localAddress" class="form-control" rows="3"
                          placeholder="Enter local address"></textarea>
            </div>

            <!-- Receipt Number -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Admission Receipt Number</label>
                <input type="text" name="receiptNo" class="form-control"
                       placeholder="Enter admission receipt number" required>
            </div>

            <!-- Course -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Course Applied For</label>
                <select name="course" class="form-select" required>
                    <option value="">-- Select Course --</option>
                    <option>BA Tamil</option>
                    <option>B.Sc Mathematics</option>
                    <option>B.Sc Physics</option>
                    <option>BCA</option>
                    <option>Computer Science</option>
                    <option>BE</option>
                </select>
            </div>
            
            <!-- Joining Year -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Year of Study</label>
                <input type="number" name="year" class="form-control"
                       placeholder="Enter year (1 / 2 / 3 / 4)" required>
            </div>


            <!-- 10th Percentage -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">10th Standard Percentage</label>
                <input type="number" step="0.01" name="tenthPercentage"
                       class="form-control" placeholder="Enter 10th percentage" required>
            </div>

            <!-- 12th Percentage -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">12th Standard Percentage</label>
                <input type="number" step="0.01" name="twelfthPercentage"
                       class="form-control" placeholder="Enter 12th percentage" required>
            </div>
            
            <!-- Qualification -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Qualification</label>
                <input type="text" name="qualifications"
                       class="form-control"
                       placeholder="Eg: HSC, Diploma, ITI" required>
            </div>
            

            <!-- Signature -->
            <div class="col-md-6">
                <label class="form-label fw-semibold">Student Signature</label>
                <input type="file" name="signature" class="form-control" required>
                <small class="text-muted">Upload scanned signature (JPG / PNG)</small>
            </div>

        </div>

        <!-- Buttons -->
        <div class="mt-4">
            <button type="submit" class="btn btn-primary px-4">Submit Application</button>
            <a href="dashboard.jsp" class="btn btn-secondary px-4">Cancel</a>
        </div>

    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
