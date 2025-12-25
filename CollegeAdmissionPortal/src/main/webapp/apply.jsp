<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html><head><title>Apply</title></head>
<body>
<div class="main-content container-fluid">
    <h2>Apply For Course</h2>
    <form method="post" action="apply" class="mt-3">
      <div class="mb-3">
          <label class="form-label">Course</label>
          <input type="text" name="course" class="form-control" required/>
      </div>
      <div class="mb-3">
          <label class="form-label">Year</label>
          <input type="number" name="year" class="form-control" required/>
      </div>
      <div class="mb-3">
          <label class="form-label">Qualifications</label>
          <textarea name="qualifications" class="form-control"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Submit Application</button>
      <a href="dashboard.jsp" class="btn btn-secondary">Back</a>
    </form>
</div>
<%@ include file="footer.jsp" %>
</body></html>
